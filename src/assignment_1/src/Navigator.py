#! /usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan

class MoveAndScanNode():

    # Move to a class variable so the callback can modify it
    move_cmd = Twist()
    processedRange = []

    def __init__(self):
        # Initialise everything - see the lab manual for descriptions
        rospy.init_node('MoveAndScanNode', anonymous=False)
        rospy.loginfo("To stop TurtleBot CTRL + C")
        rospy.on_shutdown(self.shutdown)
        self.cmd_vel=rospy.Publisher('/cmd_vel_mux/input/teleop',Twist,queue_size=10)
        r = rospy.Rate(10)
        # Need to listen to the laser scanner
        rospy.Subscriber("/camera/scan", LaserScan, self.OnLaserScan)
        # Define the standard movement (forward at 0.2 m/s)
        MoveAndScanNode.move_cmd.linear.x = 0.1
        # As long as you haven't ctrl + c keeping doing...
        while not rospy.is_shutdown():
            self.cmd_vel.publish(MoveAndScanNode.move_cmd)
            r.sleep()

    def OnLaserScan(self, data):
        count = len(data.ranges)
        middle_value = data.ranges[cont / 2]
        # Assuming the middle point is directly in front of the robot
        rospy.loginfo("Front value is %f", middle_value)
        self.ProcessRange(data.ranges)
        #if middle_value <= 0.7 and MoveAndScanNode.move_cmd.linear.x > 0.0:
            #rospy.loginfo('Ouch - I hit something!')

            # This is a global variable we only need to set it once to stop the movement
            #MoveAndScanNode.move_cmd.linear.x = 0.0

    def ProcessRange(self, data):
        unprocessedData = data[20:620]
        
        temp = 0
        count = 0
        processedRangeTemp = []
        for i in unprocessedData: 
            count += 1
            if count <= 10:
                if(i >= 0 or i <= 0):
                    temp += i
                else:
                    temp += 50
            else: 
                count = 0
                processedElement = temp/10 -5
                processedRangeTemp.append(processedElement)

        rospy.loginfo("Front value is %f", len(unprocessedData))
        self.processedRange = processedRangeTemp 
            

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
    MoveAndScanNode()