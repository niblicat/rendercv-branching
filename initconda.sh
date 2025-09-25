#!/bin/sh
#
# Initializes a conda environment for rendercv.

. ./config.cfg # Load configuration variables
. ./utils.sh # Load utility functions

# Exit if we do not have conda
if ! check_conda; then exit 1; fi

eval "$(command conda "shell.$CONDA_SHELL" 'hook' 2> /dev/null)"
conda create --name "$CONDA_ENVIRONMENT" python=3.13.7
conda activate "$CONDA_ENVIRONMENT"
pip install "rendercv[full]"
