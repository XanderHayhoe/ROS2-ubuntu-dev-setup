#!/bin/bash

# update
sudo apt update && sudo apt upgrade -y

# install C++ compilers and build tools
sudo apt install -y build-essential cmake gdb

# install vscode
sudo apt install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install -y code

# install ROS2 Humble
sudo apt install -y software-properties-common
sudo add-apt-repository universe
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | sudo tee /usr/share/keyrings/ros-archive-keyring.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt install -y ros-humble-desktop

# source ROS2 setup file (can also add to .bashrc for persistence)
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc

# install Python
sudo apt install -y python3 python3-pip python3-venv

# install Terminator
sudo apt install -y terminator

# clean
sudo apt autoremove -y
sudo apt clean

echo "All installations are complete. Please restart your terminal or source your .bashrc file for the changes to take effect."
