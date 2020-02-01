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
				mkdir routes/ models/ controllers/ util/
				mkdir -p "public/css/"
				mkdir "public/js"
				mkdir -p "views/includes"
				touch "views/includes/header.ejs"
				touch "views/includes/footer.ejs"

				git init
				git config --global user.name "Mourad Essebane"
				git config --global user.email "essebane.mourad@gmail.com"
				git add .
				git commit -m "Initial commit"
				code .
				google-chrome https://www.github.com/messeban/
				echo "Project Directory created"

			fi
		else
			read -p "no Args. Give name: " opt
			create opt
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
			read -p "no Args. Give name: " opt
			create "$opt"
		fi
}


function gp(){
	
		if [ "$#" -gt 0 ]
		then
			if [ -d $path"$1" ]
			then
				cd $path"$1"
				code .
				google-chrome https://www.github.com/messeban/"$1" & disown 
			else
				echo "Project Directory doesn't exist"
				cd $path
			fi
		else
				cd $path
				ls -l -a
		fi
}


function cpy(){
		cd
		cd ../../usr/local/bin/
		cp ../../../home/essebane0ne/Documents/Projects/Custom_Scripts/.my_commands.sh .my_commands.sh
		source .my_commands.sh
		gp
}

function gohome(){
		cd
		cd Documents/Projects/Custom_Scripts
}

function gobin(){
		cd
		cd ../../usr/local/bin/
}
function google(){
	if [ "$#" -gt 0 ]
		then
			google-chrome https://www.google.com/search?q="$1" & disown 

		else
			google-chrome https://www.google.com/ & disown 
			create opt
		fi
}
