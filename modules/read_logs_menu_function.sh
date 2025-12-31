read_logs_menu() {
		if [[ "$system_has_restarted" == "false" ]]; then
		clear
		printf "==================================================
You need to patch and restart your system first. Investigating the cause may trigger the malware self-destruction function.
==================================================\n\n"
		read -p "Press ENTER to return to to Forensics Menu"
	else
	user_choice="0"
	while [ "$user_choice" != "7" ]; do
	clear
	user_choice="0"
	until [[ $user_choice =~ ^[0-8]$ && $user_choice -gt 0 ]]; do
	printf "==============[ LOG FILES ]=================
[1] - SLBM Launch sequence output
[2] - Processes Log 
[3] - Protocols Log
[4] - Files Accessed Logs
[5] - Commands Used Log
[6] - Read Cyber Attack Documentation
[7] - Go back to Forensics Menu
[8] - Mark task as DONE
==================================================
"
	    read -p "What file do you want to analyse?: " user_choice
	    if [[ ! $user_choice =~ ^[0-7]+$ || $user_choice -le 0 ]]; then
	        echo "Not a valid option"
	        sleep 2
	        clear
	    fi
	    	case $user_choice in
		1)
			less evidence/launch_computer_output.log 
			;;
		2)
			less evidence/processes.log
			;;
		3)
			less evidence/protocols.log 
			;;
		4)
			less evidence/files.log 
			;;
		5)
			less evidence/commands.log 
			;;
		6)
			eval "$read_file_command" SCS_documentation/cyber_attack_documentation.md
			;;
		7)
			echo "7"
			;;
		8)
			logs_read="X"
			;;
	esac
	done
done
	fi
}

