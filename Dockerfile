FROM ospreyrobotics/docker-ros2-iron:latest

# install gazebo & rviz2 packages
RUN apt-get update && apt-get install -y --no-install-recommends \
	ros-iron-gz-ros2-control \
	ros-iron-ros-ign-gazebo \ 
	ros-iron-rviz2 \
	&& rm -rf /var/lib/apt/lists/*
