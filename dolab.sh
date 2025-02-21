#!/bin/bash

dest="~/proj"

select lab in basic vars facts secret loops_n_conditions\
    handlers error_handling jinja2 external_tasks roles\
    "Change default directory: ~/proj" exit; do
	[ "$REPLY" == 12 ] && break
	if [ "$REPLY" == 11 ]; then
		read -p "Destination directory to copy labs: " dest
		[ "$dest" == "" ] && exit 1
	fi
	
	[ -d $dest ] && cp -r labs/${REPLY}_$lab/* $dest || echo -a error
done

exit 0
