# Shell
alias j='jobs'
alias c='clear'
alias l='ls -CFlartsh'
alias d='cd'
alias cd..="cd .."
alias grepi='grep -i'
alias .='source'

# Commands
alias vim='/opt/nvim/bin/nvim'
alias wget='wget -c -T5'
alias curl='curl -sS'
alias dig='dig +nostats +nocomments +nocmd'
alias pass='gnome-keyring-daemon -r -d'
alias xclip='xclip -selection c'
alias ifconfig="ip -c a | sed -e 's/\// \//g'"

# Close commands
alias x='xmodmap $HOME/.Xmodmap; if [[ -z $TMUX ]]; then exit; else tmux detach; fi'
alias "/q"='x'
alias ":q"='x'
alias ":Q"='x'

# Folders
alias down='cd $HOME/Downloads'
alias desk='cd $HOME/Desktop'
alias doc='cd $HOME/Documents'

# Tools
alias myip='curl https://ifconfig.me'
