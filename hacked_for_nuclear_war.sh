#!/bin/bash
# killing mpv to stop background sound
trap "pkill mpv" SIGINT


clear


# starting background
mpv --no-terminal loop-file=inf sounds/submarine_background.opus &

# load components
source modules/nation_selection.sh
source modules/nuclear_war_start_functions.sh
source modules/digital_forensics.sh

# variables for story - initial values for testing
player_readiness_system="DEFCON"
player_readiness_level="1"
player_nation="USA"
player_authentic_launched=false
player_message_was_corrupt=false
player_not_authentic_launched=false
player_target_cities="\t\t\t- CHONGQING\n\t\t\t- SHANGHAI\n\t\t\t- BEIJING\n\t\t\t- CHENGDU\n\t\t\t- GANGZHOU\n\t\t\t- SHENZHEN\n\t\t\t- WUHAN\n\t\t\t- TIANJIN\n\t\t\t- XI'AN\n\t\t\t- ZENGZHOU"
player_people_killed="10'000'000"
player_no_longer_commander=false




START_TIME=$SECONDS
# uncomment for full game -- DEBUG
game_start_sequence



digital_forensics


ELAPSED_TIME=$(($SECONDS - $START_TIME))
printf "
==================[ PLAYER STATS ]==================
Time played:\t\t\t\t $(($ELAPSED_TIME/60)) min $(($ELAPSED_TIME%60)) sec
Player Nation:\t\t\t\t $player_nation
People killed:\t\t\t\t $player_people_killed
Decided on corrupted message: \t\t $player_message_was_corrupt
Launched an authenticated strike: \t $player_authentic_launched
Launched a not authenticated strike: \t $player_not_authentic_launched
==================[ GAME FINISHED ]=================\n\n
"

pkill mpv