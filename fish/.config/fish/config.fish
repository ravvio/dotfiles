
# Initialize starship prompt
starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# function fzf --wraps=fzf --description="Use fzf-tmux if in tmux session"
#   if set --query TMUX
#     fzf-tmux $argv
#   else
#     command fzf $argv
#   end
# end
