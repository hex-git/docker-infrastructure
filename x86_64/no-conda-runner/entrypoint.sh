#!/usr/bin/env bash
set -eu

source $CONDA/bin/activate
if [ ! -f ./registered]; then
# register if not
/no-conda-runner/config.sh --url https://github.com/hex-git/$REPO --token $(python3 /no-conda-runner/get_token.py)
touch ./registered
fi
while true; do /no-conda-runner/run.sh; sleep 10; done
