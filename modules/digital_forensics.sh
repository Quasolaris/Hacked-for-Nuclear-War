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

dive() {
	printf "\t === DIVING TO 1800 FEET\n\n"
	mpv --no-terminal sounds/dive_crew_sound.opus &
	sleep 18
	printf "\t\t200 FEET\n\n"
	sleep 5
	printf "\t\t400 FEET\n\n"
	sleep 5
	printf "\t\t600 FEET\n\n"
	sleep 5
	printf "\t\t800 FEET\n\n"
	sleep 5
	printf "\t\t1000 FEET\n\n"
	sleep 5
	printf "\t\t1200 FEET\n\n"
	sleep 5
	printf "\t\t1400 FEET\n\n"
	sleep 5
	printf "\t\t1600 FEET\n\n"
	sleep 5
	printf "\t === REACHED 1800 FEET - SHIP IS STEADY\n\n"
}

blast_analysis() {
	echo "blast"
}

secure_evidence() {
	echo "evidence"
}

patching_system() {
user_choice="0"
while [ "$user_choice" != "4" ]; do
	clear
	user_choice="0"
	until [[ $user_choice =~ ^[0-8]$ && $user_choice -gt 0 ]]; do
	printf "==============[ PATCHING SYSTEM ]=================
[1] - Read ERROR Code Documentation
[2] - Decide on restart process [PROCESS SET: | $player_restart_process | ]
[3] - Apply patches and fixes [APPLIED PATCHES: |"
printf ' %s |' "${player_patch_applied[@]}"
printf " ]\n[4] - Go back to Forensic Menu
==================================================

SYSTEM ERRORS OF LAST CRASH:
= $player_error_one
= $player_error_two
= $player_error_three

"
	    read -p "What do you want to do?: " user_choice
	    if [[ ! $user_choice =~ ^[0-4]+$ || $user_choice -le 0 ]]; then
	        echo "Not a valid option"
	        sleep 2
	        clear
	    fi
	done

	case $user_choice in
		1)
			glow -p SCS_documentation/SCS_error_codes.md
			;;
		2)
			player_restart_process="0"
			while [ "$player_restart_process" == "0" ]; do
				clear
				until [[ $player_restart_process =~ ^[0-4]$ && $player_restart_process -gt 0 ]]; do
				printf "
				AVAILABLE RESTART PROCESSES

= 1) COLD
	Description: Complete shut down, power disconnect, reconnect of power, restarting system
	Restart time: 1 Minute(s)
	Software and Memory refresh mode: FULL
	IMPORTANT: Software needs to be reloaded from tape

= 2) WARM 
	Description: Software shut down, power stays connected, restarting system
	Restart time: 0.5 Minute(s)
	Software and Memory refresh mode: Firmware gets reloaded from on-board-memory, software is loaded from hard disk, memory gets re-zeroed

= 3) HOT 
	Description: Software reset, power stays connected, restarting operating system, firmware keeps running
	Restart time: 0.5 Minute(s)
	Software and Memory refresh mode: Software loaded from hard disk, memory gets re-zeroed

				"
				read -p "What process do you want to set?: " player_restart_process
			    if [[ ! $player_restart_process =~ ^[0-3]+$ || $player_restart_process -le 0 ]]; then
			        echo "Not a valid option"
			        sleep 2
			        clear
			    fi
			 	done
			done
			;;
		3)
			player_patch_choice="0"
			while [ "$player_patch_choice" == "0" ]; do
			clear
			until [[ $player_patch_choice =~ ^[0-6]$ && $player_patch_choice -gt 0 ]]; do
			printf "
				AVAILABLE PATCHES AND FIXES

= 1) FULL
	Description: 
	Restart time: 0.5 Minute(s)
	Effect: 

= 2) MEMORY 
	Description: 
	Restart time: 0.5 Minute(s)
	Effect: 

= 3) STORAGE 
	Description: 
	Restart time: 0.5 Minute(s)
	Effect: 

= 4) KERNEL RECOMPILE 
	Description: 
	Restart time: 0.5 Minute(s)
	Effect: 

= 5) BOOT SECTOR CHECK 
	Description: 
	Restart time: 0.5 Minute(s)
	Effect: 

= 6) ENABLE MEMORY PROTECTION 
	Description: 
	Restart time: 0.5 Minute(s)
	Effect: 
"
				read -p "What patch/fix do you want to apply?: " player_patch_choice
			    if [[ ! $player_patch_choice =~ ^[0-6]+$ || $player_patch_choice -le 0 ]]; then
			        echo "Not a valid option"
			        sleep 2
			        clear
			    
			else
				player_patch_applied+=("$player_patch_choice")
			fi
			 	done
			done
			;;
		4)
			echo "4"
			;;
		5)
			echo "5"
			;;
	esac
done

}

restart_computer() {
	echo "restarting"
}

read_dump() {
	echo "dump"
}

read_logs() {
	echo "log"
}

determine_enemy(){
	echo "determine"
}

report_sent() {
	echo "report"
}


forensic_action_menue() {
game_finished=false
while [ "$game_finished" == "false" ]; do
	clear
	user_choice="0"
	until [[ $user_choice =~ ^[0-8]$ && $user_choice -gt 0 ]]; do
		printf "==============[ FORENSIC TASKS ]=================
[$blast_radius] - Determine the blast radius of the cyber attack
[$secure_forensics] - Secure forensic data
[$patch_system] - Patch systems
[$restart_system] - Restart systems and run integrity check
[$core_dump] - Analyse core dump
[$logs_read] - Analyse launch computer logs
[$determine_attack] - Determine origin of attack
[$send_report] - Send report to command
==================================================

SET PARAMETERS

RESTART PROCESS: $player_restart_process
APPLIED PATCHES:"
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
			blast_analysis
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
			read_logs
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



digital_forensics() {
	#dive

	printf "
=========================================================================
Your Submarine Command System (SCS) seems to be infected, you need to determine what happened and restore it to full functionality. 

To do so, you will have different tasks and operations you can do, the best way is to follow them step-by-step to ensure that you did not miss anything and that the infection is contained and cleaned. But you are free to choose them in any order you'd like.
=========================================================================

"
	read -p "Press ENTER to start investigation"

	clear

	forensic_action_menue
}