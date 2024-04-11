# ~/.config/fish/config.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# aliases / common commands
alias ggf='git fetch'
alais ggp='git pull'
alias gfgp='git fetch && git pull'
alias git_clean_master='git branch | grep -v "master" | xargs git branch -D'
alias git_clean_develop='git branch | grep -v "develop" | xargs git branch -D'

# pnpm
set -gx PNPM_HOME "/Users/dawichi/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /Users/dawichi/.ghcup/bin $PATH # ghcup-env
