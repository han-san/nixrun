#! /usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

scriptname="nixrun"

# Check if the command argument was provided.
if ! test -v 1; then
  printf 'Usage: %s COMMAND [ARGS]...\n' "$scriptname"
  exit 1
fi

# The command must be passed to --run as a string, so printf with %q properly handles the quoted arguments.
command=$(printf '%q ' "$@")

nix-shell -p "$1" --run "$command"
