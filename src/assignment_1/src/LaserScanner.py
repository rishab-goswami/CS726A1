#! /usr/bin/env python
import rospy
from sensor_msgs.msg import LaserScan
from assignment_1.msg import laser

class LaserScannerNode:
    #class specific variables used in multiple functions. 
    processedRange = []

    def __init__(self):
        rospy.init_node('self', anonymous=False)
        #connecting to the scan and custom topic1 topics
        rospy.Subscriber("/scan", LaserScan, self.OnLaserScan)
        self.topic_pub = rospy.Publisher('/topic1', laser, queue_size=1)
        #Creating a custom message containing processed laser data
        laser_message = laser()
        laser_message.processedRange = self.processedRange
        r = rospy.Rate(10)
        #While the program is running ensure that the message is being published. 
        while not rospy.is_shutdown():
            laser_message.processedRange = self.processedRange
            self.topic_pub.publish(laser_message)
            r.sleep()

    def OnLaserScan(self, data):
        self.ProcessRange(data.ranges)

    #Function for processing the data
    def ProcessRange(self, data):
        #Taking the middle 600 values since it is then divisable by 50 giving the processed data a range of 5 degree per element
        unprocessedData = data[20:620]
        temp = 0
        count = 0
        processedRangeTemp = []
        #Reversing the data so the first value points to the left hand side and last value points to the right hand side
        for i in reversed(unprocessedData): 
            count += 1
            if count < 50:
                #Summing all the values to group them per 5 degrees. 
                if i >= 0 or i <= 0:
                    temp += int(i*100) 
                else:
                    #If the value is "nan" add a number higher than the laser scanner can see to represent it.
                    temp += 11 * 100
            else:
                count = 0
                processedElement = temp / 100
                processedRangeTemp.append(processedElement)
                temp = 0
        
        self.processedRange = processedRangeTemp

if __name__ == '__main__':
    LaserScannerNode()