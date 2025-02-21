#!/bin/bash

dest="./class"

select lab in basic vars facts secret loops_n_conditions\
    handlers error_handling jinja2 external_tasks roles\
    "Change default directory: $dest" exit; do
	case $REPLY in
		12 )
			break
			;;

		11 )
			read -p "Destination directory to copy labs: " dest
			[ "$dest" == "" ] && exit 1

		        ans='n'	

			if ! [ -d $dest ]; then
				read -p "Destination directory $dest doesn't exist. Create it? (y/n)" ans
		
				if [ "$ans" == 'y' -o "$ans" == 'Y' ]; then
					mkdir $dest
				elif ! [ "$ans" == 'n' -o "$ans" == 'N' ]; then
					echo invalid input
					exit 1
				fi
			fi
			;;

		1|2|3|4|5|6|7|8|9|10 )
			cp -r labs/${REPLY}_$lab/* $dest
			echo Done
			;;
		* )
			echo -e "\aInvalid input"
			;;
	esac
done

exit 0
