#!/bin/zsh

# Function to execute the script with custom theme
execute_script() {
    local script_path="$HOME/Documents/code/bash/pe-updater/penv-dater.sh"  # Replace with the actual path to your script
    local theme_reset="$(tput sgr0)"

    # Set custom theme colors
    local dracula_fg_106="$(tput setaf 106)"
    local dracula_fg_153="$(tput setaf 153)"
    local dracula_fg_124="$(tput setaf 124)"
    local dracula_fg_228="$(tput setaf 228)"

    echo "${dracula_fg_106}Choose an action:${theme_reset}"
    echo "1. ${dracula_fg_153}Add/modify paths and environment variables interactively${theme_reset}"
    echo "2. ${dracula_fg_124}Just execute the script (default)${theme_reset}"
    read -p "Enter your choice (1/2): " action_choice

    case "$action_choice" in
        1) bash "$script_path" ;;
        2) bash "$script_path" --no-menu ;;
        *) echo "Invalid choice. Just executing the script." && bash "$script_path" --no-menu ;;
    esac
}

# Assign the keybinding (Alt-E)
bindkey '^[E' execute_script
