# Command line


function clipup {
	if [ ! -z "$1" ]; then
		curl -X POST --data "$1" http://solnes.co/clipboard.txt
	else
		curl -X POST --data "$(pbpaste)" http://solnes.co/clipboard.txt
	fi
}
function clipdown {
	a=$(curl -s http://solnes.co/clipboard.txt)
	regex='^(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]$'
	if [[ $a =~ $regex ]]; then
		open $a
	else
		echo -e "$a" | pbcopy
	fi

}

function title {
    echo -ne "\033]0;"$*"\007"
}
alias create="touch $1; chmod +x $1; vim $1"
export -f title
function hei {
	echo 'ʰᵉⁱ'
}
alias to=". gotodir"
function keyboardlayout {
	osascript -e 'tell application "System Events" to tell process "SystemUIServer" to get the value of the first menu bar item of menu bar 1 whose description is "text input"'
}

function pypypy {
	echo -e "#!/usr/bin/env python3\nimport re, struct, termios, fcntl, sys, random, time, json, requests, os, subprocess\n" > ~/Dropbox/tmp.py

	chmod +x ~/Dropbox/tmp.py
	vim ~/Dropbox/tmp.py
}
function davidurl {
	
	echo "$@" | sed 's/ //g' | xargs open
}
function wherethefuck {
	find . -name "$1" -print
}

function json {
	cat "$1" | python -m json.tool
}

alias timer='~/Dropbox/programming/timer.py'
function mdpdfplus {
	mdpdf $1
	open $(basename "$1" .md).pdf
	osascript -e 'tell application "iTerm" to activate'
}
function web {
	echo $@ | sed 's/ /\+/' | xargs -I {} open "https://duckduckgo.com/?q={}&t=osx&ia=web"
}
alias ls="~/Dropbox/programming/ls/ls.py"

export LATEX_HEADER='/Users/simonsolnes/Dropbox/config/latex_header.latex'
export BUDGETS_PATH='/Users/simonsolnes/Dropbox/Finance/budget'
export WOLFRAM_ALPHA_V2_APP_ID='UWHV9P-PH2TUXW377'
export MANPAGER="col -b | vim -MR - "
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR='vim'

export PS1="\[\e[2;38;48m\]\t\[\e[0m\] \[\e[1;36;48m\]\W\[\e[0m\] \[\e[1;33;48m\]>\[\e[0m\] "
alias vimpager="vim -MR -c 'file [stdin]' -"

alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc; source ~/.bashrc'
#alias lock='osascript -e "tell app \"ScreenSaverEngine\" to activate"'
alias sshserver='ssh -Y simon@139.162.142.101'
alias sshopenttd='ssh root@139.162.172.62'
alias mntserver="sshfs -p 22 simon@139.162.142.101:/ ~/mount/ -oauto_cache,reconnect,defer_permissions,noappledouble,negative_vncache,volname=server"

# Programs
alias gerp='grep'
alias g='git'
alias python='python3'
dbash() { docker exec -it $(docker ps -aqf "image=$1") bash; }

# OS
alias show-hidden='defaults write com.apple.finder AppleShowAllFiles YES'
alias hide-hidden='defaults write com.apple.finder AppleShowAllFiles NO'

# Scripts
alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'

clear
#echo "setleds: Error reading current flags setting. Maybe you are not on the console?: ioctl KDGKBLED: Inappropriate ioctl for device"
