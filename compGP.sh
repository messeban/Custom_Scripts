#Copy this program to /etc/bash_completion.d

#!/bin/bash


path="/home/essebane0ne/Documents/Projects/"
function _compGP(){
	  if [ "${#COMP_WORDS[@]}" != "2" ]; then
    return
  fi
	array=($path*/)
	for dir in "${array[@]}"
		do
			COMPREPLY+=($(compgen -W "${dir:37}" "${COMP_WORDS[1]}"))
		done
		}
	complete -F _compGP gp

		# do complete -W "$dir" gp; 
		# done

