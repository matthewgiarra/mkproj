#!/bin/bash

# This script creates a new project directory structure
# on the Purdue Aether server called Shannon,
# at the directory location /home/shannon/a/aether/Projects
#
# Matthew Giarra
# matthew.giarra@gmail.com
# 2015-03-24

# Test number of input arguments. If less than one,
# then prompt the user for the name of the new project.
if [ "$#" -ne 1 ]; then
	# Read project name from command line input.
	read -p "Enter a new project name: " PROJ_NAME
	
	# Check if no response was entered
	# and exit if that's the case
	if [ -z $PROJ_NAME ]; then
		echo "No project name entered. Exiting."
		exit 1
	fi
	
else
	# Assign the project name as the first input argument
	PROJ_NAME=$1
fi

# This is the base directory containing all the project folders
BASE_DIR=/home/shannon/a/aether/Projects

# This is the parent directory of the new project that will be created.
PROJECT_PARENT_DIR=${BASE_DIR%%/}/${PROJ_NAME%%/}

# If the project folder exists, then inform the user and exit.
if [ -d $PROJECT_PARENT_DIR ]; then
	echo Directory already exists at $PROJECT_PARENT_DIR. Exiting.
	exit 1
fi

# Confirm that the user wants to make the project folder.
read -r -p "Create new project folder at $PROJECT_PARENT_DIR? [y/N] " response

# Check if a positive "yes" response was entered.
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    # Inform the user that a new project structure is being created.
	echo Creating new project directory structure at $PROJECT_PARENT_DIR
	
	# Create the analysis directories
	mkdir -p ${PROJECT_PARENT_DIR%%/}/analysis/src
	mkdir -p ${PROJECT_PARENT_DIR%%/}/analysis/data
	
	# Literature directory
	mkdir -p ${PROJECT_PARENT_DIR%%/}/literature
	
	# Results directory
	mkdir -p ${PROJECT_PARENT_DIR%%/}/results/figures
	mkdir -p ${PROJECT_PARENT_DIR%%/}/results/videos
	
	# Presentations directory
	mkdir -p ${PROJECT_PARENT_DIR%%/}/presentations
	
	# Manuscript directory
	mkdir -p ${PROJECT_PARENT_DIR%%/}/manuscripts
	
else
	# Inform the user that nothing is happening.
    echo Aborting. No action taken.
fi


