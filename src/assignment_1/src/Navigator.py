#! /usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from assignment_1.msg import laser
from assignment_1.msg import bumper
from Photo import TakePhoto

class MovementNode():

    move_cmd = Twist()
    bump = 0
    processedRange = []
    count = 0

    def __init__(self):
        rospy.init_node('self', anonymous=False)
        rospy.loginfo("To stop TurtleBot CTRL + C")
        rospy.on_shutdown(self.shutdown)
        self.cmd_vel=rospy.Publisher('/cmd_vel_mux/input/teleop',Twist,queue_size=10)
        rospy.Subscriber('/topic1', laser, self.LaserData)
        rospy.Subscriber('/topic2', bumper, self.BumperData)
        # As long as you haven't ctrl + c keeping doing...
        while not rospy.is_shutdown():
            self.ObstacleAvoidance()
            self.cmd_vel.publish(self.move_cmd)
            rospy.sleep(0.2)

    def LaserData(self, data):
        self.processedRange = data.processedRange

    def BumperData(self, data):
        self.bump = data.bumper

    def TakePicture(self):
        self.count += 1
        camera = TakePhoto(self.count)

        # Take a photo

        # Use '_image_title' parameter from command line
        # Default value is 'photo.jpg'
        img_title = rospy.get_param('~image_title', 'photo.jpg')

        if camera.take_picture(img_title):
            rospy.loginfo("Saved image " + str(self.count) + img_title)
        else:
            rospy.loginfo("No images received")

        # Sleep to give the last log messages time to be sent

            
    def ObstacleAvoidance(self):
        if self.bump == 1:
            self.TakePicture()
            self.move_cmd.linear.x = -2
            self.move_cmd.angular.z = -2
            self.bump = 0
        else:
            max_value = len(self.processedRange)
            middle_count = max_value / 2
            #making sure there are values in the processedRange list
            if max_value > 0:
                middle_value1 = self.processedRange[middle_count-1]
                middle_value2 = self.processedRange[middle_count]
                first_value = self.processedRange[0]
                last_value = self.processedRange[max_value - 1]
                #going straight
                if first_value > 30 and (middle_value1 > 55 or middle_value2 > 55) and last_value > 30:
                    self.move_cmd.linear.x = 0.2
                    self.move_cmd.angular.z = 0
                #obstacle in front of robot
                elif first_value > 30 and (middle_value1 <= 55 or middle_value2 <= 55) and last_value > 30:
                    self.TakePicture()
                    #if left has more space
                    if first_value > last_value:
                        self.move_cmd.linear.x = 0
                        self.move_cmd.angular.z = 0.7
                    #if right has more space
                    else:
                        self.move_cmd.linear.x = 0
                        self.move_cmd.angular.z = -0.7
                #obstacle on the right
                elif first_value > 30 and (middle_value1 > 55 or middle_value2 > 55) and last_value <= 30:
                    self.TakePicture()
                    self.move_cmd.linear.x = 0
                    self.move_cmd.angular.z = 3
                #obstacle on the left
                elif first_value <= 30 and (middle_value1 > 55 or middle_value2 > 55) and last_value > 30:
                    self.TakePicture()
                    self.move_cmd.linear.x = 0
                    self.move_cmd.angular.z = -3
                #obstacle left and middle
                elif first_value <= 30 and (middle_value1 <= 55 or middle_value2 <= 55) and last_value > 30:
                    self.TakePicture()
                    self.move_cmd.linear.x = 0
                    self.move_cmd.angular.z = 3
                #obstacle middle and right
                elif first_value > 30 and (middle_value1 <= 55 or middle_value2 <= 55) and last_value <= 30:
                    self.TakePicture()
                    self.move_cmd.linear.x = 0
                    self.move_cmd.angular.z = -3
                #obstacle left and right
                elif first_value <= 30 and (middle_value1 > 55 or middle_value2 > 55) and last_value <= 30:
                    self.TakePicture()
                    self.move_cmd.linear.x = 0
                    self.move_cmd.angular.z = 3
                #obstacle left middle and right
                elif first_value <= 30 and (middle_value1 <= 55 or middle_value2 <= 55) and last_value <= 30:
                    self.TakePicture()
                    self.move_cmd.linear.x = 0
                    self.move_cmd.angular.z = 3
                #any other case
                else:
                    self.TakePicture()
                    self.move_cmd.linear.x = 0
                    self.move_cmd.angular.z = -3
            

    def shutdown(self):
        # Stop turtlebot
        rospy.loginfo("Stop TurtleBot")

        # A default Twist has linear.x of 0 and angular.z of 0.  
        # So it'll stop TurtleBot
        self.cmd_vel.publish(Twist())
        # Sleep just makes sure TurtleBot receives the stop command prior to shutting
        # down the script
        rospy.sleep(1)


if __name__ == '__main__':
    MovementNode()