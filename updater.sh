#!/bin/bash
echo "check update ..."

# download perbaruan
function update {
    git pull origin master
    echo "update to new version"
}

# cek versi
git config --global credential.helper store
git fetch origin master
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")
if [ $LOCAL = $BASE ]; then
    update
else
    echo "error"
fi