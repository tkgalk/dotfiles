# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="flazz"

zstyle ':omz:update' mode auto

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git zsh-autosuggestions zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions.
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# setup zoxide
eval "$(zoxide init --cmd cd zsh)"
