#! /usr/bin/env python
import rospy
from kobuki_msgs.msg import BumperEvent
from assignment_1.msg import bumper

class BumperNode:
    bump = 0

    def __init__(self):
        rospy.init_node('self', anonymous=False)
        rospy.Subscriber("/mobile_base/events/bumper", BumperEvent, self.OnBumperCallback)
        self.topic_pub = rospy.Publisher('/topic2', bumper, queue_size=1)

        bumper_message = bumper()
        bumper_message.bumper = self.bump
        r = rospy.Rate(10)

        while not rospy.is_shutdown():
            bumper_message.bumper = self.bump
            self.topic_pub.publish(bumper_message)
            r.sleep()

    def OnBumperCallback(self, data):
            self.bump = data.state
            rospy.loginfo(self.bump)

if __name__ == '__main__':
    BumperNode()