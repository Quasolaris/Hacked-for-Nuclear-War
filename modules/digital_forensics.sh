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
	echo "patching"
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