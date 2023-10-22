#!/bin/bash

# Set FZF_DEFAULT_OPTS with the custom theme
export FZF_DEFAULT_OPTS='
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'

# Function to add a new path to the PATH variable using FZF
add_path() {
	new_path=$(fd -t d 2>/dev/null | fzf)
	if [ -n "$new_path" ] && [ -z "$(echo $PATH | tr ':' '\n' | grep -x "$new_path")" ]; then
		export PATH="$new_path:$PATH"
		echo "$(tput setaf 106)Path '$new_path' added to PATH.$(tput sgr0)"
	elif [ -z "$new_path" ]; then
		echo "No path selected."
	else
		{
			echo "$(tput setaf 124)Path '$new_path' is already in PATH.$(tput sgr0)"
			return
		}
	fi
}

# Function to modify an existing path in the PATH variable
modify_path() {
	selected_path=$(echo $PATH | tr ':' '\n' | fzf)
	if [ -n "$selected_path" ]; then
		new_path=$(fd -t d 2>/dev/null | fzf)
		if [ -n "$new_path" ] && [ -z "$(echo $PATH | tr ':' '\n' | grep -x "$new_path")" ]; then
			export PATH="${PATH//$selected_path/$new_path}"
			echo "$(tput setaf 106)Path '$selected_path' modified to '$new_path'.$(tput sgr0)"
		elif [ -z "$new_path" ]; then
			echo "No path selected."
		else
			{
				echo "$(tput setaf 124)Path '$new_path' is already in PATH.$(tput sgr0)"
				return
			}
		fi
	else
		echo "No path selected for modification."
	fi
}

# Function to add a new environment variable
add_environment_variable() {
	read -p "Enter the variable name: " var_name
	read -p "Enter the value for $var_name: " var_value
	export "$var_name=$var_value"
	echo "$(tput setaf 106)Environment variable '$var_name' set to '$var_value'.$(tput sgr0)"
}

# Function to modify an existing environment variable
modify_environment_variable() {
	selected_var_name=$(echo $ENV_VARIABLES | fzf)
	if [ -n "$selected_var_name" ]; then
		read -p "Enter the new value for $selected_var_name: " var_value
		export "$selected_var_name=$var_value"
		echo "$(tput setaf 106)Environment variable '$selected_var_name' modified to '$var_value'.$(tput sgr0)"
	else
		echo "No environment variable selected for modification."
	fi
}

# Function to save changes to .zprofile
save_and_exit() {
	if [ -n "$changes" ]; then
		echo -e "\n# Automatically added by add_paths_and_variables.sh" >>~/.config/zsh/.zprofile
		echo "$changes" >>~/.config/zsh/.zprofile
		echo "$(tput setaf 106)Changes saved to ~/.config/zsh/.zprofile.$(tput sgr0)"
	fi
	exit
}

# Function to exit without saving
exit_without_saving() {
	echo "Exiting without saving changes."
	exit
}

# Main menu for user interaction
show_menu() {
	while true; do
		echo "$(tput setaf 106)Choose an option:$(tput sgr0)"
		echo "1. $(tput setaf 153)Add a new path to PATH$(tput sgr0)"
		echo "2. $(tput setaf 153)Modify an existing path in PATH$(tput sgr0)"
		echo "3. $(tput setaf 153)Add a new environment variable$(tput sgr0)"
		echo "4. $(tput setaf 153)Modify an existing environment variable$(tput sgr0)"
		echo "5. $(tput setaf 124)Save and Exit$(tput sgr0)"
		echo "6. $(tput setaf 124)Exit without Saving$(tput sgr0)"

		read -p "$(tput setaf 228)Enter your choice (1/2/3/4/5/6):$(tput sgr0) " choice

		case "$choice" in
		1)
			add_path
			if [ -n "$new_path" ]; then
				changes="$changes\nexport PATH=\"$new_path:\$PATH\""
			fi
			;;
		2) modify_path ;;
		3) add_environment_variable ;;
		4) modify_environment_variable ;;
		5) save_and_exit ;;
		6) exit_without_saving ;;
		*) echo "Invalid choice. Please select 1, 2, 3, 4, 5, or 6." ;;
		esac
	done
}

# Execute the main menu function
show_menu
