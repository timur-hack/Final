FROM ros:noetic

RUN apt-get update && apt-get install -y \
    ros-noetic-velodyne \
    ros-noetic-odrive \
    ros-noetic-xsens-mti \
    openssh-server

COPY . /home/ros_ws/
WORKDIR /home/ros_ws

RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin_make"

