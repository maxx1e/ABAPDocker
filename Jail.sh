#!/bin/bash
#####################################################
# Purpose: Prepare folders for the Docker Container
# Date: 26 June 2019
# Author: Maxim A. 
#####################################################
# Create physical volume
pvcreate /dev/sdb

# Create Volume group
vgcreate DATA /dev/sdb

# Create Logical group
lvcreate -L 199G -n download DATA

# Create File System
mkfs.ext3 "/dev/DATA/download" &
# Check that direcroty exist, if yes, than mount it, else create than mount. 
if [ -d "/install" ]
then
	mount /dev/DATA/download /install
else

	mkdir /install
	# Mount FIle System
	mount /dev/DATA/download /install
fi
