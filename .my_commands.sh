#!/bin/bash

path="/home/essebane0ne/Documents/Projects/"

function create_nodejs(){

if [ "$#" -gt 0 ]
then
	if [ -d $path"$1" ]
	then
	echo "Project exists Already"
	else
	mkdir $path"$1"
	cd $path"$1"
	touch "app.js"
	touch "README.md"
	touch ".gitignore"
	mkdir $path"$1/""routes/"
	mkdir $path"$1/""views/"
	mkdir $path"$1/""models/"
	mkdir $path"$1/""controllers/"
	git init
	git config --global user.name "Mourad Essebane"
	git config --global user.email "essebane.mourad@gmail.com"
	git add .
	git commit -m "Initial commit"
	echo "Project Directory created"
	fi
else
	echo "no Args. Give name"
	read  newPath
	bash create_nodejs.sh $newPath
fi
}
function create(){

if [ "$#" -gt 0 ]
then
	if [ -d $path"$1" ]
	then
	echo "Project exists Already"
	else
	mkdir $path"$1"
	cd $path"$1"

	touch "README.md"
	touch ".gitignore"

	git init
	git config --global user.name "Mourad Essebane"
	git config --global user.email "essebane.mourad@gmail.com"
	git add .
	git commit -m "Initial commit"
	echo "Project Directory created"
	fi
else
	echo "no Args. Give name"
	read  newPath
	bash create.sh $newPath
fi
}
