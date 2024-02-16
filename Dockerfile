FROM ospreyrobotics/docker-ros2-iron:latest

# update base system
RUN apt-get update && apt-get upgrade -y --no-install-recommends

# install gazebo & rviz2 packages
RUN apt-get install -y --no-install-recommends \
	gazebo \
	qt5ct \
	ros-iron-ros-ign-gazebo \
	ros-iron-gazebo-ros2-control \
	ros-iron-gz-ros2-control \
	ros-iron-ros2controlcli \
	ros-iron-rviz2 \
	&& rm -rf /var/lib/apt/lists/*

# dark theme
COPY ignition/gazebo/6/gui.config /root/.ignition/gazebo/6/gui.config
COPY qt5ct/qt5ct.conf /root/.config/qt5ct/qt5ct.conf
COPY qt5ct/colors/Dracula.conf /root/.config/qt5ct/colors/Dracula.conf

RUN echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> /root/.bashrc
