#!/bin/bash
## Provides a report about a given directory
## Jibin 2020/03/20

## egrep '^-' groups all files
## egrep '^d' groups all directories

## Find the number of files in the given directory
files_no=`ls -l $1 | egrep '^-' | wc -l`

## Find the number of directories in the given directory
directories_no=`ls -l $1 | egrep '^d' | wc -l`

## Find the biggest file in the given directory
## ls -lS sort by file size, largest first 
## awk splits the ls -lS output demlimited by whitespace character by default
## and stores it in $n variable and can be accessed by '{print $n}'
biggest=`ls -lS $1 | egrep '^-' | head -1 | awk '{print $9}'`

## Find the most recently modified or created file
## ls -lt sort by modification time, newest first
recent=`ls -lt $1 | egrep '^-' | head -1 | awk '{print $9}'`

## Gives a list of people who owns the files in the directory
## %u and %g indicates the user name and group name of owner
people=`find $1 -printf '%u:%g\n' | sort -t: -u`

## Displays the output
echo $'\n'
echo Number of files in "$1" directory: $files_no
echo "*******"
echo Number of  directories in "$1" directory: $directories_no
echo "*******"
echo The biggest file in "$1" directory: $biggest
echo "*******"
echo The most recently modified or created file in "$1" directory: $recent
echo "*******"
echo The list of people who owns the files in "$1" directory: $people
echo "*******"
