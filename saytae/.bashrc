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
alias ff='fzf_vi'
alias nf='fastfetch -c neofetch'
alias yy='yay --noconfirm'

# nmcli
alias wifi='nmcli device wifi'

# fzf-settings
fzf_vi() {
    local selected_file
    selected_file=$(find ~ -type f | fzf --height 17)

    if [ -n "$selected_file" ]; then
        # file search
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
