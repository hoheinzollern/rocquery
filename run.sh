#!/bin/sh

BASE="$(dirname "$0")"
if [ -z "$BASE" ]; then
  BASE="."
fi

. ./venv/bin/activate

gunicorn -w 1 'main:app' --bind 0.0.0.0