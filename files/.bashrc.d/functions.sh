hb() {
    haxe ./build.hxml
}

ru() {
   # ru - run a specified bash command in the project root directory (or default to ../)
    
    TARGET_FILE_PATTERNS=("*.csproj" "*gradle*" "Package.swift" ".git*" "Cargo.toml")
    
    find_project_dir() {
        local dir="$1"
        while [ "$dir" != "/" ]; do
            for pattern in "${TARGET_FILE_PATTERNS[@]}"; do
                if ls "$dir"/$pattern &>/dev/null; then
                    echo "$dir"
                    return 0
                fi
            done
            dir=$(dirname "$dir")
        done
        return 1
    }
    
    start_dir=$(pwd)
    project_dir=$(find_project_dir "$start_dir")
    if [ -n "$project_dir" ]; then
        echo -e "Running in $project_dir\n---"
        cd "$project_dir"
    else
        echo -e "Running in ../\n---"
        cd ../
    fi
    COMMAND="$@"
    bash -i -c "$COMMAND"
    cd $start_dir
}
export ru

command_not_found_handle() {
    local input_command="$*"
    
    local valid_commands=("ru")
    for cmd in "${valid_commands[@]}"; do
        if [[ "$input_command" == "$cmd"* ]]; then
            local remaining_input="${input_command:${#cmd}}"
            "$cmd" $remaining_input
            return 0
        fi
    done
    echo "command not found: $input_command"
    return 1
}
export command_not_found_handle
