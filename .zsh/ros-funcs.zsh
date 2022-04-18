# source ros packages
sros1() {
  source /opt/ros/noetic/setup.zsh
  source ~/ros1ws/devel/setup.zsh
  alias tf='cd /var/tmp && rosrun tf view_frames && evince frames.pdf &'
}

#source ros 2
sros2() {
  source /opt/ros/foxy/setup.zsh
  source ~/ros2ws/install/setup.zsh
  #export ROS_DOMAIN_ID=25
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
}
# argcomplete for ros2 & colcon

#source px4 ros2
spx4() {
  sros2
  source ~/PX4_dev/px4_ros_com_ros2/install/setup.zsh
}

#source moveit workspace
init_moveit() {
  #source /media/phuoc101/KILANBAYBAY/Projects/robot_proj_2021/moveit_proj/ws_moveit/devel/setup.zsh;
  source ~/ws_moveit/devel/setup.zsh;
}

# source turtlebot simulation ros1
init_turtlebot3_ros1() {
  source /media/phuoc101/KILANBAYBAY/Projects/robot_proj_2021/turtlebot3_rospy/catkin_ws/devel/setup.zsh;
  export TURTLEBOT3_MODEL=waffle_pi;
  export MY_MAP_PATH=/media/phuoc101/KILANBAYBAY/Projects/robot_proj_2021/turtlebot3_rospy/slam_map
}

# source turtlebot simulation ros2
init_turtlebot3_ros2() {
  source /media/phuoc101/KILANBAYBAY/Projects/robot_proj_2022/turtlebot3_ws/install/setup.zsh
  source /media/phuoc101/KILANBAYBAY/Projects/robot_proj_2022/jetbot_ws/install/setup.zsh
  export TURTLEBOT3_MODEL=waffle_pi
}

export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/media/phuoc101/KILANBAYBAY/Projects/robot_proj_2022/turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models
export PATH=/usr/lib/ccache:$PATH

source /usr/share/gazebo/setup.sh
