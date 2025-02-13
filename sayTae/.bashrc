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
PS1='\e[34m\]\w\[\e[0m\] '
# PS1='\[\e[32m\]\u\[\e[0m\] \[\e[34m\]\w\[\e[0m\] '

# set default editer
export EDITOR=nvim
# export EDITOR=codium

# ls & grep
alias ls='lsd --color=auto'
alias ll='ls -lh'
alias la='ls -ah'
alias lla='ls -lah'
alias lt='ls --tree'
alias grep='grep --color=auto'

# packages
alias vi='nvim'
alias ff='fzf_vi'
alias nf='fastfetch -c neofetch --logo ~/Pictures/和.png'
# alias nf='fastfetch -c neofetch --logo ~/Pictures/masiro.png'
alias cpf='cpufetch'
alias pv='pipe-viewer'

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
    selected_file=$(find ~ | fzf --height 17)

    if [ -n "$selected_file" ]; then
        # 파일 확장자 확인
        case "${selected_file##*.}" in
            jpg|jpeg|png|gif|bmp)
                swappy -f "$selected_file"
                ;;
            mp4|mkv|avi|mov)
                mpv "$selected_file"
                ;;
            *)
                vi "$selected_file"
                ;;
        esac
    else
        echo "取り消し"
    fi
}

# fzf_vi() {
#     local selected_file
#     selected_file=$(find ~ | fzf --height 17)
    
#     if [ -n "$selected_file" ]; then
#         vi "$selected_file"
#     else
#         echo "取り消し"
#     fi
# }

# set z to jump
# . /usr/share/z/z.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# alias codium="/usr/bin/codium --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland %F"

alias codium="ELECTRON_OZONE_PLATFORM_HINT=wayland /usr/bin/codium"
