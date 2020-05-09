# disable awkward history expansion in bash (with '!' sign)
set +o histexpand
# don't save lines starting from space and duplicates in history
export HISTCONTROL=ignoreboth
# exclude compilation artifacts from filename completion
export FIGNORE=".pyc:.pyo:.o"

export PS1="\[\e[0;032m\]\u@\[\e[1;032m\]\w\$(if (( \$? != 0 )); then echo \"\[\e[1;31m\]\"; fi)\$ \[\e[0m\]"

. .shell/interactive
