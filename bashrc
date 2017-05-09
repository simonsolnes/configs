# Command line

PS1="→ " 
set -o vi
alias la='ls -laFhog'
alias ls='ls -F1A'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'

# OS
alias show-hidden='defaults write com.apple.finder AppleShowAllFiles YES'
alias hide-hidden='defaults write com.apple.finder AppleShowAllFiles NO'


# Directories
alias ddes='cd ~/Desktop'
alias dpro='cd ~/Dropbox/Programming/'
alias dscr='cd ~/Dropbox/scripts'
alias dbox='cd ~/Dropbox/'
alias ddoc='cd ~/Dropbox/Documents/'
alias din1='cd ~/Dropbox/Studier/INF-1101/'
alias din4='cd ~/Dropbox/Studier/INF-1400/'
alias dsta='cd ~/Dropbox/Studier/STA-1001/'

# Programming
alias cc='function _cc () {gcc $1 -o a}'
alias edtem='vim /usr/local/Cellar/pandoc/1.17.2/share/x86_64-osx-ghc-8.0.1/pandoc-1.17.2/data/templates/template.latex'

#english in r
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Scripts
alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
