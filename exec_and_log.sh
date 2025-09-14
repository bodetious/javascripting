exec_and_log() {
    local logfile="$1"
    
    # Check if a logfile was provided
    if [ -z "$logfile" ]; then
        echo "Usage: exec_and_log <logfile> <command>"
        return 1
    fi
    
    # Remove the logfile from the argument list
    shift
    
    # Check if a command was provided
    if [ "$#" -eq 0 ]; then
        echo "Usage: exec_and_log <logfile> <command>"
        return 1
    fi
    
    # Reconstruct the command from the remaining arguments
    local command_to_execute="$@"

    # Add log entry header
    echo "--- Executing: $command_to_execute ---" >> "$logfile"
    echo "--- Started at: $(date) ---" >> "$logfile"

    # Execute the command
    eval "$command_to_execute" >> "$logfile" 2>&1

    # Add log entry footer
    echo "--- Finished at: $(date) ---" >> "$logfile"
    echo "------------------------------------" >> "$logfile"
}