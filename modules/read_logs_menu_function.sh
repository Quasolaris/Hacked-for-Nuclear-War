read_logs_menu() {
		if [[ "$system_has_restarted" == "false" ]]; then
		clear
		printf "==================================================
You need to patch and restart your system first. Investigating the cause may trigger the malware self-destruction function.
==================================================\n\n"
		read -p "Press ENTER to return to to Forensics Menu"
	else
	user_choice="0"
	while [ "$user_choice" != "6" ]; do
	clear
	user_choice="0"
	until [[ $user_choice =~ ^[0-7]$ && $user_choice -gt 0 ]]; do
	printf "==============[ LOG FILES ]=================
[1] - SLBM Launch sequence output
[2] - Processes Log 
[3] - Files Accessed Logs
[4] - Commands Used Log
[5] - Read Cyber Attack Documentation
[6] - Go back to Forensics Menu
[7] - Mark task as DONE
==================================================

Indicators of Compromise (IoC) Database:
- HIDDEN COBRA\t=> https://attack.mitre.org/groups/G0032/
- APT28\t\t=> https://attack.mitre.org/groups/G0007/
- UNC3236\t=> https://attack.mitre.org/groups/G1017/
- APT40\t\t=> https://attack.mitre.org/groups/G0065/
- PLATINUM\t=> https://attack.mitre.org/groups/G0068/

==================================================
"
	    read -p "What do you want to do?: " user_choice
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
			less evidence/files.log 
			;;
		4)
			less evidence/commands.log 
			;;
		5)
			eval "$read_file_command" SCS_documentation/cyber_attack_documentation.md
			;;
		6)
			echo "6"
			;;
		7)
			logs_read="\e[32mX\e[0m"
			;;
	esac
	done
done
	fi
}

