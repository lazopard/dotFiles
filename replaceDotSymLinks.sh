#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotFiles in ~/dotFiles
############################

########## Variables

dir=~/dotFiles                    # dotFiles directory
olddir=~/dotFiles_old             # old dotFiles backup directory
files="bashrc vimrc vim zshrc oh-my-zsh"    # list of files/folders to symlink in homedir

##########

# create dotFiles_old in homedir
echo "Creating $olddir for backup of any existing dotFiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotFiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotFiles in homedir to dotFiles_old directory, then create symlinks 
for file in $files; do
	echo "Moving any existing dotFiles from ~ to $olddir"
	mv ~/.$file ~/dotFiles_old/
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.$file
done
