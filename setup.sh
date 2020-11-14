#!/bin/bash
dotfilesDir=$(pwd)

function linkDotfile {
    dest="${HOME}/${1}"
    dateStr=$(date +%Y-%m-%d-%H%M)

    # Existing symlink
    if [ -h ~/${1} ]; then
        echo "Removing existing symlink: ${dest}"
        rm ${dest}

    # Existing file
    elif [ -f "${dest}" ]; then
        echo "Backing up existing file: ${dest}"
        mv ${dest}{,.${dateStr}}

    # Existing dir
    elif [ -d "${dest}" ]; then
        echo "Backing up existing dir: ${dest}"
        mv ${dest}{,.${dateStr}}
    fi

    echo "Creating new symlink: ${dest}"
    ln -s ${dotfilesDir}/${1} ${dest}
}

linkDotfile .bashrc
linkDotfile .gf
linkDotfile .rice
linkDotfile .nanorc
linkDotfile .tmux.conf
linkDotfile .aliases
linkDotfile .prompt
