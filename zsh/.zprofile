
addToPath () {
    if [[ -s $1 ]]; then
        if [[ "$PATH" != *"$1"* ]]; then
            export PATH="$PATH:$1"
        fi
    fi
}

addToPathFront () {
    if [[ -s $1 ]]; then
        if [[ "$PATH" != *"$1"* ]]; then
            export PATH="$1:$PATH"
        fi
    fi
}

addToPath "$HOME/scripts"

libs="$HOME/libs"
addToPath "$libs/zig"
addToPath "$libs/zls/zig-out/bin"

# Homebrew
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

# Android
addToPath "$HOME/Library/Android/sdk/platform-tools"
# Flutter
addToPath "$HOME/dev/flutter/bin"
addToPath "$HOME/.pub-cache/bin"

# Ruby
addToPathFront "/opt/homebrew/opt/ruby/bin"
# Gems
export GEM_HOME=$HOME/.gem
addToPathFront $GEM_HOME/bin:$PATH

# Bun
addToPath "$HOME/.bun/bin"

# Rust
addToPathFront "$HOME/.cargo/bin"

# Python
addToPathFront "/usr/local/share/python"
# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
addToPathFront "$PYENV_ROOT/bin:$PATH"

# .NET
export DOTNET_ROOT="${HOME}/.dotnet"
addToPathFront "${DOTNET_ROOT}"
addToPathFront "${DOTNET_ROOT}/tools"

# Goenv
# if [[ -s "$HOME/.goenv" ]]; then
#     export GOENV_ROOT="$HOME/.goenv"
#     addToPathFront "${GOENV_ROOT}/bin"
#     eval $(goenv init -)
# fi


# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
