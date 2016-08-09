#!/bin/bash

download_kernel() {
    # get Linux kernel source code
    wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.16.3.tar.gz
    tar -xf linux-3.16.3.tar.gz
    rm linux-3.16.3.tar.gz
}

patch_kernel() {
    cd kernel_changes
    ./transfer.sh ../linux-3.16.3
    cd ..

    # build kernel
    cd linux-3.16.3
    cp -vi /boot/config-`uname -r` .config
    yes "" | make oldconfig
    ./build_all.sh
}

install_all() {
    download_kernel
    patch_kernel
}

while getopts "akp" option
do
    case $option in
    a) install_all;;
    k) download_kernel;;
    p) patch_kernel;;
    ?) echo "invalid argument";;
    esac
done
