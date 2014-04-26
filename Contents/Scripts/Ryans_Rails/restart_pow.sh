#!/usr/bin/env sh

BASE_FOLDER=`dirname "$0"`
SUPPORT_FOLDER="$BASE_FOLDER/../../SharedSupport/"

source "$SUPPORT_FOLDER/rails_path.sh"

cd "$PROJECT_ROOT"

touch tmp/restart.txt
echo "Pow Restarted"


