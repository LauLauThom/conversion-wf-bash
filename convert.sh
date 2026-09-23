#!/usr/bin/env sh
set -eu

if [ "$#" -ne 2 ]; then
  printf 'Usage: %s <input_dir> <output_dir>\n' "$0" >&2
  exit 1
fi

if [ -n "${VIRTUAL_ENV:-}" ] && [ -x "${VIRTUAL_ENV}/bin/eubi" ]; then
  eubi_cmd="${VIRTUAL_ENV}/bin/eubi"
elif [ -n "${VIRTUAL_ENV:-}" ] && [ -x "${VIRTUAL_ENV}/Scripts/eubi.exe" ]; then
  eubi_cmd="${VIRTUAL_ENV}/Scripts/eubi.exe"
elif [ -n "${VIRTUAL_ENV:-}" ] && [ -x "${VIRTUAL_ENV}/Scripts/eubi" ]; then
  eubi_cmd="${VIRTUAL_ENV}/Scripts/eubi"
elif command -v eubi >/dev/null 2>&1; then
  eubi_cmd="$(command -v eubi)"
else
  printf 'eubi command not found in the active environment or on PATH; install requirements.txt first.\n' >&2
  exit 1
fi

"$eubi_cmd" "$1" "$2"
