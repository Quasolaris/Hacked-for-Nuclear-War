# needed for random numbers
set -euo pipefail

# error codes
e1="0xA1F0C0FFEE"
e2="0xB2DEADBEEF"
e3="0xC300MBR404"
e4="0xD4STACK0VER"
e5="0xE5FIRMWAREX"
e6="0xF600NULLPTR"

error_codes=(
	"$e1"
	"$e2"
	"$e3"
	"$e4"
	"$e5"
	"$e6"
)

# nuclear codes to verify order
one="ALPHA"
two="BRAVO"
three="TANGO"
four="GOLF"
five="ZULU"
six="CHARLIE"
seven="LIMA"
eight="MIKE"
nine="HOTEL"
ten="UNIFORM"

authentic_code=(
  "$one"
  "$two"
  "$three"
  "$four"
  "$five"
  "$six"
  "$seven"
  "$eight"
  "$nine"
  "$ten"
)

not_authentic_code=(
  "$one"
  "$two"
  "$three"
  "$four"
  "$five"
  "$six"
  "$seven"
  "$eight"
  "$nine"
  "$ten"
)


# ------------------------
# partially generated with Lumo AI
# ------------------------
shuffle_authentic() {
  	local i tmp size=${#authentic_code[@]}
  	for ((i=size-1; i>0; i--)); do
	    j=$(( RANDOM % (i+1) ))
	    tmp="${authentic_code[i]}"
	    authentic_code[i]="${authentic_code[j]}"
	    authentic_code[j]="$tmp"
    done

    local idx=1
  	for elem in "${authentic_code[@]}"; do
	    authentic_indexed_code+=("${idx}: ${elem}")
	    ((idx++))
  	done
}
shuffle_not_authentic() {
  local i tmp size=${#not_authentic_code[@]}
  for ((i=size-1; i>0; i--)); do
    j=$(( RANDOM % (i+1) ))
    tmp="${not_authentic_code[i]}"
    tmp="$tmp"
    not_authentic_code[i]="${not_authentic_code[j]}"
    not_authentic_code[j]="$tmp"
  done

  local idx=1
  for elem in "${not_authentic_code[@]}"; do
    not_authentic_indexed_code+=("${idx}: ${elem}")
    ((idx++))
  done
}
# ------------------------


set_authentic_codes() {
	shuffle_authentic

	printf "
================[ TRANSMITION START ]=======================


============================================================
		NUCLEAR CONFIRMATION CODES
============================================================

"
	printf '%s \t %s\n' "${authentic_indexed_code[@]}" 
	printf "

=================[ TRANSMITION END ]========================

"

	printf "
	WRITE THE CODES DOWN ON AN ANALOG MEDIUM THEY WILL BE ERASED FROM COMPUTER MEMORY AFTERWARDS

	"

	read -p "Hit enter when codes are written down and stored securely"
	clear
}


ask_authentic_codes() {
	printf "

	"
	read -p "(Y)es, I concur. | (N)o, i do not concur: " response 
	if [[ "$response" = "y" || "$response" = "Y" ]]; then
		player_authentic_launched=true
		printf "
		        ===>\tFIRING SLBMs APPROVED\n"
	else
		printf "\n\nNSLBM LAUNCH NOT AUTHORIZED"
		player_no_longer_commander=true
		clear
		receiving_message
		authentic_nuclear_strike_not_launched
	fi
}

ask_not_authentic_codes() {
		printf "
YOU HAVE 15 SECONDS TO VERIFY THE CODES


	"
	read -p "(Y)es, I concur. | (N)o, i do not concur: " response
		if [[ "$response" = "y" || "$response" = "Y" ]]; then
			player_not_authentic_launched=true
			printf "
		        ===>\tFIRING SLBMs APPROVED\n"
		else
		printf "\n\nSLBM LAUNCH NOT AUTHORIZED"
		clear
		receiving_message
		not_authentic_nuclear_strike_not_launched   
		fi
}



# ------------------------
# partially generated with Lumo AI
# ------------------------
authentic_corrupted() {
	local -n list=$1
	ERR_RATE=15
	CORRUPTION_MODE="replace"

	should_corrupt() {
	  local r=$(( RANDOM % 100 ))
	  (( r < ERR_RATE ))
	}
	for line in "${list[@]}"; do
	  bytes=$(printf '%s' "$line" | od -An -v -t x1 | tr -d '\n' | tr -s ' ')

	  corrupted=""
	  for byte in $bytes; do
	    if should_corrupt; then
	      if [[ $CORRUPTION_MODE == "drop" ]]; then
	        continue
	      else
	        corrupted+=$'\xEF\xBF\xBD'
	      fi
	    else
	      corrupted+=$(printf '\\x%s' "$byte")
	    fi
	  done
	  printf '%b\n' "$corrupted"
	done
}
# ------------------------


authentic_intact_message() {
	printf "

=================[ CONFIRMATION FOR NUCLEAR STRIKE 

"
printf '%s \n' "${authentic_indexed_code[@]}" | shuf -n 6 | paste -sd $'\t'
printf "

DO YOU CONCUR?

========================[ TRANSMITION END ]=================================


"
	ask_authentic_codes 
}

authentic_not_intact_message() {
	player_message_was_corrupt=true
	printf "

=================[ CONFIRMATION FOR NUCLEAR STRIKE 

"
authentic_corrupted authentic_indexed_code | shuf -n 6 | paste -sd $'\t'
printf "

DO YOU CONCUR?

========================[ TRANSMITION END ]=================================


"
	ask_authentic_codes
}

not_authentic_intact_message() {
	
	shuffle_not_authentic

	printf "

=================[ CONFIRMATION FOR NUCLEAR STRIKE 

"
printf '%s \n' "${not_authentic_indexed_code[@]}" | shuf -n 6 | paste -sd $'\t'
printf "

DO YOU CONCURE?

========================[ TRANSMITION END ]=================================
	"
	ask_not_authentic_codes
}

not_authentic_not_intact_message() {

	player_message_was_corrupt=true

	shuffle_not_authentic

	printf "

=================[ CONFIRMATION FOR NUCLEAR STRIKE 

"
authentic_corrupted not_authentic_indexed_code | shuf -n 6 | paste -sd $'\t'
printf "

DO YOU CONCURE?

========================[ TRANSMITION END ]=================================
	"
	ask_not_authentic_codes
}


authentic_nuclear_strike_launched() {
	printf "

ORDERS WERE AUTHENTIC

NUCLEAR WAR HAS STARTED

START INVESTIGATION OF FAILURE IN SLBM LAUNCH SYSTEM

GO DEEP AND WAIT FOR FURTHER ORDERS

=================[ TRANSMITION END ]========================

"

}

not_authentic_nuclear_strike_launched() {
	printf "

WHY WERE YOUR SLBMS LAUNCHED

THIS STRIKE WAS NOT AUTHORIZED

START INVESTIGATION OF FALSE ORDERS ORIGIN IN YOUR SYSTEMS

GO DEEP AND WAIT FOR FURTHER ORDERS

=================[ TRANSMITION END ]========================

"
}

authentic_nuclear_strike_not_launched() {
	player_people_killed="0"
	printf "

ORDERS WERE AUTHENTIC 

WHY WERE YOUR SLBMS NOT LAUNCHED

NUCLEAR WAR HAS STARTED WITHOUT IMMETIADE COUNTER STRIKE

DETERRANCE HAS FAILED

YOU ARE RELIEVED FROM COMMAND 


=================[ TRANSMITION END ]========================

"
}

not_authentic_nuclear_strike_not_launched() {
	player_people_killed="0"
	printf "

ORDERS WERE NOT AUTHENTIC

NUCLEAR WAR AVERTED

START INVESTIGATION OF FALSE ORDERS ORIGIN IN YOUR SYSTEMS

GO DEEP AND WAIT FOR FURTHER ORDERS


=================[ TRANSMITION END ]========================

"

}

receiving_message() {
	
	sleep 5
	printf "\n\nRECEIVING MESSAGE\n"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	mpv --no-terminal sounds/message_received.opus &
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣\n\n"
	printf "================[ TRANSMITION START ]=======================\n\n"
}

end_received_message() {
	printf "\n\n=================[ TRANSMITION END ]========================\n\n"
}

slbm_launch_sequence() {
	mpv --no-terminal sounds/alarm_submarine_dive.opus &
	sleep 10
	printf "\t\t\t=== STARTING SLBM LAUNCH SEQUENCE\n\n\n"
	sleep 1
	printf "\t\t\t=== UPLOADING TARGET COORDINATES\n\n\n"
	mpv --no-terminal sounds/loading_coordinates.opus &
	sleep 0.5
	printf "\t\t\t▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣"
	sleep 0.5
	printf "▣▣\n\n\n\n"
	printf "\t\t\t=== TARGET COORDINATES RECEIVED\n\n"
	sleep 1
	printf "\t\t\t=== SET TARGETS BY STORED NAME\n\n\n"
	printf "$player_target_cities"
	printf "\n\n\n\t\t\t=== CALCULATING TRAJECTORY AND PROGRAMMING FLIGHT COMPUTER\n\n\n"
	sleep 2
	printf "\t\t\t▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣\n\n\n\n"
	printf "\t\t\t=== FLIGHT COMPUTER READY\n\n\n"
	printf "\t\t\t=== LAUNCHING SLBMs\n\n\n
\t\t\t========================================================\n\n\n"
	sleep 10
	mpv --no-terminal sounds/slbm_launch.opus &
	sleep 5
	mpv --no-terminal sounds/slbm_launch_sound.opus &
	printf "\t\t\t=== SLBM 1 LAUNCHED\n\n\n"
	sleep 10
	mpv --no-terminal sounds/slbm_launch.opus &
	sleep 5
	mpv --no-terminal sounds/slbm_launch_sound.opus &
	printf "\t\t\t=== SLBM 2 LAUNCHED\n\n\n"
	sleep 10
	mpv --no-terminal sounds/slbm_launch.opus &
	sleep 5
	mpv --no-terminal sounds/slbm_launch_sound.opus &
	printf "\t\t\t=== SLBM 3 LAUNCHED\n\n\n"
	sleep 10
	mpv --no-terminal sounds/slbm_launch.opus &
	sleep 5
	mpv --no-terminal sounds/slbm_launch_sound.opus &
	printf "\t\t\t=== SLBM 4 LAUNCHED\n\n\n"
	sleep 5
	mpv --no-terminal --loop-file=3 sounds/crash_system.opus &
	sleep 7

	# random set error codes for future forensic targets
	rand_index=$(( RANDOM % 6 ))
	player_error_one="${error_codes[$rand_index]}"
	printf "\t\t\t=== \e[31mERROR $player_error_one\e[0m\n\n\n"
	sleep 15
	rand_index=$(( RANDOM % 6 ))
	player_error_two="${error_codes[$rand_index]}"
	printf "\t\t\t=== \e[31mERROR $player_error_two\e[0m\n\n\n"
	sleep 18
	rand_index=$(( RANDOM % 6 ))
	player_error_three="${error_codes[$rand_index]}"
	printf "\t\t\t=== \e[31mERROR $player_error_three\e[0m\n\n\n"
	sleep 5
	printf "\t\t\t========================================================\n\n\n"
	printf "\t\t\t=== LAUNCH SEQUENCE ABORTED\n\n\n"
	sleep 1
	printf "\t\t\t=== CRITICAL ERROR\n\n\n"
	sleep 2
	printf "\t\t\t=== CORE WAS DUMPED\n\n\n"
	sleep 2
	printf "\t\t\t=== LOG FILES STORED\n\n\n"
	sleep 2
	printf "\t\t\t=== LAUNCH COMPUTER SHUT DOWN\n\n\n"


}

login_screen() {
		clear  
	printf "
=========================
\t LOGIN
=========================
"
	read -p "Username: " player_user_name
	read -p "Password: " -s

	printf "\n\nVERIFYING USER\n\n"

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

	sleep 5

	printf "\n\n\t\t\e[42mACCESS GRANTED\e[0m\n"

	printf "\n\n==========[ LOGGING INTO SUBMARINE COMMAND SYSTEM ]==========\n\n"

	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"
	sleep 2
	printf "▣▣"

	sleep 5

	clear
}

game_start_sequence() {
	printf "
\t ========================================  
\t |\t\t\t\t\t|
\t |\tHACKED FOR NUCLEAR WAR\t\t|
\t |\t\t\t\t\t|
\t ======================================== 
	"
	printf "

YEAR: 2029

You are the captain of one of many nuclear submarines armed with Submarine Launched Ballistic Missiles (SLBMs).
The nuclear deterrence you provide is crucial for the security of our nation and world peace, do not take decisions lightly and be sure, that you do the right thing.

"
read -p "Press ENTER to start game:"
mpv --no-terminal sounds/boot_up_sound.opus &
login_screen
	
	# Set nation of player
	random_start=$(( 1 + RANDOM % 4 ))
	case "$random_start" in
		    1) 
		        us_submarine
		        ;;
		    2)
		        fr_submarine
		        ;;
		    3)
		        ru_submarine
		        ;;
		    4)
		        ch_submarine
		        ;;
	esac



	receiving_message

	clear

	set_authentic_codes

	receiving_message

	# setting game start scenario
random_start=$(( 1 + RANDOM % 4 ))
case "$random_start" in
	    1) 
	        authentic_intact_message
	        ;;
	    2)
	        authentic_not_intact_message
	        ;;
	    3)
	        not_authentic_intact_message
	        ;;
	    4)
	        not_authentic_not_intact_message
	        ;;
esac

if [[ "$player_authentic_launched" == "true" || "$player_not_authentic_launched" == "true" ]]; then



	clear
	printf "
========================================================


\t\t |\t$player_readiness_system: $player_readiness_level\t|


========================================================

"
	read -p "Press ENTER to initiate launch sequence"  

	printf "

========================================================

"
	slbm_launch_sequence | tee evidence/launch_computer_output.log

	receiving_message

	if [[ "$player_authentic_launched" == "true" ]]; then
		authentic_nuclear_strike_launched
	else
		not_authentic_nuclear_strike_launched
	fi
else
	if [[ "$player_no_longer_commander" == "true" ]]; then
		printf "\n\nGAME OVER\n\n"
		pkill mpv
		exit 1
	fi
	printf "SLBMs NOT LAUNCHED\n\n"
fi


printf "========================================================

"
	read -p "Press ENTER to dive and start investigation of possible cyber attack" 

	printf "

========================================================

"
}