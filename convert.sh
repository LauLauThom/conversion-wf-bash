#!/usr/bin/env sh
set -eu

if [ "$#" -ne 2 ]; then
  printf 'Usage: %s <input_dir> <output_dir>\n' "$0" >&2
  exit 1
fi

if [ -n "${VIRTUAL_ENV:-}" ] && [ -x "${VIRTUAL_ENV}/bin/eubi" ]; then
  eubi_cmd="${VIRTUAL_ENV}/bin/eubi"
elif command -v eubi >/dev/null 2>&1; then
  eubi_cmd="$(command -v eubi)"
else
  printf 'eubi command not found on PATH; install requirements.txt in your active environment first.\n' >&2
  exit 1
fi

"$eubi_cmd" "$1" "$2"
