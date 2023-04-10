spythonpath() {
  export PYTHONPATH=/usr/lib/python3/dist-packages:/home/phuoc101/.local/lib/python3.8/site-packages:$PYTHONPATH
}
# ---- ROS1 NOETIC -----
# source ros packages
snoetic() {
  source /opt/ros/noetic/setup.zsh
  # Source pytorch+rospy environment
  source ~/venvs/torch_noetic/bin/activate
  # Source ros pkgs
  export PYTHONPATH=$PYTHONPATH:/home/phuoc101/venvs/torch_noetic/lib/python3.8/site-packages
  # alias tf='cd /var/tmp && rosrun tf view_frames && zathura frames.pdf &'
  source ~/ros_dev/ros_noetic_ws/devel/setup.zsh
  source /media/phuoc101/imaunicorn/projects/autosos_dronesim/autosos_ros_ws/devel/setup.zsh
  source /media/phuoc101/imaunicorn/projects/ros_prj/catkin_ws/devel/setup.zsh
}

# ---- ROS2 FOXY ----
#source px4 ros_foxy
spx4_noetic_gazebo() {
  snoetic
  source ~/px4_dev/PX4-Autopilot/Tools/simulation/gazebo/setup_gazebo.bash ~/px4_dev/PX4-Autopilot ~/px4_dev/PX4-Autopilot/build/px4_sitl_default
  export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$HOME/px4_dev/PX4-Autopilot
  export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$HOME/px4_dev/PX4-Autopilot/Tools/simulation/gazebo/sitl_gazebo
}


snoetic_torch() {
  source ~/venvs/torch_noetic/bin/activate
  export PYTHONPATH=$PYTHONPATH:/home/phuoc101/venvs/torch_noetic/lib/python3.8/site-packages
}

snoetic_pkgs() {
  snoetic
  source ~/ros_dev/ros_noetic_ws/devel/setup.zsh
}


#source ros 2 foxy
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

#source px4 ros_foxy
spx4_foxy() {
  sfoxy
  source ~/px4_dev/px4_ros_com_foxy/install/setup.zsh
}

# ---- ROS2 GALACTIC ------
# source ros 2 galactic
sgalactic_autocmp() {
  # argcomplete for ros_galactic & colcon
  eval "$(register-python-argcomplete3 ros2)"
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
  source ~/venvs/torch_galactic/bin/activate
  export PYTHONPATH=$PYTHONPATH:/home/phuoc101/venvs/torch_galactic/lib/python3.8/site-packages
  sgalactic_autocmp
}


spx4_galactic() {
  sgalactic
  source ~/px4_dev/px4_ros_com_galactic/install/setup.zsh
  sgalactic_autocmp
}


#source moveit workspace
# init_moveit() {
#   #source /media/phuoc101/imaunicorn/Projects/robot_proj_2021/moveit_proj/ws_moveit/devel/setup.zsh;
#   source ~/ws_moveit/devel/setup.zsh;
# }

# # source turtlebot simulation ros_noetic
# init_turtlebot3_ros_noetic() {
#   source /media/phuoc101/imaunicorn/Projects/robot_proj_2021/turtlebot3_rospy/catkin_ws/devel/setup.zsh;
#   export TURTLEBOT3_MODEL=waffle_pi;
#   export MY_MAP_PATH=/media/phuoc101/imaunicorn/Projects/robot_proj_2021/turtlebot3_rospy/slam_map
# }

source /usr/share/gazebo/setup.sh
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH$HOME/.gazebo/models

sros_master_holybro() {
  export ROS_IP=192.168.50.24
  export ROS_MASTER_URI=http://192.168.50.194:11311
}
sros_master_nx1() {
  export ROS_IP=192.168.50.24
  export ROS_MASTER_URI=http://192.168.50.166:11311
}
