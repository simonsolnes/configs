# Command line

function title {
    echo -ne "\033]0;"$*"\007"
}
export -f title
function hei {
	echo 'ʰᵉⁱ'
}
function sync {

	cp ~/Dropbox/config/bash/bashrc ~/Dropbox/server/.bashrc
	cp ~/Dropbox/config/git/git-credentials ~/Dropbox/server/.git-credentials
	cp ~/Dropbox/config/git/gitconfig ~/Dropbox/server/.gitconfig
	rmtrash ~/Dropbox/server/.vim
	cp -r ~/Dropbox/config/vim/vim ~/Dropbox/server/.vim
	#cp ~/Dropbox/config/vim/vimrc ~/Dropbox/server/.vimrc
	unison -silent
}
function keyboardlayout {
	osascript -e 'tell application "System Events" to tell process "SystemUIServer" to get the value of the first menu bar item of menu bar 1 whose description is "text input"'
}

function mdpdfplus {
	mdpdf $1
	open $(basename "$1" .md).pdf
	osascript -e 'tell application "iTerm" to activate'
}


export LATEX_HEADER='/Users/simonsolnes/Dropbox/config/latex_header'
export WOLFRAM_ALPHA_V2_APP_ID='UWHV9P-PH2TUXW377'
export MANPAGER="col -b | vim -MR - "
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR='vim'

export PS1="\[$(tput bold)\]\[\033[38;5;6m\]\W\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;3m\]→\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

alias vimpager="vim -MR -c 'file [stdin]' -"
# alias cd="cd $1; pwd | xargs echo -ne \"\033]0;"$*"\007\""

alias la='ls -laFhog'
alias ls='ls -F1A'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc; source ~/.bashrc'
alias lock='osascript -e "tell app \"ScreenSaverEngine\" to activate"'
alias sshserver='ssh simon@139.162.142.101'

# OS
alias show-hidden='defaults write com.apple.finder AppleShowAllFiles YES'
alias hide-hidden='defaults write com.apple.finder AppleShowAllFiles NO'

alias tput='tty -s && tput '


# Scripts
alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
