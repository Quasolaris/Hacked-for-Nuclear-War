#!/bin/bash


# checking if glow is installed use it, if not use less
if command -v glow &> /dev/null; then
    read_file_command="glow -p"
else
    read_file_command="less"
fi
# killing mpv to stop background sound
trap "pkill mpv" SIGINT


clear


# starting background
mpv --no-terminal loop-file=inf sounds/submarine_background.opus &

# variables for story - initial values for testing
player_readiness_system="DEFCON"
player_readiness_level="1"
player_nation="USA"
player_target_cities="\t\t\t- CHONGQING\n\t\t\t- SHANGHAI\n\t\t\t- BEIJING\n\t\t\t- CHENGDU\n\t\t\t- GANGZHOU\n\t\t\t- SHENZHEN\n\t\t\t- WUHAN\n\t\t\t- TIANJIN\n\t\t\t- XI'AN\n\t\t\t- ZENGZHOU"
player_people_killed="10'000'000"

player_authentic_launched=false
player_message_was_corrupt=false
player_not_authentic_launched=false
player_no_longer_commander=false
player_radiation_sickness=false


player_error_one="0xA1F0C0FFEE"
player_error_two="0xC300MBR404"
player_error_three="0xD4STACK0VER"

player_restart_process="0"
player_patch_applied=()

player_user_name=""



system_navigation_affected=false
system_communication_affected=false
system_weapons_affected=true
system_slbm_affected=false
system_power_affected=false
system_reactor_affected=true

system_full_check=true
system_memory_check=true
system_storage_check=true
system_kernel_check=true
system_boot_check=true
system_memprotection_check=true

print_player_stats() {
	clear
	ELAPSED_TIME=$(($SECONDS - $START_TIME))
printf "
==================[ PLAYER STATS ]==================
Username:\t\t\t\t $player_user_name
Time played:\t\t\t\t $(($ELAPSED_TIME/60)) min $(($ELAPSED_TIME%60)) sec
Player Nation:\t\t\t\t $player_nation
People killed:\t\t\t\t $player_people_killed
Decided on corrupted message: \t\t $player_message_was_corrupt
Launched an authenticated strike: \t $player_authentic_launched
Launched a not authenticated strike: \t $player_not_authentic_launched


=================[ SYSTEM STATS ]====================

Encountered Errors:
= $player_error_one
= $player_error_two
= $player_error_three

Full System Check Status:\t $system_full_check
Memory System Check Status: \t $system_memory_check
Storage Check Status: \t $system_storage_check
Kernel Recompile Check Status:\t $system_kernel_check
Boot Sector Check Status\t $system_boot_check
Memory Protection Enabled:\t $system_memprotection_check


Crew got radiation sickness: $player_radiation_sickness
==================[ GAME FINISHED ]=================\n\n
"
pkill mpv
}

# load components
source modules/nation_selection.sh
source modules/nuclear_war_start_functions.sh
source modules/digital_forensics.sh


START_TIME=$SECONDS
# uncomment for full game -- DEBUG
#game_start_sequence

digital_forensics

print_player_stats

pkill mpv
