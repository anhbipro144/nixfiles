# Download Znap, if it's not there yet.
[[ -r ~/repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/repos/znap
source ~/repos/znap/znap.zsh 

      if [ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
        source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      fi

# Env
#export XDG_CONFIG_HOME=/home/neo/.config/nvim
export PNPM_HOME=/home/neo/.local/share/pnpm
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/personal/work/wa:$PATH"
export NVM_DIR="$HOME/.config/nvm"
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim' 'vim' 'vi')
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_AUTO_USE=true
export LLM_MODEL="o4-mini"
export DIRENV_LOG_FORMAT=""


# Nix daemon (multi-user install)
# if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
#   . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
# fi

# --- Completion Initialization (PLACE AT VERY TOP) ---
autoload -Uz compinit
zmodload -i zsh/complist
compinit -i

zstyle ':completion:*' completer \
  _expand _complete _match _approximate _correct _complete:-fuzzy _ignored
zstyle ':completion:*' special-dirs true
_comp_options+=(globdots)

setopt globdots
# --- Plugin & Vi-Mode Loading BELOW THIS LINE ---
# e.g., znap, starship, direnv, etc.

# --- After jeffreytse/zsh-vi-mode is sourced: ---
zvm_after_init_commands+=('bindkey -M viins "^N" menu-select')
zvm_after_init_commands+=('bindkey -M viins "^P" menu-select')

# Sources 
#source $HOME/.config/nvim/zshrc.d/dots-hyprland.zsh # Source color generated from end4 dotfile
#source /home/neo/.zsh/pd-complete.zsh
#source /home/neo/.zsh/ps-complete.zsh
#source /home/neo/.zsh/pnpm-complete.zsh


# Starts plugins.
znap source zsh-users/zsh-syntax-highlighting
znap source marlonrichert/zsh-autocomplete
znap source marlonrichert/zsh-edit
znap source lukechilds/zsh-nvm
znap source jeffreytse/zsh-vi-mode


# Config for ctrl+n & ctrl+p in insert mode
# in your ~/.zshrc, after loading zsh-vi-mode plugin
# zvm_after_init_commands+=('_comp_options+=(globdots)')
# zvm_after_init_commands+=('zmodload -i zsh/complist')
zvm_after_init_commands+=('bindkey -M viins "^N" menu-select')
zvm_after_init_commands+=('bindkey -M viins "^P" menu-select')

# Workaround for the zsh-autocomplete's realtime complete to work
# Github issue : https://github.com/marlonrichert/zsh-autocomplete/issues/761
# setopt interactivecomments



# autoload -Uz compinit
# # zmodload -i zsh/complist        # load menu-select support
# compinit
# # _comp_options+=(globdots)       # include dotfiles in completion matches
# zmodload -i zsh/complist     # enable menu-select


# Initialize 
eval "$(starship init zsh)" # Starship
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

eval "$(ssh-agent -s)" > /dev/null

# Python
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"


ssh-add ~/.ssh/oneKey > /dev/null 2>&1
ssh-add ~/.ssh/neoOnUbuntu > /dev/null 2>&1

zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([1-9]#) ([0-9a-z-]#)*=01;34=0=01'

# zstyle ':completion:*' completer _expand _complete _match _approximate

# bindkey -v
bindkey -r '^j'
bindkey -M menuselect '\r' .accept-line

# Alisases
# General
alias cls='clear'

# Better ls
alias l="eza --icons=always"
alias ls="eza --icons=always -a"
alias ll="eza -lg --icons=always"
alias la="eza -lag --icons=always"
alias lt="eza -lTg --icons=always"

# Better cd
alias cd='z' # Show hidden files
alias oz='nv ~/.zshrc' # Show hidden files

# Openvpn
alias vpnon='openvpn3 session-start --config /etc/openvpn/Profile3.ovpn'
alias vpnoff='openvpn3 session-manage --config /etc/openvpn/Profile3.ovpn --disconnect'

# Docker compose
alias dockerup="sudo docker compose -f /home/neo/Neo/Work/ceh-do/docker-compose.dev.yml up -d"
alias dockerdown="sudo docker compose -f /home/neo/Neo/Work/ceh-do/docker-compose.dev.yml down"
alias dc="docker compose"

# Warp
alias warpcheck="curl https://www.cloudflare.com/cdn-cgi/trace/"
alias warpon="warp-cli connect"
alias warpoff="warp-cli disconnect"

## gg chrome
alias gg="setsid google-chrome-stable > /dev/null 2>&1 &"
alias gge='setsid google-chrome-stable --enable-features=UseOzonePlatform --ozone-platform=wayland > /dev/null 2>&1 & disown && exit'

# nautilus
alias nau="nohup nautilus -w . > /dev/null &"

# Nvim
alias vim="nvim"
alias vi="nvim"
alias n="nvim"
alias nv="nvim"
alias nvv="nvim"


#Nix
alias hms='nix run home-manager#home-manager -- switch --flake /home/neo/testflake#neo'



# Shine-wa
alias wadev="cloud-sql-proxy --address 0.0.0.0 --port 3306 one-global-ocps-dev:asia-southeast1:ocps-dev-db "
alias waprod="cloud-sql-proxy --address 0.0.0.0 --port 3303 one-global-ocps-prod:asia-southeast1:ocps-prod-db2"
alias watest="cloud-sql-proxy --address 0.0.0.0 --port 3302 one-global-ocps-test:asia-southeast1:ocps-test-db"

lll() {
  llm --tool web_search "$*"
}


ci() {
  if [ $# -eq 0 ]; then
    echo "Usage: zn <pattern>"
    return 1
  fi
  z "$@" && nvim .
}


case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac




# Run fetch
# macchina

