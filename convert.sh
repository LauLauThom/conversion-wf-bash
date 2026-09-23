#!/usr/bin/env sh
set -eu

if [ "$#" -ne 2 ]; then
  printf 'Usage: %s <input_dir> <output_dir>\n' "$0" >&2
  exit 1
fi

eubi "$1" "$2"
