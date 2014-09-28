# Basic completion features
autoload -U compinit promptinit
compinit && promptinit

# Selectable ncurses-like menu with completion variants
zstyle ':completion:*' menu select
# Go backward in Zsh menus by Shift+Tab
bindkey '^[[Z' reverse-menu-complete

# Good old familiar Bash shell prompt
# export PS1="\[\e[0;032m\]\u@\[\e[1;032m\]\w\$(if (( \$? != 0 )); then echo \"\[\e[1;31m\]\"; fi)\$ \[\e[0m\]"

autoload -U colors && colors
PROMPT="%{%F{green}%}%n@%B%{%F{green}%}%~%{%(?.%F{green}.%F{red})%}$ %{%b%f%}"
# Alternative syntax
# PROMPT="%{$fg[green]%}%n@%B%{$fg[green]%}%~%{%(?.$fg[green].$fg[red])%}$ %{$reset_color%}"
# RPROPMT=""

DIRSTACKSIZE=20
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}
setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

