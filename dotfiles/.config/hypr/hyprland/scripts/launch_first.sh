#!/usr/bin/env bash
#
# Takes a list of commands and runs the first one found.

for CMD in "$@"; do
    [[ -z "$CMD" ]] && continue
    eval "command -v ${CMD%% *}" >/dev/null 2>&1 || continue
    eval "$CMD" &
    exit
done
