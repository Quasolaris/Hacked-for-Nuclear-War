# progress variables X means done
blast_radius="1"
secure_forensics="2"
patch_system="3"
restart_system="4"
logs_read="5"
determine_attack="6"
send_report="7"

user_choice=""
task_done=0


digital_forensics() {
	#dive
	printf "
=========================================================================
Your Submarine Command System (SCS) seems to be infected, you need to determine what happened and restore it to full functionality. 

To do so, you first need to patch up your system and restart the SCS. Afterwards you can start investigating the logs to determine from where the cyber attack came from. Remember that it is advised to secure the evidence before the patching and restarting, as it may destroy log files.
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
[$logs_read] - Analyse collected logs and evidence
[$determine_attack] - Determine origin of attack
[$send_report] - Send report to command
==================================================

SET PARAMETERS

RESTART PROCESS:\t $player_restart_process
APPLIED PATCHES:\t |"
printf ' %s |' "${player_patch_applied[@]}"

printf "
ATTACKING APT GROUP:\t $player_chosen_enemy 

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
			read_logs_menu
			;;
		6)
			determine_enemy
			;;
		7)
			report_sent
			;;
	esac
done

}

secure_evidence() {
	clear
		if [[ "$system_has_restarted" == "true" ]]; then
				clear
		printf "==================================================
You did not secured the evidence before restarting the system. Some logs may be corrupted because of it.
==================================================\n\n"
			random_start=$(( 1 + RANDOM % 3 ))
	case "$random_start" in
		    1) 
		        echo "LOG FILE CORRUPT" > evidence/commands.log
		        ;;
		    2)
		        echo "LOG FILE CORRUPT" > evidence/processes.log
		        ;;
		    3)
		        echo "LOG FILE CORRUPT" > evidence/files.log
		        ;;
	esac
	fi
	player_secure_forensics=true
	printf "\n\nCOLLECTING FORENSIC DATA\n\n"

	loading_animation

	sleep 5

	printf "\n\nDATA COLLECTED AND STORED INSIDE EVIDENCE DIRECTORY\n\n"

	secure_forensics="\e[32mX\e[0m"

	read -p "Press ENTER to return to Forensics Menu: " 
}



restart_computer() {
 restart_process
}

determine_enemy(){
user_choice="0"
while [ "$user_choice" != "6" ]; do
	clear
	user_choice="0"
	until [[ $user_choice =~ ^[0-7]$ && $user_choice -gt 0 ]]; do
	printf "==============[ WHO IS RESPONSIBLE ]=================
[1] - HIDDEN COBRA 
[2] - APT28 
[3] - UNC3236
[4] - APT40
[5] - PLATINUM 
[6] - Go back to Forensics Menu
[7] - Mark task as DONE
==================================================

		CHOSEN ADVERSARY: $player_chosen_enemy

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
			player_chosen_enemy="HIDDEN COBRA"
			;;
		2)
			player_chosen_enemy="APT28"
			;;
		3)
			player_chosen_enemy="UNC3236"
			;;
		4)
			player_chosen_enemy="APT40"
			;;
		5)
			player_chosen_enemy="PLATINUM"
			;;
		6)
			echo "6"
			;;
		7)
			determine_attack="\e[32mX\e[0m"
			;;
	esac
	done
done
}

report_sent() {
	if [[ "$player_chosen_enemy" != "NaN" ]]; then
printf "

Do you want to compile and send the report? To send the report we will need to go up to 160 FEET, communication depth.

"
			read -p "(Y)es go up and send the report. (N)o, we need to investigate further. " response
				if [[ "$response" = "y" || "$response" = "Y" ]]; then
					sending_report_surface
				fi
	else
		printf "You did not determine who the adversary is. Go back and finish your investigation."
		sleep 5
	fi
}

sending_report_surface() {

	clear
	printf "
==================================
	COMPILING REPORT
==================================

"
	
		# removing old report
		rm evidence/report.md &> /dev/null
		
		# compile new report with set enemy
		cp template_logs/report_template.md evidence/report.md

		# replace place holder string with player chosen attacker
		sed -i "s/__APT_ACTOR__/${player_chosen_enemy}/g" evidence/report.md

		loading_animation

		printf "\n\n==================================\n\n"
		read -p "Report ready, press ENTER to read:"
		eval "$read_file_command" evidence/report.md 
		printf "\n\n==================================\n\n"
		read -p "Press ENTER to go up and send the report:"
		surfacing
		sleep 10
		clear
		printf "\n\n==================================

SENDING REPORT AND FORENSIC EVIDENCE

"
		mpv --no-terminal sounds/transmission.opus &
		loading_animation
		sleep 1
		printf "▣▣"
		sleep 1
		printf "▣▣"
		sleep 1
		printf "▣▣"
		sleep 1
		printf "▣▣"
		sleep 1
		printf "▣▣"
		sleep 1
		printf "▣▣"
		sleep 1
		printf "▣▣"
		printf "\n\n==================================\n\nTRANSMISSION COMPLETE\n\n=================================="
		sleep 15
		clear
		receiving_message
		printf "
REPORT RECEIVED

DIVE AND AWAIT CONNTACT OVER ELF

		"

		end_received_message
		sleep 15
		submrine_gets_attacked
		print_player_stats
		exit 1
}

submrine_gets_attacked() {

	clear
	printf "\nCONTACT SIERRA BRAVO 
	- DESIGNATE AS SIERRA-1 
	- BEARING 218 
	- COMES CLOSER\n"
	sleep 16
	printf "\nCONTACT SIERRA-1 IDENTIFIED AS SURFACE SHIP - POSSIBLE HOSTILE\n"
	sleep 6
	mpv --no-terminal --volume=50 --loop-file=inf sounds/sonar.opus &
	sleep 4
	printf "\nCONTACT SIERRA-1 TURNED ON SONAR\n"
	sleep 16
	printf "\nTORPEDO IN THE WATER TORPEDO IN THE WATER\n"
	mpv --no-terminal --loop-file=inf sounds/alarm_submarine_dive.opus &
	sleep 9
	mpv --no-terminal --volume=80 --loop-file=inf sounds/torpedo.opus &
	sleep 8
	mpv --no-terminal sounds/dive_crew_sound.opus &
	sleep 20
	clear
	for i in $(seq 1 15);
	do
	    printf "\nBRACE FOR IMPACT\n"
	    sleep 0.5
	done

	


}
