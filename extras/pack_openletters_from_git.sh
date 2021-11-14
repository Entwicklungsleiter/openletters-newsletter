#!/bin/bash

HEUTE=$(date -I)
GIT_ROOT_FOLDER=$(git rev-parse --show-toplevel)
CURRENT_GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
CURRENT_VERSION=$(echo $CURRENT_GIT_BRANCH| sed -e 's/\//_/g')
OPEN_LETTERS_ARCHIVE_FILE=$HOME"/"$HEUTE"_OpenLetters_"$CURRENT_VERSION".zip"

cd $GIT_ROOT_FOLDER
echo "generating file" $OPEN_LETTERS_ARCHIVE_FILE
echo "git archive --format zip --output $OPEN_LETTERS_ARCHIVE_FILE $CURRENT_GIT_BRANCH"
git archive --format zip --output $OPEN_LETTERS_ARCHIVE_FILE $CURRENT_GIT_BRANCH
echo "Done."
echo $(ls -alh $OPEN_LETTERS_ARCHIVE_FILE)
