#!/usr/bin/env sh

# raise if more than 2 params passed
if [ "$#" -ne 2 ]; then
  printf 'Usage: %s <input_dir> <output_dir>\n' "$0" >&2
  exit 1
fi

# convert files in input dir, save in output dir
eubi to_zarr "$1" "$2"
