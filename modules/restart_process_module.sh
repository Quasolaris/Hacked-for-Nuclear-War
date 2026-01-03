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

restart_process() {
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
		printf "\n\n\tRUNNING FULL SYSTEM CHECK\n\n\t"
		loading_animation
		printf "\n\n\tFINSIHED FULL SYSTEM CHECK\n\n\t"
		fi
		if [[ "$run_memory_check" == "true" ]]; then
		printf "\n\n\tRUNNING MEMORY CHECK\n\n\t"
		loading_animation
		printf "\n\n\tFINISHED MEMORY CHECK\n\n\t"
		fi
		if [[ "$run_storage_check" == "true" ]]; then
		printf "\n\n\tRUNNING STORAGE CHECK\n\n\t"
		loading_animation
		printf "\n\n\tFINISHEDSTORAGE CHECK\n\n\t"
		fi
		if [[ "$run_kernel_recompile" == "true" ]]; then
		printf "\n\n\tRECOMPILING KERNEL\n\n\t"
		loading_animation
		printf "\n\n\tFINISHED KERNEL\n\n\t"
		fi
		if [[ "$run_boot_check" == "true" ]]; then
		printf "\n\n\tRUNNING BOOT SECTOR CHECK\n\n\t"
		loading_animation
		printf "\n\n\tFINISHED BOOT SECTOR CHECK\n\n\t\t"
		fi
		if [[ "$run_enable_memprotect" == "true" ]]; then
		printf "\n\n\tENABLING MEMORY PROTECTION\n\n\t"
		loading_animation
		printf "\n\n\tMEMORY PROTECTION ENABLED\n\n\t"
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
			printf "\n\n\tDISCONNECTING POWER FOR COLD RESTART\n\n\t"
			sleep 10
			mpv --no-terminal sounds/power_out.opus 
			sleep 10
			mpv --no-terminal sounds/power_on.opus
			sleep 10
			printf "\n\n\tREFLASHING FIRMWARE\n\n\t"
			loading_animation
			printf "\n\n\tFIRMWARE FLASHED\n\n\t"
			printf "\n\n\tLOADING OPERATING SYSTEM FROM TAPE"
			mpv --no-terminal sounds/tape_load.opus
			printf "\n\n\tOPERATING SYSTEM LOADED" 
			sleep 10
		elif [[ "$player_restart_process" == "2"  ]]; then
			printf "\n\n\tRELOADING FIRMWARE\n\n\t"
			loading_animation
			printf "\n\n\tLOADING OPERATING SYSTEM FROM TAPE"
			mpv --no-terminal sounds/tape_load.opus
			printf "\n\n\tOPERATING SYSTEM LOADED" 
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
		printf "\n\n\tRUNNING INTEGRITY CHECK\n\n\t"
		loading_animation
		loading_animation
		system_check_string="$system_full_check $system_memory_check $system_storage_check $system_kernel_check $system_boot_check $system_memprotection_check"
		if [[ "$system_check_string" = *"false"*  ]]; then
		printf "\n\n\tINTEGRITY CHECK \e[31mFAILED\e[0m\n\n\t"
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
			printf "\n\n\tINTEGRITY CHECK COMPLETE\n\n\t"
		fi

		# resetting system health as all necessary steps were made
		system_has_restarted=true
		system_navigation_affected=true
	    system_communication_affected=true
	    system_weapons_affected=true
	    system_slbm_affected=true
	    system_power_affected=true
	    restart_system="\e[32mX\e[0m"
		sleep 5
		clear
		kill $!
		login_screen

	else
		printf "\n\n\tSYSTEM RESTART STOPPED"
		sleep 3
	fi
}