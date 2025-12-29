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