#!/bin/bash

COMPILE_IMAGE=~/workspace/arm64/linux-stable/arch/arm64/boot/Image
KO_NAME=alloc.ko
TEST_CASE_NAME=rootfs/usr/local/$KO_NAME
COMPILE_TEST_CASE_NAME=~/workspace/opensrc/coloring/Cache-Partition-based-on-COLORIS/color/module/$KO_NAME

## if qemu image is older than compile image, then copy compiling image to the current directory.

###need root privilege
if [ "$TEST_CASE_NAME" -ot "$COMPILE_TEST_CASE_NAME" ]
then
	sudo cp $COMPILE_TEST_CASE_NAME $TEST_CASE_NAME
	sudo chmod +x $TEST_CASE_NAME
	
fi
