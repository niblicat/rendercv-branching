#!/bin/sh
#
# Defines common utility functions like checking if the user has an executable.

# Performs conda initialization if the user has it
function setup_conda() {
  if ! command -v conda >/dev/null 2>&1; then
    # User does not have conda
    return
  fi

  eval "$(command conda "shell.$CONDA_SHELL" 'hook' 2> /dev/null)"

  # If we're missing an environment with rendercv, the user may have it
  # installed in their base environment, so we won't exit
  if ! conda list -n "$CONDA_ENVIRONMENT" >/dev/null; then
    # Result of last command was in error, so conda environment doesn't exist
    printf "%sWARNING%s: Conda environment '%s' not found.\n\
Expecting current environment to contain rendercv executable.\n" \
    "${COLOR_BOLD}${COLOR_WARNING}" "${COLOR_RESET}" \
    "${CONDA_ENVIRONMENT}" >&2
  else
    conda activate "$CONDA_ENVIRONMENT"
  fi

  # We WILL exit if the environment is correct, but it does not contain rendercv
  if ! conda list | grep '^rendercv' >/dev/null 2>&1; then
    # rendercv could not be found within current environment's packages
    printf "%sERROR%s: Conda environment '%s' does not contain\
 rendercv package. \n\
Please ensure %srendercv %sis installed through pip.\n" \
    "${COLOR_BOLD}${COLOR_DANGER}" "${COLOR_RESET}" "${CONDA_ENVIRONMENT}" \
    "${COLOR_HIGHLIGHT}" "${COLOR_RESET}" >&2

    exit 1
  fi

  # everything is good :)
}

# Checks and outputs if we do not have conda
function check_conda() {
  if command -v conda >/dev/null 2>&1; then
    return 0 # true
  else
    printf "%sWARNING%s: Command 'conda' not found\n\
Please ensure %sconda %sis installed and available in your system's PATH.\n" \
    "${COLOR_BOLD}${COLOR_WARNING}" "${COLOR_RESET}" "${COLOR_HIGHLIGHT}" \
    "${COLOR_RESET}" >&2

    return 1 # false
  fi
}

# Checks and outputs if we do not have git
function check_git() {
  if command -v git >/dev/null 2>&1; then
    return 0 # true
  else
    printf "%sWARNING%s: Command 'git' not found\n\
Please ensure %sgit %sis installed and available in your system's PATH.\n" \
    "${COLOR_BOLD}${COLOR_WARNING}" "${COLOR_RESET}" "${COLOR_HIGHLIGHT}" \
    "${COLOR_RESET}" >&2

    return 1 # false
  fi
}

# Checks and outputs if we do not have rendercv
function check_rendercv() {
  if command -v rendercv >/dev/null 2>&1; then
    return 0 # true
  else
    printf "%sERROR%s: Command 'rendercv' not found\n\
Please ensure %srendercv %sis installed through pip.\n" \
    "${COLOR_BOLD}${COLOR_DANGER}" "${COLOR_RESET}" "${COLOR_HIGHLIGHT}" \
    "${COLOR_RESET}" >&2

    return 1 # false
  fi
}
