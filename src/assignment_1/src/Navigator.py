#! /usr/bin/env python
from __future__ import print_function
import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from kobuki_msgs.msg import BumperEvent

#assumption: the height of any obstacle isn't lower than the cinder block

class self():

    # Move to a class variable so the callback can modify it
    move_cmd = Twist()
    processedRange = []
    check_left_first = 0
    check_left_first = 0
    bump = 0

    def __init__(self):
        # Initialise everything - see the lab manual for descriptions
        rospy.init_node('self', anonymous=False)
        rospy.loginfo("To stop TurtleBot CTRL + C")
        rospy.on_shutdown(self.shutdown)
        self.cmd_vel=rospy.Publisher('/cmd_vel_mux/input/teleop',Twist,queue_size=10)
        r = rospy.Rate(10)
        # Need to listen to the laser scanner
        #/camera
        rospy.Subscriber("/scan", LaserScan, self.OnLaserScan)
        rospy.Subscriber("/mobile_base/events/bumper", BumperEvent, self.OnBumperCallback)
        # Define the standard movement (forward at 0.2 m/s)
        # As long as you haven't ctrl + c keeping doing...
        while not rospy.is_shutdown():
            self.ObstacleAvoidance()
            self.cmd_vel.publish(self.move_cmd)
            r.sleep()


    def OnLaserScan(self, data):
        # Assuming the middle point is directly in front of the robot
        self.ProcessRange(data.ranges)
        
    def OnBumperCallback(self, data):
    # Use rosmsg info kobuki_msgs/BumperEvent to determine the fields for data
        if data.state == 1:
            self.bump = 1
            rospy.loginfo(self.bump)
            

    def TakingPhoto(self):
        camera = TakePhoto()
        #Take a photo

        #Use '_image_title' parameter from command line
        #Default value is 'photo.jpg'
        img_title = rospy.get_param('~image_title', 'photo.jpg')

        if camera.take_picture(img_title):
            rospy.loginfo("Saved image " + img_title)
        else:
            rospy.loginfo("No images received")

    def ProcessRange(self, data):
        unprocessedData = data[20:620]
        temp = 0
        count = 0
        processedRangeTemp = []
        
        for i in reversed(unprocessedData): 
            count += 1
            if count < 50:
                if(i >= 0 or i <= 0):
                    temp += int(i)
                else:
                    temp += 15
            else:
                count = 0
                processedElement = temp
                processedRangeTemp.append(processedElement)
                temp = 0
        
        self.processedRange = processedRangeTemp

        #element = 0
        #for i in self.processedRange:
            #rospy.loginfo("%f is %f", element, i)
            #element += 1

        #middle_value = len(unprocessedData) /2
        #rospy.loginfo(data[310:330])
            
    def ObstacleAvoidance(self):

        #positive angular value is anticlockwise and negative is clockwise
        # Assumption only take photo when the obstacle is detected by the middle 
        # 5 ranges.
        max_value = len(self.processedRange)
        middle_count = max_value / 2
        
        #making sure that the data has been processed initially
        if self.bump == 1:
            self.move_cmd.linear.x = -0.5
            self.move_cmd.angular.z = -3
            self.bump = 0
        else:
            if middle_count > 0:
                middle_value = self.processedRange[middle_count]
                first_value = self.processedRange[0]
                last_value = self.processedRange[max_value - 1]

                rospy.loginfo("first value : %f", first_value)
                rospy.loginfo("middle value : %f", middle_value)
                rospy.loginfo("last value : %f", last_value)
                if first_value > 30 and middle_value > 30 and last_value > 30:
                    rospy.loginfo("state 1")
                    self.move_cmd.linear.x = 0.2
                    self.move_cmd.angular.z = 0
                elif first_value > 30 and middle_value < 30 and last_value > 30:
                    rospy.loginfo("state 1")
                    if first_value > last_value:
                        self.move_cmd.linear.x = 0
                        self.move_cmd.angular.z = 0.7
                    else:
                        self.move_cmd.linear.x = 0
                        self.move_cmd.angular.z = -0.7
                elif first_value > 30 and middle_value > 30 and last_value < 30:
                    rospy.loginfo("state 3")
                    self.move_cmd.linear.x = 0
                    self.move_cmd.angular.z = -0.7
                elif first_value < 30 and middle_value > 30 and last_value > 30:
                    rospy.loginfo("state 4")
                    self.move_cmd.linear.x = 0
                    self.move_cmd.angular.z = 0.7
                elif first_value < 30 and middle_value < 30 and last_value > 30:
                    rospy.loginfo("state 5")
                    self.move_cmd.linear.x = -1
                    self.move_cmd.angular.z = -5
                elif first_value > 30 and middle_value < 30 and last_value < 30:
                    rospy.loginfo("state 6")
                    self.move_cmd.linear.x = -1
                    self.move_cmd.angular.z = 5
                elif first_value < 30 and middle_value > 30 and last_value < 30:
                    rospy.loginfo("state 7")
                    self.move_cmd.linear.x = 0
                    self.move_cmd.angular.z = -0.3
                elif first_value < 30 and middle_value < 30 and last_value < 30:
                    rospy.loginfo("state 8")
                    self.move_cmd.linear.x = 0
                    self.move_cmd.angular.z = -1
                else:
                    self.move_cmd.linear.x = 0
                    self.move_cmd.angular.z = -1
            

    def shutdown(self):
        # Stop turtlebot
        rospy.loginfo("Stop TurtleBot")

        # A default Twist has linear.x of 0 and angular.z of 0.  
        # So it'll stop TurtleBot
        self.cmd_vel.publish(Twist())
        # Sleep just makes sure TurtleBot receives the stop command prior to shutting
        # down the script
        rospy.sleep(1)

class TakePhoto:
    def __init__(self):

        self.bridge = CvBridge()
        self.image_received = False

        # Connect image topic
        img_topic = "/camera/rgb/image_raw"
        self.image_sub = rospy.Subscriber(img_topic, Image, self.callback)

        # Allow up to one second to connection
        rospy.sleep(1)

    def callback(self, data):

        # Convert image to OpenCV format
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

        self.image_received = True
        self.image = cv_image

    def take_picture(self, img_title):
        if self.image_received:
            # Save an image
            cv2.imwrite(img_title, self.image)
            return True
        else:
            return False
 
if __name__ == '__main__':
    self()
    rospy.init_node('take_photo', anonymous=False)