#!/bin/bash

dest="./class"

menu=(basic vars facts secrets loops_n_conditions handlers error_handling jinja2 external_tasks roles)

choice=0
while [ "$choice" != 12 ]; do
	clear
	echo "Lab Exercise (Destination Directory: $dest)"
	echo "==========================================="
	
	for cnt in ${!menu[@]}; do
		echo "$[ ${cnt} + 1 ]) ${menu[$cnt]}"
	done
	
	echo "11) Change destination directory"
	echo -e "12) Exit\n\n"
	read -p "Please select a menu option: " choice

	case $choice in
		12 )
			echo
			break
			;;

		11 )
			read -p "Destination directory to copy labs: " tmp_dest
			if [ "$tmp_dest" == "" ]; then
				echo Invalid Input
				sleep 3
			else
			        ans='n'	

				if ! [ -d $tmp_dest ]; then
					read -p "Destination directory $tmp_dest doesn't exist. Create it? (y/n)" ans
					if [ "$ans" == 'y' -o "$ans" == 'Y' ]; then
						mkdir $tmp_dest
						dest=$tmp_dest
					elif ! [ "$ans" == 'n' -o "$ans" == 'N' ]; then
						echo Invalid input
						sleep 3
					fi
				else
					dest=$tmp_dest
				fi
			fi
			;;

		1|2|3|4|5|6|7|8|9|10 )
			for tmp_cnt in `seq 1 $choice`; do
				cp -r labs/${tmp_cnt}_${menu[$[ $tmp_cnt - 1 ]]}/* $dest
			done
			echo Done
			sleep 1
			;;
		* )
			echo -e "\aInvalid input"
			sleep 3
			;;
	esac
done

exit 0
