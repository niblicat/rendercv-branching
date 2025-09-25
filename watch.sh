#!/bin/sh
#
# Watches a CV and displays edits live as they occur.

. ./config.cfg # Load configuration variables
. ./utils.sh # Load utility functions

# Perform some conda initialization if the user has it
setup_conda

# Exit if we do not have rendercv
if ! check_rendercv; then exit 1; fi

# Render the CV to the watch directory
rendercv render --watch "$FILE_CV" --output-folder-name "$DIRECTORY_WATCH"
