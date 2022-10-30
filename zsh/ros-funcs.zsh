spythonpath() {
  export PYTHONPATH=/usr/lib/python3/dist-packages:/usr/local/lib/python3.8/dist-packages:/home/phuoc101/.local/lib/python3.8/site-packages:$PYTHONPATH
}
# source ros packages
snoetic() {
  source /opt/ros/noetic/setup.zsh
  alias tf='cd /var/tmp && rosrun tf view_frames && zathura frames.pdf &'
}


#source ros 2
sfoxy() {
  source /opt/ros/foxy/setup.zsh
  if [ -f /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh ]; then
    source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh
  fi
  if [ -f /usr/share/colcon_cd/function/colcon_cd.sh ]; then
    source /usr/share/colcon_cd/function/colcon_cd.sh
  fi
  # argcomplete for ros_foxy & colcon
  eval "$(register-python-argcomplete3 ros_foxy)"
  eval "$(register-python-argcomplete3 colcon)"
}

sgalactic() {
  source /opt/ros/galactic/setup.zsh
  if [ -f /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh ]; then
    source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh
  fi
  if [ -f /usr/share/colcon_cd/function/colcon_cd.sh ]; then
    source /usr/share/colcon_cd/function/colcon_cd.sh
  fi
  # argcomplete for ros_foxy & colcon
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
}

#source px4 ros_foxy
spx4_noetic_gazebo() {
  snoetic
  source ~/px4_dev/PX4-Autopilot/Tools/simulation/gazebo/setup_gazebo.bash ~/px4_dev/PX4-Autopilot ~/px4_dev/PX4-Autopilot/build/px4_sitl_default
  export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$HOME/px4_dev/PX4-Autopilot
  export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$HOME/px4_dev/PX4-Autopilot/Tools/simulation/gazebo/sitl_gazebo
}

activate_torch_ros_venv() {
  source ~/torch_ros_venv/bin/activate
}

snoetic_pkgs() {
  snoetic
  source ~/ros_dev/ros_noetic_ws/devel/setup.zsh
}

sautosos() {
  snoetic
  source /media/phuoc101/imaunicorn/projects/autosos_dronesim/autosos_ros_ws/devel/setup.zsh
}

somni() {
  sfoxy
  source /media/phuoc101/imaunicorn/projects/aeropolis_dev/repos/picam360_omniCV/OmniCV_ros_ws/install/setup.zsh
}

#source px4 ros_foxy
spx4_foxy() {
  sfoxy
  source ~/px4_dev/px4_ros_com_foxy/install/setup.zsh
}

spx4_galactic() {
  sgalactic
  source ~/px4_dev/px4_ros_com_galactic/install/setup.zsh
}

syolo_foxy() {
  sfoxy
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

source /usr/share/gazebo/setup.sh
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:$HOME/.gazebo/models
