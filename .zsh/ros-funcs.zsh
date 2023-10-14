# ---- ROS1 NOETIC -----
snoetic() {
  source /opt/ros/noetic/setup.zsh
  source ~/venvs/torch_ros_venv/bin/activate
}

source /usr/share/gazebo/setup.sh
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH$HOME/.gazebo/models
