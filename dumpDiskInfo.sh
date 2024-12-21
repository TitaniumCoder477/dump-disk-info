#!/bin/bash

echo
echo "DUMP DISK INFO"
echo "Copyright 2024 James Wilmoth" 
echo "This script is made available under the MIT License."
echo "See https://opensource.org/license/mit for details."
echo

echo *** Please make sure to run this script as root or sudo! ***
echo

# Prep #########################################
timestamp=$(date '+%Y%m%d_%H%M%S')
file="/root/${timestamp}_info.txt"

# Gather info ##################################

echo "Attempting to get hostname..."
hostname --version &> /dev/null
if [ $? -eq 0 ]; then 
	echo "# hostname #######################" &>> $file
	hostname &>> $file 
	echo &>> $file
else
	echo "hostname command not found. Skipping..."
fi

echo "Attempting to gather info from release files..."
cat --version &> /dev/null
if [ $? -eq 0 ]; then 
	echo "# release files ##################" &>> $file
	cat /etc/*elease &>> $file 
	echo &>> $file
else
	echo "cat command not found. Skipping..."
fi

echo "Attempting to gather info from hostnamectl..."
hostnamectl --version &> /dev/null
if [ $? -eq 0 ]; then 
	echo "# hostnamectl ####################" &>> $file
	hostnamectl &>> $file 
	echo &>> $file
else
	echo "hostnamectl command not found. Skipping..."
fi

echo "Attempting to gather info from lsb_release..."
lsb_release --version &> /dev/null
if [ $? -eq 0 ]; then
	echo "# lsb_release ####################" &>> $file
	lsb_release -a &>> $file 
	echo &>> $file
else
	echo "lsb_release command not found. Skipping..."
fi

echo "Attempting to gather info from fdisk..."
fdisk --version &> /dev/null
if [ $? -eq 0 ]; then
	echo "# fdisk ##########################" &>> $file
	fdisk -l &>> $file 
	echo &>> $file
else
	echo "fdisk command not found. Skipping..."
fi

echo "Attempting to gather info from parted..."
parted --version &> /dev/null
if [ $? -eq 0 ]; then
	echo "# parted #########################" &>> $file
	parted -l &>> $file 
	echo &>> $file
else
	echo "parted command not found. Skipping..."
fi

echo "Attempting to gather info from df..."
df --version &> /dev/null
if [ $? -eq 0 ]; then
	echo "# df #########################" &>> $file
	df -lT &>> $file 
	echo &>> $file
else
	echo "df command not found. Skipping..."
fi


# Print path ###################################
echo "Output file = ${file}"
