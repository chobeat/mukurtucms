#!/bin/bash

set -e # Abort on error

if [ ! hash envsubst 2>/dev/null ]; then
	echo 'envsubst not found; please install GNU gettext.'
	exit 3
fi

# Load env vars from .env
set -a
. .env

scripts/docker-build.sh
echo "Launching docker-compose..."
docker-compose up "$@" # Passes any additional flags
