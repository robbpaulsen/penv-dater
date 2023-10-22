# Add Paths and Environment Variables Script

**Author: robbpaulsen**

---

## Table of Contents
- [Disclaminer](#disclaimer)
- [Description](#description)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
  - [Customize FZF Theme](#customize-fzf-theme)
  - [Customize Menu Colors](#customize-menu-colors)
  - [Customize Keybindings](#customize-keybindings)

---

## Disclaimer

The script assumes that your environment variables and path declarations are inside the `$XDG_CONFIG_HOME/zsh`, and appends/modifies paths/variables to `.zprofile`

## Description

The "penv-dater" is a Bash script designed to help you interactively manage paths and environment variables in your shell. It leverages FZF for an interactive selection experience and provides options to add, modify, or manage paths and environment variables with ease.

---

## Features

- Add a new path to the `PATH` environment variable.
- Modify an existing path in the `PATH` environment variable.
- Add a new environment variable with a name and value.
- Modify an existing environment variable's value.
- Save changes to your shell configuration file (e.g., `~/.zshrc`).
- Choose to exit without saving changes.

---

## Getting Started

### Prerequisites

Before using this script, you need to have the following installed:

- [FZF](https://github.com/junegunn/fzf)
- [fd-find (optional, can be repalce with find)](https://github.com/sharkdp/fd)
- [Zsh (optional, for keybindings)]

### Installation

1. Clone the repository to your local machine:

```bash

git clone https://robbpaulsen/penv-dater.git
```

2. Navigate to the repository directory:

```bash

cd penv-dater/
```

3. Make script executable

```bash

chmod +x penv-dater.sh
```

## Usage

### Customize FZF Theme

The script comes with a default FZF theme, but you can customize it in the script by modifying the FZF_DEFAULT_OPTS. Refer to the script to customize the FZF theme to your liking.

### Customize Menu Colors

You can customize the menu option colors and styles by modifying the tput commands in the script. The colors are set in the show_menu function.

### Customize Keybindings

To customize the keybindings, you can modify the Zsh keybinding script. It includes keybinding settings, as well as a Dracula theme. You can adjust the theme and keybinding triggers according to your preferences.
