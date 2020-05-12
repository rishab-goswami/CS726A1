#! /usr/bin/env python
import rospy
from sensor_msgs.msg import LaserScan
from assignment_1.msg import laser

class LaserScannerNode:

    processedRange = []

    def __init__(self):
        rospy.init_node('self', anonymous=False)
        rospy.Subscriber("/scan", LaserScan, self.OnLaserScan)
        self.topic_pub = rospy.Publisher('/topic1', laser, queue_size=1)

        laser_message = laser()
        laser_message.processedRange = self.processedRange
        r = rospy.Rate(10)

        while not rospy.is_shutdown():
            laser_message.processedRange = self.processedRange
            self.topic_pub.publish(laser_message)
            r.sleep()

    def OnLaserScan(self, data):
        self.ProcessRange(data.ranges)

    def ProcessRange(self, data):
        unprocessedData = data[20:620]
        temp = 0
        count = 0
        processedRangeTemp = []
        for i in reversed(unprocessedData): 
            count += 1
            if count < 50:
                if i >= 0 or i <= 0:
                    temp += int(i*100) 
                else:
                    temp += 6 * 100
            else:
                count = 0
                processedElement = temp / 100
                processedRangeTemp.append(processedElement)
                temp = 0
        
        self.processedRange = processedRangeTemp

if __name__ == '__main__':
    LaserScannerNode()