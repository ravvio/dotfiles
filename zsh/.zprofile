export PATH="$PATH:/Users/alessioraviola/.local/bin"

# Rust
export RUST="$HOME/.cargo/bin"
export PATH="$PATH:$RUST"

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
if command -v fuck
then
    eval $(thefuck --alias)
fi

# Ruby Version manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
