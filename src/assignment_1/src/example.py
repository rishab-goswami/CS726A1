import rospy
from geometry_msgs.msg import Twist
from kobuki_msgs.msg import BumperEvent # Import the bumper message

class MovementNode():

    # Define some state constants so we know what is happening
    MOVING_FORWARD = 0
    MOVING_BACKWARDS = 1
    TURNING = 2

    # Current state of the robot
    state = MOVING_FORWARD
    state_count = 0

    def __init__(self):
        # Initialise everything - see the lab manual for descriptions
        rospy.init_node('MovementNode', anonymous=False)
        rospy.loginfo("To stop TurtleBot CTRL + C")
        rospy.on_shutdown(self.shutdown)
        self.cmd_vel=rospy.Publisher('/cmd_vel_mux/input/teleop',Twist,queue_size=10)
        r = rospy.Rate(10);

        # Need to listen to the bumper sensor
        rospy.Subscriber("/mobile_base/events/bumper", BumperEvent, self.OnBumperCallback)

        # Define the standard movement (forward at 0.2 m/s)
        move_cmd = Twist()

        # As long as you haven't ctrl + c keeping doing...
        while not rospy.is_shutdown():
            if MovementNode.state == MovementNode.MOVING_FORWARD:
                move_cmd.linear.x = 0.2
                move_cmd.angular.z = 0.0
            elif MovementNode.state == MovementNode.MOVING_BACKWARDS:
                move_cmd.linear.x = -0.2
                move_cmd.angular.z = 0.0
                MovementNode.state_count -= 1
                if MovementNode.state_count <= 0:
                    MovementNode.state = MovementNode.TURNING
                    MovementNode.state_count = 20
            elif MovementNode.state == MovementNode.TURNING:
                move_cmd.linear.x = 0.0
                move_cmd.angular.z = 0.628
                MovementNode.state_count -= 1
                if MovementNode.state_count <= 0:
                    MovementNode.state = MovementNode.MOVING_FORWARD

            self.cmd_vel.publish(move_cmd)
            r.sleep()

    def OnBumperCallback(self, data):
        # Use rosmsg info kobuki_msgs/BumperEvent to determine the fields for data
        if data.state == 1 and MovementNode.state == MovementNode.MOVING_FORWARD:
            rospy.loginfo('Ouch - I hit something!')

            # Rather than change the velocity, we change the state
            # The actual action will now happen in the movement loop
            MovementNode.state = MovementNode.MOVING_BACKWARDS
            MovementNode.state_count = 10
                        
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