#!/bin/bash

dd if=/dev/zero of=busybox.img bs=1MiB count=512
mkfs.ext4 busybox.img
sudo mount busybox.img /mnt
sudo tar -xf busybox.tar.bz2 -C /mnt
sudo umount /mnt
