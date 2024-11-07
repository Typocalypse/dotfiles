set -o emacs
export PATH=~/.local/bin/:$PATH
export PATH=~/.config/scripts/:$PATH
export PATH=~/.local/share/nvim/mason/bin/:$PATH

export EDITOR=nvim
export VISUAL=nvim
export BAT_THEME="Dracula"

export COLORTERM=truecolor

RANGER_LOAD_DEFAULT=false

alias v='neovide'
alias r='ranger'
alias c='clear'
alias dotgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
export BROWSER="/usr/bin/brave"
export MASON=~/.local/share/nvim/mason


source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.ghcup/env


# export TERM=alacritty
alias ssh='TERM=xterm-256color ssh'

bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest
bindkey "^R" history-incremental-pattern-search-backward
# bindkey '^I'   autosuggest-accept    # tab          | autosuggest
# bindkey '^[[Z' complete-word  # shift + tab  | complete


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

export SONAR_SCANNER_HOME="/opt/sonar-scanner"
export PATH="${SONAR_SCANNER_HOME}/bin:${PATH}"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(/home/dip-esh/.local/bin/mise activate zsh)"
