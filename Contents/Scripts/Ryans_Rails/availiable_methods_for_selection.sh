#!/bin/sh

BASE_FOLDER=`dirname "$0"`
SUPPORT_FOLDER="$BASE_FOLDER/../../SharedSupport/"

source "$SUPPORT_FOLDER/rails_path.sh"
cd "$PROJECT_ROOT"

SELECTED_TEXT=`ruby "$SUPPORT_FOLDER/selected_text.rb"`

ruby "$SUPPORT_FOLDER/methods_for_this_class.rb" $SELECTED_TEXT tags db/schema.rb tmp/routes.txt
