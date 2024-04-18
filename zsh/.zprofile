
# Zoxide
if command -v zoxide &> /dev/null
then
    eval "$(zoxide init zsh)"
fi

# Fuzzy Finder
[[ -f $HOME/.fzf.zsh ]] && source $HOME/.fzf.zsh
[[ -f /usr/share/fzf/completition.zsh ]] && source /usr/share/fzf/completition.zsh
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
export FZF_TMUX_OPTS='-p80%,60%'

# Opam
[[ ! -r /home/alessio/.opam/opam-init/init.zsh ]] || source /home/alessio/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Rust
export RUST="$HOME/.cargo/bin"
export PATH="$RUST:$PATH"

# Opam
[[ ! -r /home/alessio/.opam/opam-init/init.zsh ]] || source /home/alessio/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# GO
alias air="$(go env GOPATH)/bin/air";
alias templ="$(go env GOPATH)/bin/templ";

# GODOT
alias godot="${HOME}/tools/Godot_v4.1.3/Godot_v4.1.3-stable_mono_linux.x86_64"

# .NET
export PATH="${HOME}/.dotnet/tools:${HOME}/.dotnet:$PATH"
export DOTNET_ROOT="${HOME}/.dotnet"

# NVM (fast loading -> https://superuser.com/questions/236953/zsh-starts-incredibly-slowly)
export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"

# Load Angular CLI autocompletion.
if command -v ng &> /dev/null
then
    source <(ng completion script)
fi

# Python
export PATH="/usr/local/share/python/:$PATH"
export PATH="$PY:$PATH"

# Configure thefuck
if command -v fuck &> /dev/null
then
    eval $(thefuck --alias)
fi

# Android
[[ -s "$HOME/Library/Android/sdk/platform-tools" ]] && export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

# Flutter
[[ -s "$HOME/dev/flutter/bin" ]] && export PATH="$HOME/dev/flutter/bin:$PATH"
[[ -s "$HOME/.pub-cache/bin" ]] && export PATH="$HOME/.pub-cache/bin:$PATH"

# Load Angular CLI autocompletion.
if command -v ng &> /dev/null
then
    source <(ng completion script)
fi

# bun completions
[ -s "/home/alessio/.bun/_bun" ] && source "/home/alessio/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Ruby Version manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

##### Aliases

if command -v eza &> /dev/null
then
    alias ls="eza"
    alias tree="eza --tree"
fi

alias ll="ls -alh"

##### Path for my stuff
scripts="$HOME/scripts"
export PATH="$PATH:$scripts"
