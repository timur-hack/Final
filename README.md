# Final
# 0. Я выбрал создание робота пылесоса
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
# 9 Создание ROS (пакета скрин 10,11)
catkin_create_pkg my_robot_package std_msgs rospy roscpp
cd my_robot_package
touch start_robot.launch
<launch>
  <!-- Узел для работы с Velodyne LIDAR -->
  <node pkg="velodyne_driver" type="velodyne_node" name="velodyne_node" output="screen"/>
  
  <!-- Узел для работы с ODrive контроллерами -->
  <node pkg="odrive_ros" type="odrive_node" name="odrive_node" output="screen"/>
  
  <!-- Узел для работы с XSens IMU -->
  <node pkg="xsens_driver" type="xsens_node" name="xsens_node" output="screen"/>
</launch> (создано с использованием ИИ)
# 10 Сборка рабочего пространства (скрин 12)
После добавления launch-файла необходимо пересобрать рабочее пространство
# 11 Создание launch-файла для веб-камеры скрин 13,14,15
<launch>
  <!-- Узел для работы с веб-камерой -->
  <node pkg="usb_cam" type="usb_cam_node" name="usb_cam" output="screen"/>
  
  <!-- Узел для запуска rviz -->
  <node pkg="rviz" type="rviz" name="rviz" output="screen">
    <arg name="config" default="$(find usb_cam)/rviz/camera_config.rviz"/>
  </node>
</launch>
создано с использованием ИИ
Сохраняю файл в папку launch под названием start_webcam.launch
catkin_make
Запуск launch-файла 
roslaunch start_webcam.launch
Успех 


# Схема подключения датчиков и исполнительных устройств

Вычислитель (ПК/Плата)
- **LIDAR Velodyne VLP-16**: подключение через 1Gbit Ethernet
- **Контроллер двигателей ODrive**: подключение через CAN
- **IMU XSens MTI-1**: подключение через SPI
- **Камера**: подключение через USB

### Описание подключения
1. **LIDAR Velodyne VLP-16**
   - Подключение: Ethernet
   - Используется для: Навигация и обнаружение препятствий
2. **Контроллер двигателей ODrive**
   - Подключение: CAN
   - Используется для: Управление моторами
3. **IMU XSens MTI-1**
   - Подключение: SPI
   - Используется для: Определение ориентации
4. **Камера**
   - Подключение: USB
   - Используется для: Обнаружение препятствий и визуальная навигаци
# !!!  Управление двигателями и подробное обьяснение правлением находится в директории motorcontrol 
