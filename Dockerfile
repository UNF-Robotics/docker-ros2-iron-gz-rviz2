FROM ospreyrobotics/docker-ros2-iron:latest

# install gazebo & rviz2 packages
RUN apt-get update && apt-get install -y --no-install-recommends \
	qt5ct \
	ros-iron-gz-ros2-control \
	ros-iron-ros-ign-gazebo \
	ros-iron-rviz2 \
	&& rm -rf /var/lib/apt/lists/*

# dark theme
COPY qt5ct/qt5ct.conf /root/.config/qt5ct/qt5ct.conf
COPY qt5ct/colors/Dracula.conf /root/.config/qt5ct/colors/Dracula.conf

RUN echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> /root/.bashrc
