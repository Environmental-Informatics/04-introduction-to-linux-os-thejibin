#!/bin/bash
## Backs up multiple directories with datetime stamp (YYYYMMDD_HHMM)
## Jibin 2020/03/20

## Create a for loop to iterate over the multiple arguments (input directories)
for ((argu=1; argu<=$#;argu++));
do
	## Store the datetime stamp (YYYYMMDD_HHMM)
	datetime=`date "+%Y%m%d_%H%M"`

	echo Backup of project folder ${!argu} starting...
	echo Backup is copied to the folder named: "${!argu}_$datetime"
	
	## To check if input directory really exists
	if [ ! -d ~/ABE65100/${!argu} ]
	then
		echo 'The given directory does not seem to exist (possible typo?)'
		exit
	fi
	# Do we already have a backup folder with same timestamp (just a second ago)?
	if [ -d ~/projectbackups/${!argu}_$datetime ]
	then
		echo 'This project already been backed up today, overwrite?'
		## Prompts user to input to overwrite action
		read answer
		if [ $answer != 'y' ]
		then
			exit
		fi
	else
		## Make a directory for backup of project folder
		mkdir ~/projectbackups/${!argu}_$datetime
	fi
	## Copy the contents from the working folder to backup folder
	cp -R ~/ABE65100/${!argu} ~/projectbackups/${!argu}_$datetime
	echo $'\n'
	echo Hurreh!! Backup of project folder ${!argu} is completed
	echo $'\n'
	echo "*******"
	echo $'\n'
done

