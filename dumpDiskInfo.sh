#!/bin/bash

echo
echo "DUMP DISK INFO"
echo "Copyright 2024 James Wilmoth" 
echo "This script is made available under the MIT License."
echo "See https://opensource.org/license/mit for details."
echo

# Prep #########################################
timestamp=$(date '+%Y%m%d_%H%M%S')
file="/root/${timestamp}_info.txt"

# Gather info ##################################

echo "Attempting to get hostname..."
if command -v "hostname" 2>&1 >/dev/null
then
	echo "# hostname #######################" &>> $file
	hostname &>> $file 
	echo &>> $file
else
	echo "hostname command not found. Skipping..."
fi

echo "Attempting to gather info from release files..."
if command -v "cat" 2>&1 >/dev/null
then 
	echo "# release files ##################" &>> $file
	cat /etc/*elease &>> $file 
	echo &>> $file
else
	echo "cat command not found. Skipping..."
fi

echo "Attempting to gather info from hostnamectl..."
if command -v "hostnamectl" 2>&1 >/dev/null
then 
	echo "# hostnamectl ####################" &>> $file
	hostnamectl &>> $file 
	echo &>> $file
else
	echo "hostnamectl command not found. Skipping..."
fi

echo "Attempting to gather info from lsb_release..."
if command -v "lsb_release" 2>&1 >/dev/null
then 
	echo "# lsb_release ####################" &>> $file
	lsb_release -a &>> $file 
	echo &>> $file
else
	echo "lsb_release command not found. Skipping..."
fi

echo "Attempting to gather info from fdisk..."
if command -v "fdisk" 2>&1 >/dev/null
then
	echo "# fdisk ##########################" &>> $file
	fdisk -l &>> $file 
	echo &>> $file
else
	echo "fdisk command not found. Skipping..."
fi

echo "Attempting to gather info from parted..."
if command -v "parted" 2>&1 >/dev/null
then
	echo "# parted #########################" &>> $file
	parted -l &>> $file 
	echo &>> $file
else
	echo "parted command not found. Skipping..."
fi


# Print path ###################################
echo "Output file = ${file}"
