if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vim=nvim
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

load_nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mars/.google-cloud-sdk/path.fish.inc' ]; . '/Users/mars/.google-cloud-sdk/path.fish.inc'; end

source ~/.iterm2_shell_integration.fish

