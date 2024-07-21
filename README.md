# Final
# 1.Установлена связь с GutHub
# 2.У меня был установлен доступ через SSH поэтому могу прикрепить только скрин что он не требовал доступ (скрин1)
# 3.Создал документ Google docks https://docs.google.com/document/d/1CYkbAVDnep8zt1lgW97q35fW7tTvb0qOLJ15zwkCcA8/edit?usp=sharing
# 4 Создал (Dockerfile скрин2,скрин3)
FROM ros:noetic
RUN apt-get update && apt-get install -y \
ros-noetic-velodyne \
ros-noetic-odrive \
ros-noetic-xsens-mti \
openssh-server
COPY . /home/ros_ws/
WORKDIR /home/ros_ws
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin_make"
Эти команды обеспечивают, что все необходимые файлы будут находиться в нужной директории внутри контейнера, и что ROS-пакеты будут корректно собраны и настроены для работы в контейнере.
# 5. Сборка Docker-образа (скрин 4,5)
Допустим, образ будет называться ros_robot
docker build -t ros_robot .
# 6 Проверка контейнера скрин (скрин 6)
