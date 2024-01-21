# docker-ros2-iron-gz-rviz2
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg?style=plastic)](https://github.com/Osprey-Robotics/docker-ros2-iron-gz-rviz2/blob/master/LICENSE.txt)
[![Docker Image Status](https://img.shields.io/docker/cloud/build/ospreyrobotics/docker-ros2-iron.svg?colorA=9977bb&style=plastic)](https://github.com/Osprey-Robotics/docker-ros2-iron-gz-rviz2/actions/workflows/main.yml/badge.svg/

Docker image with ROS 2 Iron Development Environment with Gazebo and RViz2
for UNF Osprey Robotics Club

[Latest](https://hub.docker.com/r/ospreyrobotics/docker-ros2-iron/tags)

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

## Run Command on Linux
Sample command includes local repository location of `/projects/osprey_ros`
change as needed to local repository to mount. Command also launches a shell
inside the container to run `igz gazebo` or `rviz2`, attach another shell,
or run command again to run both.
```bash
docker run --net=host --rm -it --env DISPLAY=$DISPLAY -v /dev/dri/card0:/dev/dri/card0 -v /projects/osprey_ros/:/opt/ros_ws/src/osprey_ros:latest 
```
