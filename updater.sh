#!/bin/bash
echo "check update ..."

# download perbaruan
function update {
    git pull origin master
    echo "update to new version"
}

# download
function extract {
    cat x* > file.zip
    7z e file.zip
}

function removeDir {
    rm ../program/*
}

function copyFile {
    # copy serial number
    cp ~/.serial_number.txt ../program
    mv ui.AppImage ../program
    mv api-golang ../program
    mv api-python.py ../program 
}

# reboot
function restart {
    sudo reboot
}

# cek versi
git config --global credential.helper store
git fetch
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")
if [ $LOCAL = $BASE ]; then
    update
    extract
    removeDir
    copyFile
fi

restart

