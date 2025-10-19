export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="bira"

# Intialize Shell for third party services
eval "$(zoxide init zsh)"
eval "$(ssh-agent -s)" # github

# Aliases
  # File system
alias cd='z'
alias ls='eza -l --icons --git --git-repos --header --no-user --group-directories-first --no-time'
alias la='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias cd="zd"
alias ggs="lazygit"
# tmux attach or create session
function t {
  if [ "$#" -eq 0 ]; then
    echo "Usage: tmx <session-name>"
    return 1
  fi
  name=$1
  if tmux has-session -t "$name" 2>/dev/null; then
    tmux attach -t "$name"
  else
    tmux new-session -s "$name"
  fi
}

function t {
  if [ "$#" -eq 0 ]; then
    echo "Usage: tmx <session-name>"
    return 1
  fi
  name=$1
  if tmux has-session -t "$name" 2>/dev/null; then
    tmux attach -t "$name"
  else
    tmux new-session -s "$name"
  fi
}
function t {
  if [ "$#" -eq 0 ]; then
    echo "Usage: tmx <session-name>"
    return 1
  fi
  name=$1
  if tmux has-session -t "$name" 2>/dev/null; then
    tmux attach -t "$name"
  else
    tmux new-session -s "$name"
  fi
}
zd() {
  if [ $# -eq 0 ]; then
    builtin cd ~ && return
  elif [ -d "$1" ]; then
    builtin cd "$1"
  else
    z "$@" && printf "\U000F17A9 " && pwd || echo "Error: Directory not found"
  fi
}
open() {
  xdg-open "$@" >/dev/null 2>&1 &
}
  # Misc
alias n='nvim'

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh


export PATH=$PATH:/home/micah/.spicetify
