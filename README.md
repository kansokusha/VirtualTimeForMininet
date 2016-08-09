# VT-Mininet: Virtual Time Enabled Mininet for SDN Emulation

## Installation
### Install Virtual Time Enabled Kernel
All the modification to kernel code are under directory "kernel_changes". Since littlepretty was using version 3.16.3, a patch based on that version is provided, as "VirtualTime.patch". 
Alternative way to modify and build virtual time enabled kernel:


* Download kernel 3.16.3 from [The Linux Kernel Archives](https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.16.3.tar.gz). Unzip it.
```
tar -zxvf linux-3.16.3.tar.gz
```
* Under "kernel_changes" directory, run following script so that source files under kernel_changes will replace orignal kernel code
```
./transfer.sh /Path/To/UnzippedKernel
```
* Change directory to unzipped kernel
	* You may need to configure kernel first. A easy way is to use existing configure file in your system
	```
	cp -vi /boot/config-`uname -r` .config
	yes "" | make oldconfig
	```
	* To compile kernel, modules and install them, you can run my script
	```
	sudo ./build_all.sh
	```
    * You may need to configure GRUB so that you can select which kernel to boot
    ```
    sudo vim /etc/default/grub
    GRUB_HIDDEN_TIMEOUT=15
    GRUB_HIDDEN_TIMEOUT_QUIET=false
    update-grub
    ```
    * Reboot and select the right kernel image in grub menu.

## Acknowledge
Implementation of virtual time is actually inspired by that of Jeremy Lamps. Great thanks for sharing his source code and providing a very detailed documentation.
