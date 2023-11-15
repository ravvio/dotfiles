
# GO
alias air="$(go env GOPATH)/bin/air";
alias templ="$(go env GOPATH)/bin/templ";

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Pyrthon
export PATH="/usr/local/share/python/:$PATH"
export PATH="$PY:$PATH"
