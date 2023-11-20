export PATH="$PATH:/Users/alessioraviola/.local/bin"

# GO
alias air="$(go env GOPATH)/bin/air";
alias templ="$(go env GOPATH)/bin/templ";

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Python
export PATH="/usr/local/share/python/:$PATH"
export PATH="$PY:$PATH"

# Configure thefuck
eval $(thefuck --alias)

# Ruby Version manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
