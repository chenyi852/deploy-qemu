#!/bin/bash

IMAGE=bzImage
#ROOTFS=initrd.squashfs.gz
ROOTFS=mkrootfs/initrd.cpio.gz
cmdline="root=/dev/ram rdinit=sbin/init  init=/sbin/init console=ttyS0 earlyprintk=ttyS0 "
cmdline="rdinit=/sbin/init  console=ttyS0 "
#GNOME=gnome-terminal -x

$GNOME qemu-system-x86_64 -cpu host -enable-kvm -kernel $IMAGE -initrd $ROOTFS -append "$cmdline"  \
	 -m 2G -nographic \
	-smp 4\
	-net nic,model=pcnet \
		#-s -S
#	-net tap,ifname=tap0,script=no,downscript=no 
		
