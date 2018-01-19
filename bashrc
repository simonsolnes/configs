# Command line

function title {
    echo -ne "\033]0;"$*"\007"
}
export -f title
function hei {
	echo 'ʰᵉⁱ'
}
function keyboardlayout {
	osascript -e 'tell application "System Events" to tell process "SystemUIServer" to get the value of the first menu bar item of menu bar 1 whose description is "text input"'
}

function pypypy {
	echo -e "#!/usr/bin/env python3\nimport re, struct, termios, fcntl, sys, random, time, json, requests, os, subprocess\nfrom pprint import pprint\ndef colorize(x, frmt='normal', fg='normal', bg='normal'):\n    c = {\"black\" : 0, \"red\" : 1, \"green\" : 2, \"yellow\" : 3, \"blue\" : 4, \"magenta\" : 5, \"cyan\" : 6, \"white\" : 7, \"normal\" : 8}\n    f = {\"normal\" : 0, \"bold\" : 1, \"faint\" : 2, \"italic\" : 3, \"underline\" : 4, \"slowblink\" : 5, \"rapidblink\" : 6, \"negative\" : 7, \"conceal\" : 8, \"crossedout\" : 9}\n    return '\\\x1b['+str(f[frmt])+';'+str(30+c[fg])+';'+str(40+c[bg])+'m'+x+'\\\x1b[0m'\nget_termdim = lambda: struct.unpack('HHHH', fcntl.ioctl(0, termios.TIOCGWINSZ, struct.pack('HHHH', 0, 0, 0, 0)))[0:2]\nbash = lambda cmd: subprocess.check_output(cmd, shell=True).decode('utf-8')\n" > ~/Dropbox/tmp.py

	chmod +x ~/Dropbox/tmp.py
	vim ~/Dropbox/tmp.py
}
function davidurl {
	
	echo "$@" | sed 's/ //g' | xargs open
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
alias lr="/Users/simonsolnes/Dropbox/programming/ls/ls.py"

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
alias mntserver="sshfs -p 22 simon@139.162.142.101:/ ~/mount -oauto_cache,reconnect,defer_permissions,noappledouble,negative_vncache,volname=server"

# OS
alias show-hidden='defaults write com.apple.finder AppleShowAllFiles YES'
alias hide-hidden='defaults write com.apple.finder AppleShowAllFiles NO'


# Scripts
alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
