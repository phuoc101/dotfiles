spythonpath() {
  export PYTHONPATH=/usr/lib/python3/dist-packages:/usr/local/lib/python3.8/dist-packages:/home/phuoc101/.local/lib/python3.8/site-packages:$PYTHONPATH
}
# source ros packages
sros_noetic() {
  source /opt/ros/noetic/setup.zsh
  alias tf='cd /var/tmp && rosrun tf view_frames && zathura frames.pdf &'
}

#source ros 2
sros_foxy() {
  source /opt/ros/foxy/setup.zsh
  # source ~/ros_foxyws/install/setup.zsh
  #export ROS_DOMAIN_ID=25
  # argcomplete for ros_foxy & colcon
  eval "$(register-python-argcomplete3 ros_foxy)"
  eval "$(register-python-argcomplete3 colcon)"
}

#source px4 ros_foxy
spx4_ros_noetic_gazebo() {
  sros_noetic
  source ~/px4_dev/PX4-Autopilot/Tools/simulation/gazebo/setup_gazebo.bash ~/px4_dev/PX4-Autopilot ~/px4_dev/PX4-Autopilot/build/px4_sitl_default
  export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$HOME/px4_dev/PX4-Autopilot
  export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$HOME/px4_dev/PX4-Autopilot/Tools/simulation/gazebo/sitl_gazebo
}

activate_torch_ros_venv() {
  source ~/torch_ros_venv/bin/activate
}

sros_noetic_pkgs() {
  sros_noetic
  source ~/ros_dev/ros_noetic_ws/devel/setup.zsh
}

sautosos() {
  sros_noetic
  source /media/phuoc101/imaunicorn/projects/autosos_dronesim/autosos_ros_ws/devel/setup.zsh
}

somni() {
  sros_foxy
  source /media/phuoc101/imaunicorn/projects/aeropolis_dev/repos/picam360_omniCV/OmniCV_ros_ws/install/setup.zsh
}

#source px4 ros_foxy
spx4_ros_foxy() {
  sros_foxy
  source ~/px4_dev/px4_ros_com_ros2/install/setup.zsh
}

syolo_ros_foxy() {
  sros_foxy
  source ~/ros_dev/ros2_ws/install/setup.zsh
}

#source moveit workspace
init_moveit() {
  #source /media/phuoc101/imaunicorn/Projects/robot_proj_2021/moveit_proj/ws_moveit/devel/setup.zsh;
  source ~/ws_moveit/devel/setup.zsh;
}

# source turtlebot simulation ros_noetic
init_turtlebot3_ros_noetic() {
  source /media/phuoc101/imaunicorn/Projects/robot_proj_2021/turtlebot3_rospy/catkin_ws/devel/setup.zsh;
  export TURTLEBOT3_MODEL=waffle_pi;
  export MY_MAP_PATH=/media/phuoc101/imaunicorn/Projects/robot_proj_2021/turtlebot3_rospy/slam_map
}

# source /usr/share/gazebo/setup.sh
# export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$HOME/.gazebo/models
