# Virtual Time For Mininet
Add virtualtimeunshare() syscall in linux-3.16.3 kernel.

## Installation

    ./install.sh -a

## Update GRUB

    sed -e "s/GRUB_DEFAULT=0/GRUB_DEFAULT=\"Advanced options for Ubuntu>Ubuntu, with Linux 3.16.3\"/" -i /etc/default/grub
    update-grub

## Credit
This repository is forked from littlepretty/VirtualTimeForMininet.
