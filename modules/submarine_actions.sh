dive() {
	clear
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

surfacing() {
	clear
	printf "\t === SURFACING TO 160 FEET\n\n"
	printf "\t\t1600 FEET\n\n"
	sleep 5
	printf "\t\t1400 FEET\n\n"
	sleep 5
	printf "\t\t1200 FEET\n\n"
	sleep 5
	printf "\t\t1000 FEET\n\n"
	sleep 3
	printf "\t\t800 FEET\n\n"
	sleep 3
	printf "\t\t600 FEET\n\n"
	sleep 2
	printf "\t\t400 FEET\n\n"
	sleep 2
	printf "\t\t200 FEET\n\n"
	sleep 1
	printf "\t === REACHED 160 FEET - SHIP IS STEADY\n\n"
}

emergency_blow() {
	clear
	printf "=================================================="
	printf "\n\t === COMMENCING EMERGENCY BLOW\n\n"
	mpv --no-terminal sounds/emergency_blow.opus 
	sleep 5
	printf "\t === REACHED SURFACE - SHIP IS STEADY\n\n"
	printf "=================================================="
	sleep 10
	print_player_stats
	pkill mpv
	exit 1
}


submarine_system_overview() {

	while [ "$user_choice" != "4" ]; do
	clear
	user_choice="0"
	until [[ $user_choice =~ ^[0-5]$ && $user_choice -gt 0 ]]; do
		printf "==============[ SUBMARINE SYSTEMS ]=================
[1] - Navigation & Communication
[2] - Weapons Control
[3] - Power Management
[4] - Go back to Forensics Menu
[5] - Mark task as DONE
=================================================="
printf "

	             ┌─────────────────────────┐
	             │Submarine Command System │
	             │         (SCS)           │
	             └──────────┬──────────────┘
	                        │
	    ┌───────────────────┼───────────────────┐
	    │                   │                   │
	NAVIGATION           WEAPONS              POWER 
	& COMMUNICATION      CONTROL             MANAGEMENT
	                       │                    │
	                   SLBM SYSTEM           REACTOR

"

printf "

==================================================
"
	    read -p "What do you want to do?: " user_choice
	    if [[ ! $user_choice =~ ^[0-6]+$ || $user_choice -le 0 ]]; then
	        echo "Not a valid option"
	        sleep 2
	        clear
	    fi
	done

	case $user_choice in
		1)	
			clear
			printf "
==================================================
"
			if [[ "$system_navigation_affected" == "true" ]]; then
				printf "\n ====[ \e[31mNAV SYSTEM AFFECTED\e[0m\n\n"
			else
				printf "\n ====[ \e[42mNAV SYSTEM HEALTHY\e[0m\n\n"
			fi

			if [[ "$system_communication_affected" == "true" ]]; then
				printf "\n ====[ \e[31mCOM SYSTEM AFFECTED\e[0m\n"
			else
				printf "\n ====[ \e[42mCOM SYSTEM HEALTHY\e[0m\n\n"
			fi
			printf "
==================================================
"
			read -p "Press ENTER to go back"
			;;
		2)
			clear
			printf "
==================================================
"
			if [[ "$system_weapons_affected" == "true" ]]; then
				printf "\n ====[ \e[31mWEAPON SYSTEM AFFECTED\e[0m\n\n"
			else
				printf "\n ====[ \e[42mWEAPON SYSTEM HEALTHY\e[0m\n\n"
			fi

			if [[ "$system_slbm_affected" == "true" ]]; then
				printf "\n ====[ \e[31mSLBM SYSTEM AFFECTED\e[0m\n"
			else
				printf "\n ====[ \e[42mSLBM SYSTEM HEALTHY\e[0m\n\n"
			fi
			printf "
==================================================
"
			read -p "Press ENTER to go back"
			;;
		3)
			clear
printf "
==================================================
"
			if [[ "$system_power_affected" == "true" ]]; then
				printf "\n ====[ \e[31mPOWER MANAGEMENT SYSTEM AFFECTED\e[0m\n\n"
			else
				printf "\n ====[ \e[42mPOWER MANAGEMENT HEALTHY\e[0m\n\n"
			fi

			if [[ "$system_reactor_affected" == "true" ]]; then
				printf "\n ====[ \e[31mREACTOR SYSTEM AFFECTED\e[0m\n

				MEASURED RADIOACTIVITY OVER THRESHOLD
				SURFACING SHIP AND EVACUATION IS ADVISED
				"
				mpv --no-terminal sounds/alarm_submarine_dive.opus &

				printf "\nShould we surface the ship?\n\n"

				read -p "(Y)es, surface the ship! | (N)o, we need to stay deep: " response
				if [[ "$response" = "y" || "$response" = "Y" ]]; then
					printf "
					        ===>\tSURFACING SHIP\n\n"
					        sleep 10
					        player_radiation_sickness=false
					        emergency_blow
				else
					printf "\n\nSUBMARINE WILL STAY UNDER WATER"
				fi

			else
				printf "\n ====[ \e[42mREACTOR SYSTEM HEALTHY\e[0m\n\n"
			fi
			printf "
==================================================
"
			read -p "Press ENTER to go back"
			;;
		4)
			
			;;
		5)
			blast_radius="\e[32mX\e[0m"
			;;
	esac
done

}