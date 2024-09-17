#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

echo "
    _____
   /     \\
   vvvvvvv  /|__/|
      I   /O,O   |
      I /_____   |      /|/|
     J|/^ ^ ^ \  |    /00  |    _//|
      |^ ^ ^ ^ |W|   |/^^\ |   /oo |
       \m___m__|_|    \m_m_|   \mm_|    \""Totoros"\"

"
PS1='\[\e[32m\]\u\[\e[0m\] \[\e[34m\]\w\[\e[0m\] '

# set default editer
export EDITOR=nvim

# ls & grep
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lah'
alias grep='grep --color=auto'

# packages
alias vi='nvim'
alias ff='fzf_vi'
alias nf='fastfetch -c neofetch'

# iwctl
alias wifi_s='sudo iwctl station wlan0 scan'
alias wifi='sudo iwctl station wlan0 get-networks'
alias wifi_c='sudo iwctl station wlan0 connect'
alias wifi_d='sudo iwctl station wlan0 disconnect'

# tmux
tmux-load() {
  curl -s 'https://ipinfo.io/ip' > ~/.tmux_IP
}

alias tmux-reload='tmux-load && tmux'

# fzf-settings
fzf_vi() {
    local selected_file
    selected_file=$(find ~/ | fzf --height 17)
    
    if [ -n "$selected_file" ]; then
        vi "$selected_file"
    else
        echo "Cancelled"
    fi
}

export FZF_DEFAULT_OPTS='
  --preview "head -n 15 {} "
	--reverse
'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
