# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# Make Ctrl+U behave like in Bash
bindkey \^U backward-kill-line
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PS1="%F{green}%n@%B%~%(?..%F{red})%(!.#.$) %f%b"

. "$HOME/.shell/interactive"
