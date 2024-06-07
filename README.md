# docker-ros2-iron-gz-rviz2
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg?style=plastic)](https://github.com/Osprey-Robotics/docker-ros2-iron-gz-rviz2/blob/master/LICENSE.txt)
[![Docker Image Status](https://github.com/Osprey-Robotics/docker-ros2-iron-gz-rviz2/actions/workflows/main.yml/badge.svg/)](https://github.com/Osprey-Robotics/docker-ros2-iron-gz-rviz2/actions)

Docker image with ROS 2 Iron Development Environment with Gazebo and RViz2
for various robotics purposes at UNF, club, research, and development.
This container contains the initial environment to build and run ROS 2
simulations using Gazebo and RViz2.

[Latest](https://hub.docker.com/r/ospreyrobotics/docker-ros2-iron-gz-rviz2/tags)

## Docker Pull Command
```bash
docker pull ospreyrobotics/docker-ros2-iron-gz-rviz2:latest
```

## enable X11 ssh forwarding
Enable in sshd and restart
```
sudo nano /etc/ssh/sshd_config

X11Forwarding yes
```

Enable X server access
```bash
sudo xhost +local:docker
sudo xhost +
```
## Development Environment Usage
Inside the container, there is an initial folder `/opt/ros_ws/src`
that is intended for use for to build the
[opsrey_ros](https://github.com/Osprey-Robotics/osprey_ros)
package. This can either be downloaded into the container, or the
recommended local mount, which allows for development using a local IDE. 

### Run Command on Linux
The following command will open a terminal to the newly created 
container that uses the host computers network. It also assumes that the
sources have been downloaded locally in `~/osprey_ros/` and shared as a
volume in the folder inside the container. Inside the container run `gazebo`
or `rviz2`, attach another shell, or run command again to run both.
```bash
docker run --net=host --rm -it --env DISPLAY=$DISPLAY --privileged \
    -v /dev:/dev -v /projects/osprey_ros/:/opt/ros_ws/src/osprey_ros \
    ospreyrobotics/docker-ros2-iron-gz-rviz2:latest 
```
