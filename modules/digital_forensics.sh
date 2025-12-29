# progress variables X means done
blast_radius="1"
secure_forensics="2"
patch_system="3"
restart_system="4"
core_dump="5"
logs_read="6"
determine_attack="7"
send_report="8"

user_choice=""
task_done=0


digital_forensics() {
	#dive

	printf "
=========================================================================
Your Submarine Command System (SCS) seems to be infected, you need to determine what happened and restore it to full functionality. 

To do so, you will have different tasks and operations you can do, the best way is to follow them step-by-step to ensure that you did not miss anything and that the infection is contained and cleaned. But you are free to choose them in any order you'd like.
=========================================================================

"
	read -p "Press ENTER to start investigation"

	# set system based on generated errors
	set_error_check_states

	clear

	forensic_action_menue
}


forensic_action_menue() {
game_finished=false
while [ "$game_finished" == "false" ]; do
	clear
	user_choice="0"
	until [[ $user_choice =~ ^[0-8]$ && $user_choice -gt 0 ]]; do
		printf "==============[ FORENSIC TASKS ]=================
[$blast_radius] - Check Submarine Systems
[$secure_forensics] - Secure forensic data
[$patch_system] - Patch systems
[$restart_system] - Restart systems and run integrity check
[$core_dump] - Analyse core dump
[$logs_read] - Analyse collected logs and evidence
[$determine_attack] - Determine origin of attack
[$send_report] - Send report to command
==================================================

SET PARAMETERS

RESTART PROCESS: $player_restart_process
APPLIED PATCHES: |"
printf ' %s |' "${player_patch_applied[@]}"

printf "

==================================================
"
	    read -p "What do you want to do?: " user_choice
	    if [[ ! $user_choice =~ ^[0-8]+$ || $user_choice -le 0 ]]; then
	        echo "Not a valid option"
	        sleep 2
	        clear
	    fi
	done

	case $user_choice in
		1)
			submarine_system_overview
			;;
		2)
			secure_evidence
			;;
		3)
			patching_system
			;;
		4)
			restart_computer
			;;
		5)
			read_dump
			;;
		6)
			read_logs_menu
			;;
		7)
			determine_enemy
			;;
		8)
			report_sent
			;;
	esac
done

}

secure_evidence() {
	printf "\n\nCOLLECTING FORENSIC DATA\n\n"

	loading_animation

	sleep 5

	printf "\n\nDATA COLLECTED AND STORED INSIDE EVIDENCE DIRECTORY\n\n"

	secure_forensics="X"

	read -p "Press ENTER to return to Forensics Menu: " 
}



restart_computer() {
 restart_process
}

read_dump() {
		if [[ "$system_has_restarted" == "false" ]]; then
		clear
		printf "==================================================
You need to patch and restart your system first. Investigating the cause may trigger the malware self-destruction function.
	==================================================\n\n"
		read -p "Press ENTER to return to to Forensics Menu"
	else
		printf "DUMP CORE"
	fi
}


determine_enemy(){
	echo "determine"
}

report_sent() {
	echo "report"
}



