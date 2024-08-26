# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH="$PATH:$HOME/.local/bin"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


### PLUGIN

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# P10K
zinit ice depth=1; zinit light romkatv/powerlevel10k
# Autosuggestions
zinit light zsh-users/zsh-autosuggestions
# Completions
zinit light zsh-users/zsh-completions
# Syntax Highlighting
zinit light zsh-users/zsh-syntax-highlighting
# Fuzzy find tab
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh &> /dev/null)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# .NET
export PATH="${HOME}/.dotnet/tools:${HOME}/.dotnet:$PATH"
export DOTNET_ROOT="${HOME}/.dotnet"

# Python
export PATH="/usr/local/share/python/:$PATH"
export PATH="$PY:$PATH"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv &> /dev/null
then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

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
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh"  > /dev/null 2> /dev/null

# NVM
export NVM_DIR="$HOME/.nvm"
# (fast loading -> https://superuser.com/questions/236953/zsh-starts-incredibly-slowly)
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"

# Rust
export RUST="$HOME/.cargo/bin"
export PATH="$RUST:$PATH"

# Load Angular CLI autocompletion.
if command -v ng &> /dev/null
then
    source <(ng completion script)
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun copletions
[ -s "/home/alessio/.bun/_bun" ] && source "/home/alessio/.bun/_bun"

# Thefuck
if command -v fuck &> /dev/null
then
    eval $(thefuck --alias)
fi

# Ruby Version manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin"

# Android
[[ -s "$HOME/Library/Android/sdk/platform-tools" ]] && export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

# Flutter
[[ -s "$HOME/dev/flutter/bin" ]] && export PATH="$HOME/dev/flutter/bin:$PATH"
[[ -s "$HOME/.pub-cache/bin" ]] && export PATH="$HOME/.pub-cache/bin:$PATH"

# GO
if command -v go &> /dev/null
then
    export GOPATH="$(go env GOPATH)"
    export PATH="$GOPATH/bin:$PATH"
fi

### Path for my stuff

scripts="$HOME/scripts"
export PATH="$PATH:$scripts"

### Misc Aliases

# Eza
if command -v eza &> /dev/null
then
    alias ls="eza"
    alias tree="eza --tree"
fi

# Nice list
alias ll="ls -alh"


## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/alessio/.dart-cli-completion/zsh-config.zsh ]] && . /home/alessio/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# OPT OUT
export SAM_CLI_TELEMETRY=0

# Default editor
export EDITOR="nvim"
