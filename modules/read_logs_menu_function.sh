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
[2] - System modules log files 
[3] - Computer user access logs
[4] - Communication logs
[5] - Read Cyber Attack Documentation
[6] - Launch Bash-Shell inside the evidence directory
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
			eval "$read_file_command" evidence/launch_computer_output.log 
			;;
		2)
			eval "$read_file_command" evidence/launch_computer_output.log 
			;;
		3)
			eval "$read_file_command" evidence/launch_computer_output.log 
			;;
		4)
			eval "$read_file_command" evidence/launch_computer_output.log 
			;;
		5)
			eval "$read_file_command" SCS_documentation/cyber_attack_documentation.md 
			;;
		6)
			cd evidence
			clear
			printf "=========[ TYPE exit TO CLOSE SHELL ]=========\n\n"
			bash
			clear
			cd ..
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

