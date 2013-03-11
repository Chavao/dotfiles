if [ $USER == "vagrant" ]
then
    alias ws='cd /vagrant'
else
    alias ws='cd /var/www'
fi
alias g='geany'
alias desk='cd ~/Desktop'
alias f='uptime ; echo_br ; free -m ; echo_br ; df -Th'
alias wget='wget -c -T5'
alias cd..="cd .."
alias s="sublime_text"
alias dig='dig +nostats +nocomments +nocmd'
alias j='jobs'
alias c='clear'
alias l='ls -CFlartsh'
