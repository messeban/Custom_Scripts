#!/bin/bash

path="/home/essebane0ne/Documents/Projects/"

function create(){
	printf "####################################################"
	printf "\nMake a choice:\n"
	type=("NodeJS" "Bash" "Html")
	len=${#type[@]}
	for((i=0; i<len; i++))
		do 
		j=$(expr $i + 1)
		printf "\t"
		echo "[$j] ${type[$i]}"
		done
		printf "####################################################\n"
	read -p "Choose Programming Language [1-$len]:" choice
	if [ ! -z $choice ]
		then
			k=$(expr $choice - 1)
			printf "You chose ${type[$k]}\nConfirm[Y/n]?\n"
			read conf
			confirm=${conf,,}
			if [ $confirm = "y" ]
				then
					printf "You confirmed ${type[$k]}\n"
					printf "####################################################\n"

					read -p "Project Name: " name
					if [ ! -z "$name" ]
						then
								if [ -d $path"$name" ]
								then
									echo "$path$name"
									echo "Project exists Already"
								else
									case $choice in
										1)
											echo "end of nodejs"
											make_nodejs "$name"
											;;
										2)
											echo "Bash"
											make_empty "$name"
											;;
										3)
											echo "Html"
											make_Html "$name"
											;; 
										*)
											echo "Hmm, seems i've never used it."
											;;
									esac
									fi
					else
						echo "You haven't chosen a Project name"
						create
					fi
			else
			create
			fi
		else
			echo "You haven't chosen a Programming Language"
			create
		fi
		
}


function gp(){
	
		if [ "$#" -gt 0 ]
		then
			if [ -d $path"$1" ]
			then
				cd $path"$1"
				code .
				url=$(git config --get remote.origin.url)
					if [ ! -z "$url" ]
						then
							google-chrome $url </dev/null >/dev/null 2>&1 & disown
					fi
				clear
			else
				echo "Project Directory doesn't exist"
				cd $path
			fi
		else
			clear
			cd $path
			ls -l -a
		fi
}


function cpy(){
		cd
		cd ../../usr/local/bin/
		cp ../../../home/essebane0ne/Documents/Projects/Custom_Scripts/.my_commands.sh .my_commands.sh
		source .my_commands.sh
		gohome
}
function gohome(){
		cd
		cd Documents/Projects/Custom_Scripts
		code .
		clear
}
function gobin(){
		cd
		cd ../../usr/local/bin/
		ls -l -a
}
function goGithub(){
		if [ "$#" -gt 0 ]
			then
				if [ "$#" -eq 1 ]
					then
						google-chrome https://www.github.com/messeban/$1 </dev/null >/dev/null 2>&1 & disown
						clear
					else
						read -p "Please give only one repo:" choice
						goGithub $choice
				fi
		else
			google-chrome https://www.github.com/messeban/ </dev/null >/dev/null 2>&1 & disown
			clear
		fi
}
function google(){
	if [ "$#" -gt 0 ]
		then
			if [ "$#" -eq 1 ]
				then
					google-chrome https://www.google.com/search?q="$1" </dev/null >/dev/null 2>&1 & disown
					clear
				else
					link="$1"
					for (( c=2; c<="$#"; c++ ))
					do  
						link+="+${!c}"
					done
					google-chrome https://www.google.com/search?q="$link" </dev/null >/dev/null 2>&1 & disown
					clear
			fi
		else
			google-chrome https://www.google.com/ </dev/null >/dev/null 2>&1 & disown
			clear
		fi
}
function make_nodejs(){
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
	npm init
	code .
	google-chrome https://www.github.com/messeban/ </dev/null >/dev/null 2>&1 & disown
	echo "Project Directory created"
}

function make_empty(){
	mkdir $path"$1"
	cd $path"$1"

	touch "README.md"
	touch ".gitignore"

	git init
	git config --global user.name "Mourad Essebane"
	git config --global user.email "essebane.mourad@gmail.com"
	git add .
	git commit -m "Initial commit"
	code .
	echo "Project Directory created"
}

function make_Html(){
	mkdir $path"$1"
	cd $path"$1"
	touch index.html
	touch "README.md"
	touch ".gitignore"
	mkdir -p "public/css"
	mkdir -p "public/js"
	mkdir -p "public/images"
	touch "public/css/main.css"		
	touch "public/js/main.js"

	git init
	git config --global user.name "Mourad Essebane"
	git config --global user.email "essebane.mourad@gmail.com"
	git add .
	git commit -m "Initial commit"
	code .
	echo "Project Directory created"
}

function ns(){
	if [ $# -gt 0 ]
		then
			gohome
			echo "#!/bin/bash">"$1".sh
			chmod u+x "$1.sh"
			code "$1.sh"
		else
			read -p "Name your script:" choice
			ns $choice
		fi
}

function listFunctions(){
	func=($(grep -e "function" /home/essebane0ne/Documents/Projects/Custom_Scripts/.my_commands.sh | cut -f1 -d"{"))
	sumFunc=0
	for i in ${!func[@]}; do
		if [ ${func[i]} = "function" ]
			then echo ${func[i+1]}
			((sumFunc = sumFunc+1))
		fi
	done
	echo $sumFunc
}

function orgDown(){
	cd
	cd Downloads/Downloaded/
	today=$(date +'%Y%m%d')
	mkdir $today
	cd
	mv ~/Downloads/!(Downloaded) ~/Downloads/Downloaded/${today}
}

#For dummy commit for test
