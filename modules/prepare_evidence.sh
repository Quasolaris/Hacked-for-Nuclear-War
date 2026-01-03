prepare_evidence() {
	# get set attacker
	if [[ "$attack_apt" == "HIDDEN COBRA" ]]; then
		hidden_cobra
	elif [[ "$attack_apt" == "APT28" ]]; then
		apt28
	elif [[ "$attack_apt" == "UNC3236" ]]; then
		unc3236
	elif [[ "$attack_apt" == "APT40" ]]; then
		apt40
	else
		platinum
	fi

	cp template_logs/report_template.md evidence/report.md
	# compile new logs with set enemy
	cp template_logs/processes_template.log evidence/processes.log
	shuf evidence/processes.log -o evidence/processes.log
	rm -rf evidence/final_processes.log &> /dev/null

	printf '%s\n' "${processes_used[@]}" > evidence/proc_t
	cat template_logs/processes_normal.txt >> evidence/proc_t

	printf '%s\n' "${files_used[@]}" > evidence/file_t
	cat template_logs/files_normal.txt >> evidence/file_t
	shuf evidence/processes.log -o evidence/processes.log

	printf '%s\n' "${accounts_used[@]}" > evidence/account_t


	printf '%s\n' "${commands_used[@]}" > evidence/command_t
	cat template_logs/commands_normal.txt >> evidence/command_t
	shuf evidence/command_t -o evidence/commands.log

	# set random processes
	# Written by Lumo AI
		proc_file="evidence/proc_t"
		input_file="evidence/processes.log"
		mapfile -t processes < <(grep -v '^$' "$proc_file" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

	# ---------- 3. Function: pick a random process ----------
	rand_process() {
	    local idx=$(( RANDOM % ${#processes[@]} ))
	    printf '%s' "${processes[$idx]}"
	}

	# ---------- 4. Process the input file ----------
	while IFS= read -r line || [[ -n "$line" ]]; do
	    while [[ "$line" == *"__PROCESS_TEMPLATE__"* ]]; do
	        repl=$(rand_process)
	        line=${line/__PROCESS_TEMPLATE__/$repl}
	    done
	    printf '%s\n' "$line" >> evidence/final_processes.log
	done < "$input_file" &> /dev/null
	# --------------------------------------
	
	rm -rf evidence/processes.log &> /dev/null

# set random usernames
# Written by Lumo AI modified by Quasolaris
	proc_file="evidence/account_t"
	input_file="evidence/final_processes.log"
	mapfile -t accounts < <(grep -v '^$' "$proc_file" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

		if [[ ${#accounts[@]} -eq 0 ]]; then
	    echo "Error: No process names found in '$proc_file'." >&2
	    exit 1
	fi

	# ---------- 3. Function: pick a random process ----------
	rand_process() {
	    local idx=$(( RANDOM % ${#accounts[@]} ))
	    printf '%s' "${accounts[$idx]}"
	}

	# ---------- 4. Process the input file ----------
	while IFS= read -r line || [[ -n "$line" ]]; do
	    while [[ "$line" == *"__USER_TEMPLATE__"* ]]; do
	        repl=$(rand_process)
	        line=${line/__USER_TEMPLATE__/$repl}
	    done
	    printf '%s\n' "$line" >> evidence/processes.log
	done < "$input_file" &> /dev/null
	# --------------------------------------


	# same for files (need to refactor to be function as same code as for processes)


	cp template_logs/file_template.log evidence/files.log
	rm -rf evidence/final_files.log &> /dev/null


		# set random processes
	# Written by Lumo AI
		proc_file="evidence/file_t"
		input_file="evidence/files.log"
		mapfile -t files < <(grep -v '^$' "$proc_file" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

	# ---------- 3. Function: pick a random process ----------
	rand_process() {
	    local idx=$(( RANDOM % ${#files[@]} ))
	    printf '%s' "${files[$idx]}"
	}

	# ---------- 4. Process the input file ----------
	while IFS= read -r line || [[ -n "$line" ]]; do
	    while [[ "$line" == *"__FILE_TEMPLATE__"* ]]; do
	        repl=$(rand_process)
	        line=${line/__FILE_TEMPLATE__/$repl}
	    done
	    printf '%s\n' "$line" >> evidence/final_files.log
	done < "$input_file" &> /dev/null
	# --------------------------------------
	
	rm -rf evidence/files.log &> /dev/null

# set random usernames
# Written by Lumo AI modified by Quasolaris
	proc_file="evidence/account_t"
	input_file="evidence/final_files.log"
	mapfile -t accounts < <(grep -v '^$' "$proc_file" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

		if [[ ${#accounts[@]} -eq 0 ]]; then
	    echo "Error: No process names found in '$proc_file'." >&2
	    exit 1
	fi

	# ---------- 3. Function: pick a random process ----------
	rand_process() {
	    local idx=$(( RANDOM % ${#accounts[@]} ))
	    printf '%s' "${accounts[$idx]}"
	}

	# ---------- 4. Process the input file ----------
	while IFS= read -r line || [[ -n "$line" ]]; do
	    while [[ "$line" == *"__USER_TEMPLATE__"* ]]; do
	        repl=$(rand_process)
	        line=${line/__USER_TEMPLATE__/$repl}
	    done
	    printf '%s\n' "$line" >> evidence/files.log
	done < "$input_file" &> /dev/null

	shuf evidence/files.log -o evidence/files.log

}	