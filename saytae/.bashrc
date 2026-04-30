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
         \m___m__|_|    \m_m_|   \mm_|
"
PS1='\e[34m\]\w\[\e[0m\] '
# PS1='\[\e[32m\]\u\[\e[0m\] \[\e[34m\]\w\[\e[0m\] '

# set default editer
export EDITOR=nvim

# ls & grep
alias ls='lsd --color=auto'
alias ll='ls -lh'
alias la='ls -ah'
alias lla='ls -lah'
alias lt='ls --tree'
alias grep='grep --color=auto'

# packages
alias vi='nvim'
alias rr='ranger'
alias img='swayimg'
alias mail='neomutt'
alias ff='fzf_vi'
alias nf='fastfetch -c neofetch'
alias yy='yay --noconfirm'
alias raamen='termdown 300 && mpv ~/Downloads/bell.mp3'

# iwctl
alias wifi_g='sudo iwctl station wlan0 get-networks'
alias wifi_s='sudo iwctl station wlan0 scan'
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
    selected_file=$(find ~ -type f | fzf --height 17)

    if [ -n "$selected_file" ]; then
        # 파일 확장자 확인
        case "${selected_file##*.}" in
            jpg|jpeg|png|webp|gif|bmp)
                swayimg --scale=fit "$selected_file"
                # imv "$selected_file"
                # swappy -f "$selected_file"
                ;;
            mp4|mkv|avi|mov)
                mpv "$selected_file"
                ;;
            pdf)
                zathura "$selected_file"
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# alias signal="/usr/bin/signal-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime"
alias signal="/usr/bin/signal-desktop --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"
