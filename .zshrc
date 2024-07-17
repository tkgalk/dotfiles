# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path.
PATH="$HOME/.go/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Go stuff.
export GOPRIVATE=github.com/deliveroo
export GOFLAGS=-ldflags=-extldflags=-Wl,-ld_classic;
export PATH="$PATH:$(go env GOPATH)/bin"

# Set preferred editor.
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Directory where zinit will live.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# If zinit is not installed, install it.
if [ ! -d "${ZINIT_HOME}" ]; then
	mkdir -p "$(dirname "${ZINIT_HOME}")"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/load zinit.
source "${ZINIT_HOME}/zinit.zsh"

# Prompt.
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins.
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions.
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings.
bindkey -e
bindkey '^y' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Alieses.
alias vim=nvim
alias ls='ls --color'

# Completion should be case-insensitive.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Completions should be coloured.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# No completions menu.
zstyle ':completion:*' menu no
# Show directory preview for fzf.
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# Show zoxide preview for fzf.
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# History.
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

# Shell integrations.
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(rbenv init - zsh)"

# Set default postgres user.
export PGUSER=postgres

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
