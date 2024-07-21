# Final
# 1.Установлена связь с GitHub
# 2.У меня был установлен доступ через SSH поэтому могу прикрепить только скрин что он не требовал доступ (скрин1)
# 3.Создал документ в котором будут опубликованы все скрины (Google docks: https://docs.google.com/document/d/1CYkbAVDnep8zt1lgW97q35fW7tTvb0qOLJ15zwkCcA8/edit?usp=sharing)
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
# 5. Сборка Docker-образа (скрин 4)
Допустим, образ будет называться ros_robot
docker build -t ros_robot .
# 6 Проверка контейнера скрин (скрин 5)
Успех
# 7 Создание рабочей области catkin ( скрины 6,7)
Catkin — это система сборки, используемая в ROS для управления исходным кодом.
Рабочая область catkin представляет собой каталог, в котором вы можете создавать
или изменять собственные пакеты ROS.
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
Это создаст новый каталог catkin_ws в вашем домашнем каталоге, а также каталог src
внутри catkin_ws.
# 8 Инициализация рабочей области (скрины 8,9) 
catkin_init_workspace src
Это создаст ссылку на CMakeLists.txt в каталоге src, который необходим для
компиляции исходного кода.
Сборка рабочей области
catkin_make
Это создаст два дополнительных каталога в каталоге catkin_ws: build и devel,
которые содержат продукты сборки и среды сборки соответственно. (Взято из Скрипты к видео №5 модуль 1 ) 

