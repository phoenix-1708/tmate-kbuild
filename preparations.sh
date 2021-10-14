#!/bin/bash

echo "Preparations"
sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y install git gh bc build-essential zip curl libstdc++6 git wget python gcc clang libssl-dev openssl rsync flex bison gcc-aarch64-linux-gnu
git config --global user.name "phoenix-1708"
git config --global user.email "harikumar1708@gmail.com"
git config --global color.ui true

echo "Setting up Environment"
git clone https://github.com/akhilnarang/scripts bscripts && cd bscripts && bash setup/android_build_env.sh && cd ..

echo "Cloning Sources"
git clone https://github.com/AdarshGrewal/android_kernel_xiaomi_sweet.git -b lineage-18.1

echo "copying necessary files"
cp kernel_setup.sh /android_kernel_xiaomi_sweet/kernel_setup.sh
cp kernel_build.sh /android_kernel_xiaomi_sweet/kernel_build.sh

echo "changing Directory to android_kernel_xiaomi_sweet"
cd android_kernel_xiaomi_sweet

echo "Build"
bash kernel_setup.sh
