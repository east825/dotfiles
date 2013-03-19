#!/bin/bash

set -x
excluded=('.gitignore' '.gitmodules' '.git')

ls -A | grep '^\.' | while read dotfile; do
    if grep -q "$dotfile" <<< "${excluded[@]}"; then
        continue
    fi
    target=~/$dotfile
    if [[ -e "$target"  && ! -h "$target" ]]; then
        echo "File '$target' exists and not a symlink" >&2
        continue
    fi
    echo "Symlinking $target..."
    ln -sfn "$(readlink -e $dotfile)" "$target" 
done
