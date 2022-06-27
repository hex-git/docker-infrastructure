#!/usr/bin/env bash
set -eu

source $CONDA/bin/activate
if [ ! -f ./registered]; then
# register if not
/base-runner/config.sh --url https://github.com/hex-git/$REPO --token $(python3 -c /base-runner/get_token.py)
touch ./registered
fi
while true; do /base-runner/run.sh; sleep 10; done
