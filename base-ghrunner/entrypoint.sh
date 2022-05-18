#!/usr/bin/env bash
set -eu

source $CONDA/bin/activate
if [ ! -f ./registered]; then
# register if not
/base-runner/config.sh --url https://github.com/hex-git/$REPO --token $GH_TOKEN
touch ./registered
fi
while true; do /base-runner/run.sh; sleep 10; done
