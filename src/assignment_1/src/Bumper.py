#! /usr/bin/env python
import rospy
from kobuki_msgs.msg import BumperEvent
from assignment_1.msg import bumper

class BumperNode:
    #class specific variables used in multiple functions. 
    bump = 0

    def __init__(self):
        rospy.init_node('self', anonymous=False)
        #connecting to the bumper and custom topic2 topics
        rospy.Subscriber("/mobile_base/events/bumper", BumperEvent, self.OnBumperCallback)
        self.topic_pub = rospy.Publisher('/topic2', bumper, queue_size=1)
        #creating a custom bumper message that contains the bumpers state data.
        bumper_message = bumper()
        bumper_message.bumper = self.bump
        r = rospy.Rate(10)
        #While the program is running ensure that the message is being published.
        while not rospy.is_shutdown():
            bumper_message.bumper = self.bump
            self.topic_pub.publish(bumper_message)
            r.sleep()

    def OnBumperCallback(self, data):
            self.bump = data.state

if __name__ == '__main__':
    BumperNode()