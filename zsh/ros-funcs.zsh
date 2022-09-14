spythonpath() {
  export PYTHONPATH=/usr/lib/python3/dist-packages:/usr/local/lib/python3.8/dist-packages:/home/phuoc101/.local/lib/python3.8/site-packages:$PYTHONPATH
}
# source ros packages
sros1() {
  source /opt/ros/noetic/setup.zsh
  alias tf='cd /var/tmp && rosrun tf view_frames && zathura frames.pdf &'
}

#source ros 2
sros2() {
  source /opt/ros/foxy/setup.zsh
  # source ~/ros2ws/install/setup.zsh
  #export ROS_DOMAIN_ID=25
  # argcomplete for ros2 & colcon
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
}

#source px4 ros2
spx4_ros1() {
  sros1
  source ~/ros_dev/PX4-Autopilot/Tools/setup_gazebo.bash ~/ros_dev/PX4-Autopilot ~/ros_dev/PX4-Autopilot/build/px4_sitl_default
  export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$HOME/ros_dev/PX4-Autopilot
  export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$HOME/ros_dev/PX4-Autopilot/Tools/sitl_gazebo
}

activate_torch_ros_venv() {
  source ~/torch_ros_venv/bin/activate
}

sros1_pkgs() {
  sros1
  source ~/ros_dev/ros1_ws/devel/setup.zsh
}

sautosos() {
  sros1
  source /media/phuoc101/imaunicorn/projects/autosos_dronesim/autosos_ros_ws/devel/setup.zsh
}

somni() {
  sros2
  source /media/phuoc101/imaunicorn/projects/aeropolis_dev/repos/picam360_omniCV/OmniCV_ros_ws/install/setup.zsh
}

#source px4 ros2
spx4_ros2() {
  sros2
  source ~/ros_dev/px4_ros_com_ros2/install/setup.zsh
}

syolo_ros2() {
  sros2
  source ~/ros_dev/ros2_ws/install/setup.zsh
}

#source moveit workspace
init_moveit() {
  #source /media/phuoc101/imaunicorn/Projects/robot_proj_2021/moveit_proj/ws_moveit/devel/setup.zsh;
  source ~/ws_moveit/devel/setup.zsh;
}

# source turtlebot simulation ros1
init_turtlebot3_ros1() {
  source /media/phuoc101/imaunicorn/Projects/robot_proj_2021/turtlebot3_rospy/catkin_ws/devel/setup.zsh;
  export TURTLEBOT3_MODEL=waffle_pi;
  export MY_MAP_PATH=/media/phuoc101/imaunicorn/Projects/robot_proj_2021/turtlebot3_rospy/slam_map
}

# source turtlebot simulation ros2
init_turtlebot3_ros2() {
  source /media/phuoc101/imaunicorn/Projects/robot_proj_2022/turtlebot3_ws/install/setup.zsh
  source /media/phuoc101/imaunicorn/Projects/robot_proj_2022/jetbot_ws/install/setup.zsh
  export TURTLEBOT3_MODEL=waffle_pi
}

# source /usr/share/gazebo/setup.sh
# export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$HOME/.gazebo/models
