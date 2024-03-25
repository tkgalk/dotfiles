# Preferred editor for local and remote sessions.
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# setup zoxide
eval "$(zoxide init --cmd cd zsh)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# Bind nvim to vim.
alias vim=nvim

# Start the starship prompt.
eval "$(starship init zsh)"

op inject --in-file "${HOME}/.secrets.zsh" | while read -r line; do
  eval "$line"
done

