#!/bin/bash


get_script_dir () {
	SOURCE="${BASH_SOURCE[0]}"
	while [ -h "$SOURCE" ]; do
		DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
		SOURCE="$( readlink "$SOURCE" )"
		[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
	done
	echo $SOURCE	
	cur_dir=$(dirname $SOURCE)
	echo $cur_dir
	cd $cur_dir
	pwd	
#	echo "--------"
	#$( cd -P "$( dirname "$SOURCE" )" )
	#pwd
	#cur_dir=$(pwd)
	#echo $cur_dir
}

get_script_dir
#cur_dir=$(get_script_dir)
cd rootfs

find . | cpio -o --format=newc > ../initrd.cpio
cd ..
gzip -c initrd.cpio > initrd.cpio.gz

