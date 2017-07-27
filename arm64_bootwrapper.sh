#!/bin/bash

IMAGE=~/workspace/arm64/boot-wrapper-aarch64/linux-system.axf
#IMAGE=~/workspace/arm64/linux-stable/arch/arm64/boot/Image
#ROOTFS=initrd.squashfs.gz
ROOTFS=arm64/initrd.cpio.gz
cmdline="root=/dev/ram rdinit=sbin/init  init=/sbin/init console=ttyS0 earlyprintk=ttyS0 "
cmdline="rdinit=/sbin/init  console=ttyAMA0 "
#GNOME=gnome-terminal -x

$GNOME qemu-system-aarch64 -kernel $IMAGE  -append "$cmdline"  \
	 -m 1G -nographic \
	-cpu cortex-a57 -machine virt
#	-net nic,model=pcnet \
		#-s -S
#	-net tap,ifname=tap0,script=no,downscript=no 
		
