#!/bin/sh
#
# Tests various colors as defined in the config file.

. ./config.cfg # Load configuration variables
. ./utils.sh # Load utility functions

# Regular colors
echo "${COLOR_RESET}I am COLOR_RESET${COLOR_RESET}"
echo "${COLOR_BOLD}I am COLOR_BOLD${COLOR_RESET}"
echo "${COLOR_HIGHLIGHT}I am COLOR_HIGHLIGHT${COLOR_RESET}"
echo "${COLOR_WARNING}I am COLOR_WARNING${COLOR_RESET}"
echo "${COLOR_DANGER}I am COLOR_DANGER${COLOR_RESET}"

# Bolded colors
echo "${COLOR_BOLD}${COLOR_RESET}I am bolded COLOR_RESET${COLOR_RESET}"
echo "${COLOR_BOLD}${COLOR_HIGHLIGHT}I am bolded COLOR_HIGHLIGHT${COLOR_RESET}"
echo "${COLOR_BOLD}${COLOR_WARNING}I am bolded COLOR_WARNING${COLOR_RESET}"
echo "${COLOR_BOLD}${COLOR_DANGER}I am bolded COLOR_DANGER${COLOR_RESET}"
