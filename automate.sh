#!/bin/bash

DIR=/home/shakil/devilbox/data/www/
REAL_USER="shakil"

GREEN=`tput setaf 2`
RED=`tput setaf 1`

echo "[1] Create new Laravel project"
echo "[2] Create a basic project"
read -p "Enter your option: " OPTION

if [ $OPTION -eq 1 ]
then
read -p "${GREEN}Enter your laravel project name: " PROJECT_NAME 

if [ -d "$DIR$PROJECT_NAME/" ]
then	
	echo "${RED}Project directory already exist"
else
	`sudo -u $REAL_USER mkdir $DIR$PROJECT_NAME`
	`sudo -u $REAL_USER composer create-project laravel/laravel $DIR$PROJECT_NAME/$PROJECT_NAME`
	`cd $DIR$PROJECT_NAME && sudo -u $REAL_USER ln -s $PROJECT_NAME/public/ htdocs`
	echo "127.0.1.1	$PROJECT_NAME.ninja">> /etc/hosts
	echo "${GREEN}Project created"
fi

elif [ $OPTION -eq 2]
then

read -p "${GREEN}Enter your laravel project name: " PROJECT_NAME 

if [ -d "$DIR$PROJECT_NAME/" ]
then	
	echo "${RED}Project directory already exist"
else
	`mkdir $DIR$PROJECT_NAME`
	`mkdir $DIR$PROJECT_NAME"/htdocs"`
	echo "127.0.1.1	$PROJECT_NAME.ninja">> /etc/hosts
	echo "${GREEN}Project created"
fi

fi