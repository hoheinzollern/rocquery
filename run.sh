#!/bin/sh

BASE="$(dirname "$0")"
if [ -z "$BASE" ]; then
  BASE="."
fi

. ./venv/bin/activate

python3 main.py