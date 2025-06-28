#/usr/bin/env bash

root=${1:-.}

previewer="ls"
if [ -x "$(command -v eza)" ]; then
    previewer="eza"
fi

OUTPUT=$(
    fzf --walker dir \
        --preview="$previewer -alh --color=always {}" \
        --preview-window=up,40% \
        --walker-root="$root" \
        --exit-0 \
)

if [ "$OUTPUT" != "" ]; then
    cd $OUTPUT
    $SHELL
fi

