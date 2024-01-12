
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

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Python
export PATH="/usr/local/share/python/:$PATH"
export PATH="$PY:$PATH"

# Configure thefuck
if command -v fuck &> /dev/null
then
    eval $(thefuck --alias)
fi

# Ruby Version manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Flutter
[[ -s "$HOME/dev/flutter/bin" ]] && export PATH="$PATH:$HOME/dev/flutter/bin"
[[ -s "$HOME/.pub-cache/bin" ]] && export PATH="$PATH:$HOME/.pub-cache/bin"

##### Aliases

if command -v exa &> /dev/null
then
    alias ls="exa"
    alias ll="exa -alh"
    alias tree="exa --tree"
fi
