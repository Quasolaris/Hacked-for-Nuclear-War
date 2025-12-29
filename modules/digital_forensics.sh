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

cold_reboot=false

run_system_check=false
run_memory_check=false
run_storage_check=false
run_kernel_recompile=false
run_boot_check=false
run_enable_memprotect=false

loading_animation() {
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
	sleep 1
	printf "▣▣"
	sleep 1
	printf "▣▣"
	sleep 1
	printf "▣▣"
	sleep 1
	printf "▣▣"
}
set_error_check_states() {
	error_string="$player_error_one $player_error_two $player_error_three"
		if [[ "$error_string" == *"A1F0C0FFEE"* ]]; then
			system_memprotection_check=false
		fi
		if [[ "$error_string" == *"B2DEADBEEF"* ]]; then
			system_kernel_check=false
		fi
		if [[ "$error_string" == *"C300MBR404"* ]]; then
			system_boot_check=false
		fi
		if [[ "$error_string" == *"D4STACK0VER"* ]]; then
			system_memory_check=false
		fi
		if [[ "$error_string" == *"E5FIRMWAREX"* ]]; then
			system_full_check=false
		fi
		if [[ "$error_string" == *"F600NULLPTR"* ]]; then
			system_storage_check=false
		fi
}


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

blast_analysis() {

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
			blast_radius="X"
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
[5] - Mark task as DONE
==================================================

SYSTEM ERRORS SINCE LAST REBOOT:
= $player_error_one
= $player_error_two
= $player_error_three



ERROR CODE LOOKUP

0xA1F0C0FFEE\t MEMORY INTEGRITY FAILURE
0xB2DEADBEEF\t KERNEL CONTROL FAILURE
0xC300MBR404\t BOOT RECORD FAILURE
0xD4STACK0VER\t EXECUTION STACK FAILURE
0xE5FIRMWAREX\t FIRMWARE INTEGRITY FAILURE
0xF600NULLPTR\t LOGIC EXECUTION FAILURE

==================================================
"
	    read -p "What do you want to do?: " user_choice
	    if [[ ! $user_choice =~ ^[0-5]+$ || $user_choice -le 0 ]]; then
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
				until [[ $player_restart_process =~ ^[0-3]$ && $player_restart_process -gt 0 ]]; do
				printf "
				AVAILABLE RESTART PROCESSES

= 1) COLD
	Description: Complete shut down, power disconnect, reconnect of power, restarting system
	Restart time: 2 Minute(s)
	Software and Memory refresh mode: FULL
	IMPORTANT: Software needs to be reloaded from tape, Firmware needs to be re-flashed by an engineer

= 2) WARM 
	Description: Software shut down, power stays connected, restarting system
	Restart time: 1 Minute(s)
	Software and Memory refresh mode: Firmware gets reloaded from on-board-memory, software is loaded from tape, memory gets re-zeroed

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

= 1) FULL SYSTEM CHECK
	Description: 
	Restart time: 0.5 Minute(s)
	Effect: 

= 2) MEMORY CHECK
	Description: 
	Restart time: 0.5 Minute(s)
	Effect: 

= 3) STORAGE CHECK
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
				case $player_patch_choice in
				1)
					system_full_check=true
					run_system_check=true
					;;
				2)
					system_memory_check=true
					run_memory_check=true
					;;
				3)
					system_storage_check=true
					run_storage_check=true
					;;
				4)
					system_kernel_check=true
					run_kernel_recompile=true
					;;
				5)
					system_boot_check=true
					run_boot_check=true
					;;
				6)
					system_memprotection_check=true
					run_enable_memprotect=true
					;;
				esac
				player_patch_applied+=("$player_patch_choice")
				player_patch_applied=($(echo ${player_patch_applied[@]} | tr ' ' $'\n' | sort -u))
			fi
			 	done
			done
			;;
		4)
			echo "4"
			;;
		5)
			patch_system="X"
			;;
	esac
done

}

