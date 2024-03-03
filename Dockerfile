FROM ospreyrobotics/docker-ros2-iron:latest

# update base system
RUN apt-get update && apt-get upgrade -y --no-install-recommends

# install gazebo & rviz2 packages
RUN apt-get install -y --no-install-recommends \
	gazebo \
	nano \
	qt5ct \
	ros-iron-gazebo-ros2-control \
	ros-iron-grid-map-rviz-plugin \
	ros-iron-gz-ros2-control \
	ros-iron-nav2-bringup \
	ros-iron-nav2-rviz-plugins \
	ros-iron-ros-gz-bridge \
	ros-iron-ros-ign-gazebo \
	ros-iron-ros2controlcli \
	ros-iron-rqt-graph \
	ros-iron-rviz2 \
	&& rm -rf /var/lib/apt/lists/*

# dark theme
COPY ignition/gazebo/6/gui.config /root/.ignition/gazebo/6/gui.config
COPY qt5ct/qt5ct.conf /root/.config/qt5ct/qt5ct.conf
COPY qt5ct/colors/Dracula.conf /root/.config/qt5ct/colors/Dracula.conf

RUN echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> /root/.bashrc

# media/resource paths for Gazebo Classic and IGN
RUN echo 'export GAZEBO_MODEL_PATH=/opt/ros_ws/src/osprey_ros/worlds/models/:${GAZEBO_MODEL_PATH}' \
	>> /root/.bashrc
RUN echo 'export GZ_SIM_RESOURCE_PATH=${GAZEBO_MODEL_PATH}:${GZ_SIM_RESOURCE_PATH}' \
	>> /root/.bashrc

# common commands added to history
RUN echo "rviz2 -d src/osprey_ros/sim/robot.rviz" \
	>> /root/.bash_history
RUN echo "ros2 launch osprey_ros ign_gazebo.launch.py classic:=True world:=artemis_arena" \
	>> /root/.bash_history
RUN echo "ros2 launch osprey_ros ign_gazebo.launch.py world:=artemis_arena" \
	>> /root/.bash_history
RUN echo "ros2 launch nav2_bringup navigation_launch.py use_sim_time:=true" \
	>> /root/.bash_history

