#!/bin/sh
#
# Renders a CV to its git branch-dependent directory.

. ./config.cfg # Load configuration variables
. ./utils.sh # Load utility functions

# Check if we do not have git
check_git

readonly BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

# The subdirectory name is determined by the current branch name
if [[ -z $BRANCH ]]; then
  # Branch string is empty
  printf "%sWARNING%s: Branch name is empty. Using \"standard\" instead.\n" \
  "${COLOR_BOLD}${COLOR_WARNING}" "${COLOR_RESET}" >&2
  DIRECTORY_SUB="standard"
else
  DIRECTORY_SUB="branch-$BRANCH"
fi
readonly DIRECTORY_SUB

# example: ./history/branch-main
readonly DIRECTORY_FULL="./$DIRECTORY_MAIN/$DIRECTORY_SUB"

# Perform some conda initialization if the user has it
setup_conda

# Exit if we do not have rendercv
if ! check_rendercv; then exit 1; fi

printf "Rendering CV to %s%s%s.\n" "${COLOR_HIGHLIGHT}" "${DIRECTORY_FULL}" \
"${COLOR_RESET}"

# Render the CV to the branch directory
rendercv render "$FILE_CV" --output-folder-name "$DIRECTORY_FULL"
