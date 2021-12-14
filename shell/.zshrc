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
fpath+="$HOME/.zfunc"
compinit
# End of lines added by compinstall

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$SSH_CONNECTION" ]; then
    export PS1="%F{green}%n@%U%m%u:%F{green}%B%~%(?..%F{red})%(!.#.$) %f%b"
else
    export PS1="%F{green}%n@%B%~%(?..%F{red})%(!.#.$) %f%b"
fi

. "$HOME/.shell/interactive"


export PATH="$HOME/.poetry/bin:$PATH"
