us_submarine(){
	player_nation="USA"
	player_readiness_system="DEFCON"
	player_readiness_level="2"
	player_target_cities="\t\t\t- CHONGQING\n\t\t\t- SHANGHAI\n\t\t\t- BEIJING\n\t\t\t- CHENGDU\n\t\t\t- GANGZHOU\n\t\t\t- SHENZHEN\n\t\t\t- WUHAN\n\t\t\t- TIANJIN\n\t\t\t- XI'AN\n\t\t\t- ZENGZHOU"
	player_people_killed="10'000'000"

	printf "

SUBMARINE CLASS: \tOHIO
SHIP: \t\t\tSSBN-733 (Nevada)
POSITION: \t\t43°14'27.8\"N 166°29'29.7\"W
DEPTH: \t\t\t160 FEET
RANK: \t\t\tCAPTAIN


\t\t |\t$player_readiness_system: $player_readiness_level\t|


"
	player_readiness_level="1"
}

fr_submarine(){
	player_nation="FRANCE"
	player_readiness_system="DEFCON"
	player_readiness_level="2"
	player_target_cities="\t\t\t- MOSCOW\n\t\t\t- SAINT PETERSBURG\n\t\t\t- NOVOSIBIRSK\n\t\t\t- YEKATERINBURG\n\t\t\t- KAZAN\n\t\t\t- NIZHNY NOVGOROD\n\t\t\t- KRASNOYARSK\n\t\t\t- CHELYABINSK\n\t\t\t- SAMARA\n\t\t\t- UFA"
	player_people_killed="10'000'000"

	printf "

SUBMARINE CLASS: \tTriomphant
SHIP: \t\t\tS616 (Le Triomphant)
POSITION: \t\t73°46'59.5\"N 38°27'32.6\"E
DEPTH: \t\t\t160 FEET 
RANK: \t\t\tCAPTAIN


\t\t |\t$player_readiness_system: $player_readiness_level\t|


"
	player_readiness_level="1"
}

ru_submarine(){
	player_nation="RUSSIA"
	player_readiness_system="степени боевой готовности"
	player_readiness_level="3"
	player_target_cities="\t\t\t- BERLIN\n\t\t\t- PARIS\n\t\t\t- WASHINGTON\n\t\t\t- LONDON\n\t\t\t- MADRID\n\t\t\t- WARSAW\n\t\t\t- CHICAGO\n\t\t\t- QUEBEC\n\t\t\t- LOS ANGELES\n\t\t\t- SEATTLE"
	player_people_killed="10'000'000"

	printf "

SUBMARINE CLASS: \tБорей
SHIP: \t\t\tK-552 (Knyaz Oleg)
POSITION: \t\t73°46'59.5\"N 38°27'32.6\"E
DEPTH: \t\t\t160 FEET 
RANK: \t\t\tCAPTAIN



\t\t |\t$player_readiness_system: $player_readiness_level\t|



"
	player_readiness_level="4"
}

ch_submarine(){
	player_nation="CHINA"
	player_readiness_system="Combat Readiness Condition"
	player_readiness_level="2"
	player_target_cities="\t\t\t- TAIPEI\n\t\t\t- TAICHUNG\n\t\t\t- SEOUL\n\t\t\t- WASHINGTON\n\t\t\t- CHICAGO\n\t\t\t- TOKYO\n\t\t\t- SEATTLE\n\t\t\t- HONOLULU\n\t\t\t- LOS ANGELES\n\t\t\t- BOSTON"
	player_people_killed="10'000'000"

	printf "

SUBMARINE CLASS: \t09-IV型核潜艇
SHIP: \t\t\t420 (Changzheng 20)
POSITION: \t\t13°51'46.1\"N 115°20'08.1\"E
DEPTH: \t\t\t160 FEET 
RANK: \t\t\tCAPTAIN


\t\t |\t$player_readiness_system: $player_readiness_level\t|


"
	player_readiness_level="1"
}