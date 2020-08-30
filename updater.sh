#!/bin/bash
echo "check update ..."

git config --global credential.helper store
git fetch origin master

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")
if [ $LOCAL = $BASE ]; then
    git pull origin master
    echo "pull new version"
else
    echo "error"
fi

