# ~/.config/fish/config.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ----------------------------------------
#          1. GIT USER MANAGEMENT
# ----------------------------------------
# check the active git user
function git-log
    set -l user_name (git config --global user.name)
    set -l user_email (git config --global user.email)
    echo "Current Git user.name: $user_name"
    echo "Current Git user.email: $user_email"
end

# commands to switch between my git users confs
function git-work
    git config --global user.name "David 1"
    git config --global user.email "email@company.com"
    git config --global core.sshCommand "ssh -i ~/.ssh/id_rsa_work"
    echo "Switching to WORK git"
    git-log
end

function git-github
    git config --global user.name "David 2"
    git config --global user.email "email@github.com"
    git config --global core.sshCommand "ssh -i ~/.ssh/id_rsa_personal"
    echo "Switching to GITHUB git"
    git-log
end


# ----------------------------------------
#          2. ALIASES
# ----------------------------------------
# git common commands
alias ggf='git fetch'
alias ggp='git pull --rebase'
alias gfgp='git fetch && git pull --rebase'
alias ggst='git status -s'
alias ggconf='git config --global --edit'
alias ggamd='git commit -a --amend --no-edit'
# clean branches, keeping master or develop
alias git_clean_master='git branch | grep -v "master" | xargs git branch -D'
alias git_clean_develop='git branch | grep -v "develop" | xargs git branch -D'


# ----------------------------------------
#          2. OTHER STUFF
# ----------------------------------------

# starship prompt
starship init fish | source

# pnpm
set -gx PNPM_HOME "/Users/dawichi/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Haskell Compiler
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /Users/dawichi/.ghcup/bin $PATH # ghcup-env
