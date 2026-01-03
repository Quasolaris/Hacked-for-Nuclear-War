#!/bin/bash


# checking if glow is installed, if not use less
if command -v glow &> /dev/null; then
    read_file_command="glow -p"
else
    read_file_command="less"
fi

# check if evidence directory exists, if not create it
if [ ! -d "evidence" ]; then
  mkdir evidence
fi


function test() {
	clear
	printf "
	Do you want to quit the game? The crew and submarine will be lost to the depth of the sea...

	"
	read -p "Type 'Yes' to quit the game: " player_quit

	if [[ "$player_quit" == "Yes" || "$player_quit" == "yes" ]]; then
		pkill mpv
		print_player_stats
		exit 1
	else
		clear
		printf "Press ENTER to go back to the bridge."
	fi
}
# killing mpv to stop background sound if ^C is used and print game statistics
trap test SIGINT


clear


# starting background sound
mpv --no-terminal --loop-file=inf sounds/submarine_background.opus &

# variables for story - initial values for testing
player_readiness_system="DEFCON"
player_readiness_level="1"
player_nation="USA"
player_target_cities="\t\t\t- CHONGQING\n\t\t\t- SHANGHAI\n\t\t\t- BEIJING\n\t\t\t- CHENGDU\n\t\t\t- GANGZHOU\n\t\t\t- SHENZHEN\n\t\t\t- WUHAN\n\t\t\t- TIANJIN\n\t\t\t- XI'AN\n\t\t\t- ZENGZHOU"
player_people_killed="42'300'000"

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
player_chosen_enemy="NaN"
player_saw_radioactivity=false
player_secure_forensics=false

system_full_check=true
system_memory_check=true
system_storage_check=true
system_kernel_check=true
system_boot_check=true
system_memprotection_check=true

run_enable_memprotect=false
run_boot_check=false
run_kernel_recompile=false
run_storage_check=false
run_memory_check=false
run_system_check=false

attack_apt="NaN"

# set APT
a1="HIDDEN COBRA"
a2="APT28"
a3="UNC3236"
a4="APT40"
a5="PLATINUM"

apt_groups=(
	"$a1"
	"$a2"
	"$a3"
	"$a4"
	"$a5"
)


rand_index=$(( RANDOM % 5 ))
attack_apt="${apt_groups[$rand_index]}"

# set to false for normal run
system_has_restarted=true

# --------------------------
# generated with Luma AI and modified by Quasolaris
# Sets three randomly chosen submarine systems to be affected
# --------------------------
set_submarine_system_health() {
	vars=(
    system_navigation_affected
    system_communication_affected
    system_weapons_affected
    system_slbm_affected
    system_power_affected
    system_reactor_affected
)


# Initialize all to false
for v in "${vars[@]}"; do
    eval "$v=false"
done


# Randomly shuffle the array and pick the first three
shuffled=($(printf "%s\n" "${vars[@]}" | shuf))
selected=("${shuffled[@]:0:3}")

# Set the chosen two to true
for v in "${selected[@]}"; do
    eval "$v=true"
done

# if reactor damaged set radiation sickness to true
player_radiation_sickness="$system_reactor_affected"
}
# --------------------------

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
		Chosen Adversary:\t\t\t $player_chosen_enemy
				
		=================[ SYSTEM STATS ]====================

		Submarine was attacked by:\t\t $attack_apt

		Encountered Errors:
		= $player_error_one
		= $player_error_two
		= $player_error_three

		Full System Check Status:\t\t $system_full_check
		Memory System Check Status:\t\t $system_memory_check
		Storage Check Status:\t\t\t $system_storage_check
		Kernel Recompile Check Status:\t\t $system_kernel_check
		Boot Sector Check Status\t\t $system_boot_check
		Memory Protection Enabled:\t\t $system_memprotection_check


		Crew got radiation sickness:\t\t $player_radiation_sickness

		==================[ GAME FINISHED ]=================\n\n
"
pkill mpv
}

# load components
source modules/nation_selection.sh
source modules/nuclear_war_start_functions.sh
source modules/digital_forensics.sh
source modules/restart_process_module.sh
source modules/read_logs_menu_function.sh
source modules/submarine_actions.sh
source modules/SCS_functions.sh
source modules/prepare_evidence.sh
source modules/apt_forensic_evidences.sh


# clean up evidence and set new APT forensics
rm -rf evidence/* &> /dev/null

prepare_evidence

set_submarine_system_health

START_TIME=$SECONDS
# comment to skip start sequence 
game_start_sequence
digital_forensics

# ends script in case of commenting in all modules
print_player_stats
pkill mpv
exit 1