restart_computer() {

clear
printf "
============================================
SYSTEM RESTART PROCESS
============================================

"
read -p "Do you want to restart the system? (y/n): " response
if [[ "$response" = "y" || "$response" = "Y" ]]; then

	printf "
============================================
SYSTEM RESTART INITIATED
============================================

PREPARING SYSTEM

"
	loading_animation
	sleep 1

	if [[ "$run_system_check" == "true" ]]; then
	printf "\n\nRUNNING FULL SYSTEM CHECK\n\n"
	loading_animation
	printf "\n\nFINSIHED FULL SYSTEM CHECK\n\n"
	fi
	if [[ "$run_memory_check" == "true" ]]; then
	printf "\n\nRUNNING MEMORY CHECK\n\n"
	loading_animation
	printf "\n\nFINISHED MEMORY CHECK\n\n"
	fi
	if [[ "$run_storage_check" == "true" ]]; then
	printf "\n\nRUNNING STORAGE CHECK\n\n"
	loading_animation
	printf "\n\nFINISHEDSTORAGE CHECK\n\n"
	fi
	if [[ "$run_kernel_recompile" == "true" ]]; then
	printf "\n\nRECOMPILING KERNEL\n\n"
	loading_animation
	printf "\n\nFINISHED KERNEL\n\n"
	fi
	if [[ "$run_boot_check" == "true" ]]; then
	printf "\n\nRUNNING BOOT SECTOR CHECK\n\n"
	loading_animation
	printf "\n\nFINISHED BOOT SECTOR CHECK\n\n"
	fi
	if [[ "$run_enable_memprotect" == "true" ]]; then
	printf "\n\nENABLING MEMORY PROTECTION\n\n"
	loading_animation
	printf "\n\nMEMORY PROTECTION ENABLED\n\n"
	fi

	sleep 5
	clear
	printf "
============================================
SYSTEM SHUTDOWN
============================================

"
	sleep 15

	if [[ "$player_restart_process" == "1" ]]; then
		printf "\n\nDISCONNECTING POWER FOR COLD RESTART\n\n"
		sleep 10
		mpv --no-terminal sounds/power_out.opus 
		sleep 10
		mpv --no-terminal sounds/power_on.opus
		sleep 10
		printf "\n\nREFLASHING FIRMWARE\n\n"
		loading_animation
		printf "\n\nFIRMWARE FLASHED\n\n"
		printf "\n\nLOADING OPERATING SYSTEM FROM TAPE"
		mpv --no-terminal sounds/tape_load.opus
		printf "\n\nOPERATING SYSTEM LOADED" 
		sleep 10
	elif [[ "$player_restart_process" == "2"  ]]; then
		printf "\n\nRELOADING FIRMWARE\n\n"
		loading_animation
		printf "\n\nLOADING OPERATING SYSTEM FROM TAPE"
		mpv --no-terminal sounds/tape_load.opus
		printf "\n\nOPERATING SYSTEM LOADED" 
		sleep 10
	fi


	clear
	mpv --no-terminal sounds/computer_sound.opus &
	printf "\n[INIT]\n"
	loading_animation 
	loading_animation
	loading_animation 
	sleep 3
	clear
printf "
============================================
SYSTEM RESTARTING
============================================

"
	loading_animation
	sleep 3
	printf "\n\nRUNNING INTEGRITY CHECK\n\n"
	loading_animation
	loading_animation
	system_check_string="$system_full_check $system_memory_check $system_storage_check $system_kernel_check $system_boot_check $system_memprotection_check"
	if [[ "$system_check_string" = *"false"*  ]]; then
	printf "\n\nINTEGRITY CHECK \e[31mFAILED\e[0m\n\n"
	sleep 10
	clear
	printf "
You failed to patch your system and remove the malware. The malware deleted the SCS and its storage, your submarine can no longer be controlled.

The only possibility of survival is an emergency blow, as this is a separate system not connected to the SCS.


"
	read -p "Press ENTER to order an emergency blow:"

	# this kills the mpv process of the start up sound
	kill $!

	emergency_blow
	else
		printf "\n\nINTEGRITY CHECK COMPLETE\n\n"
	fi
	sleep 5
	clear
	kill $!
	login_screen

else
	printf "\n\nSYSTEM RESTART STOPPED"
	sleep 3
fi
}

read_dump() {
	echo "dump"
}

read_logs() {
	user_choice="0"
	while [ "$user_choice" != "5" ]; do
	clear
	user_choice="0"
	until [[ $user_choice =~ ^[0-8]$ && $user_choice -gt 0 ]]; do
	printf "==============[ LOG FILES]=================
[1] - SLBM Launch sequence output
[2] - System modules log files 
[3] - Computer user access logs
[4] - Communication logs
[5] - Go back to Forensics Menu
[6] - Mark task as DONE
==================================================
"
	    read -p "What file do you want to analyse?: " user_choice
	    if [[ ! $user_choice =~ ^[0-6]+$ || $user_choice -le 0 ]]; then
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
			echo "5"
			;;
		6)
			logs_read="X"
			;;
	esac
	done
done
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

	# set system based on generated errors
	set_error_check_states

	clear

	forensic_action_menue
}