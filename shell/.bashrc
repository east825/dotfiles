# disable awkward history expansion in bash (with '!' sign)
set +o histexpand
# don't save lines starting from space and duplicates in history
export HISTCONTROL=ignoreboth
# exclude compilation artifacts from filename completion
export FIGNORE=".pyc:.pyo:.o"

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$SSH_CONNECTION" ]; then
    export PS1="\[\e[0;032m\]\u@\[\e[4;032m\]\h\[\e[0;032m\]:\[\e[1;032m\]\w\$(if (( \$? != 0 )); then echo \"\[\e[1;31m\]\"; fi)\$ \[\e[0m\]"
else
    export PS1="\[\e[0;032m\]\u@\[\e[1;032m\]\w\$(if (( \$? != 0 )); then echo \"\[\e[1;31m\]\"; fi)\$ \[\e[0m\]"
fi

. "$HOME/.shell/interactive"
