#!/usr/bin/env sh

BASE_FOLDER=`dirname "$0"`
SUPPORT_FOLDER="$BASE_FOLDER/../../../SharedSupport/"

source "$SUPPORT_FOLDER/rails_path.sh"

cd "$PROJECT_ROOT"
/usr/local/bin/bbedit db/migrate/`ls -t1 db/migrate | head -n 1`


