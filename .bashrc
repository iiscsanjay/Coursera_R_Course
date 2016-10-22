# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
#---------------Display settting for user and root environment-----------------
if [ "$BASH" ]; then
	if [ "`id -u`" -eq 0 ]; then
		# The root prompt is red.
		PS1='\[\033[0;31m\]\u@\h:\w >\[\033[0;37m\] '
	else
		PS1='\[\033[1;32m\]\u\[\033[0;32m\]@\[\033[1;32m\]\h\[\033[0;37m\]:\[\033[1;36m\]\w\[\033[0;37m\] > '
	fi
else
	if [ "`id -u`" -eq 0 ]; then
		PS1='# '
	else
		PS1='$ '
	fi
fi
export PS1
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
PASS="bhaSumita"
HOST=`uname`
if [ "${HOST}" == "Darwin" ]; then
    export CLICOLOR='true'
    export LC_ALL="en_US" 
    export LSCOLORS=ExFxCxDxBxegedabagacad 
#    export LSCOLORS=GxBxCxDxBxegedabagacad
#    export LSCOLORS=exfxcxdxbxegedabagacad
#    export LSCOLORS=gxfxcxdxbxegedabagacad 
#    export LSCOLORS=HxFxCxDxBxegedabagacad
    export PATH="$PATH:/opt/local/bin:/opt/local/sbin"
    export PATH="/usr/local/ncbi/blast/bin:$PATH"
    export PATH="/Applications/MATLAB_R2015a.app/bin:$PATH"
    export PATH="/Library/Frameworks/Python.framework/Versions/3.3/bin:$PATH"
    alias d0="du -h -d 0"
    alias d1="du -h -d 1"
    alias d2="du -h -d 2"
    alias host='echo $PASS | sudo -S sysctl -w kern.hostname="MacSara"'
    alias mem="/Users/sanjayk/Dropbox/Service/memReport3.py"
    alias eject="drutil tray eject"
    alias l1="gls -plh --color=auto --group-directories-first --sort=extension"
    alias iumount="echo $PASS | sudo -S diskutil umountDisk $@"
    alias ffdisk="diskutil list"
#---------to search and install through port command---///
    alias ys="port search"
    alias yi="echo $PASS | sudo -S port install"
    alias yu="echo $PASS | sudo -S port -d selfupdate"
    alias yo="echo $PASS | sudo -S port upgrade outdated"
    alias yc="echo $PASS | sudo -S port clean --all installed"
    alias yr="echo $PASS | sudo -S port uninstall $@"
    alias pip2s="echo $PASS | sudo -S pip --proxy='http://sercsanjayk:fireisout5477@proxy.iisc.ernet.in:3128' search $@"
    alias pip2i="echo $PASS | sudo -S pip --proxy='http://sercsanjayk:fireisout5477@proxy.iisc.ernet.in:3128' install $@"
    #----------application to open with commandline-----//
    alias preview="/Applications/Preview.app/Contents/MacOS/Preview"
    alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
    alias mplayer="/Applications/MPlayerX.app/Contents/MacOS/MPlayerX"
    alias matlab="/Applications/MATLAB_R2015a.app/bin/matlab -c /Users/sanjayk/Documents/lic_standalone14.dat"
    alias macvim="/Applications/MacPorts/MacVim.app/Contents/MacOS/MacVim"
    alias start="/Users/sanjayk/Dropbox/Service/startup.sh"
    alias startH="/Users/sanjayk/Dropbox/Service/start.sh"
    alias wakeUpAnduin="/opt/local/bin/wol 00:22:4d:ab:1e:07"
    alias wakeUpNewMail="/opt/local/bin/wol 4c:72:b9:4e:ca:75"
else 
    eval `dircolors`
    LS_COLORS="$LS_COLORS*.JPG=01;35:*.GIF=01;35:*.jpeg=01;35:*.pcx=01;35:*.png=01;35:*.pnm=01;35:*.bz2=01;31:*.mpg=01;38:*.mpeg=01;38:*.MPG=01;38:*.MPEG=01;38:*.m4v=01;038:*.mp4=01;038:*.swf=01;038:*.avi=01;38:*.AVI=01;38:*.wmv=01;38:*.WMV=01;38:*.asf=01;38:*.ASF=01;38:*.mov=01;38:*.MOV=01;38:*.mp3=01;39:*.ogg=01;39:*.MP3=01;39:*.Mp3=01;39"
#    LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
    export LS_COLORS
    export LS_OPTIONS="--color=auto"
    export PROMPT_COMMAND=;
#-----Xilinx Path and Variable ----#
    alias xilinx14="source /opt/Xilinx/14.7/ISE_DS/settings64.sh"
    export XILINXD_LICENSE_FILE=2100@10.114.1.45
#------modeltech simulator path-------#
    export PATH="$PATH:/opt/modeltech/linux_x86_64:/opt/modeltech/bin"
    export MGLS_LICENSE_FILE=1717@10.114.1.43
    #export MGLS_LICENSE_FILE=1717@10.114.1.43:1717@10.114.1.44:1717@10.114.1.45:1717@10.32.33.51
#---------------Setting Bluespec environment variables------------------------
    export BLUESPECDIR="/opt/Bluespec-2014.05.C/lib/"
    export PATH="${PATH}:${BLUESPECDIR}/bin/"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${BLUESPECDIR}/Bluesim"
############################# Environment Variables ##########################
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib:/usr/lib64:/lib"
    export LM_LICENSE_FILE=1752@10.16.60.28:27003@10.112.10.17:1717@10.114.1.44:1717@10.114.1.45:1717@10.32.33.51:27000@10.114.1.43:27000@10.114.1.44:27000@10.114.1.45:5280@10.114.1.46:5280@10.114.1.47:5280@10.114.1.48:$LM_LICENSE_FILE
#    export LM_LICENSE_FILE=2100@10.114.1.44:27003@10.112.14.24:1717@10.114.1.43:1717@10.114.1.44:1717@10.114.1.45:1717@10.32.33.51:27000@10.114.1.43:27000@10.114.1.44:27000@10.114.1.45:5280@10.114.1.46:5280@10.114.1.47:5280@10.114.1.48:$LM_LICENSE_FILE
#---------To change gcc-Verison----#
    export PATH="/home/sanjayk/.bin:$PATH"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/MATLAB/R2012a/bin/glnxa64"
    export PATH="$PATH:~/Dropbox/Service/"
    export PATH="/usr/local/bin/blast:$PATH"
#--------------------------Dell Cluster - PBS Script path--------------------
    export PATH="$PATH:/opt/pbs/default/bin"
#-------------SGI Altix-PBS Script Path--------------------------------------
    export PATH="$PATH:/opt/pbs/bin"
    alias ls="ls $LS_OPTIONS"
    alias open="nautilus"
    alias drfs='dropbox filestatus'
    alias flux='redshift -l 77.57:13.01 -t 5700:3600 -g 0.8 -m randr -v'
    alias ps="ps -aux"
# ----Fedora Systems ------#
    alias ys="dnf search"
    alias yi="echo $PASS | sudo -S dnf -y install"
    alias yr="echo $PASS | sudo -S dnf -y remove"
    alias yu="echo $PASS | sudo -S dnf -y update"
#------Ubuntu Systems -----#
    alias as="apt-cache search"
    alias ai="echo $PASS | sudo -S apt-get -y install"
    alias ar="echo $PASS | sudo -S apt-get -y remove"
    alias au="echo $PASS | sudo -S apt-get -y update"
#----Python Pip Install ----#
    alias pip2s="echo $PASS | sudo -S pip2.7 --proxy='http://sercsanjayk:fireisout5477@proxy.iisc.ernet.in:3128' search $@"
    alias pip2i="echo $PASS | sudo -S pip2.7 --proxy='http://sercsanjayk:fireisout5477@proxy.iisc.ernet.in:3128' install $@"
    alias d0="du -h --max-depth=0"
    alias d1="du -h --max-depth=1"
    alias d2="du -h --max-depth=2"
    alias l1="ls -alh --group-directories-first --sort=extension"
    alias matlab="/opt/MATLAB/R2012a/bin/matlab -c /opt/MATLAB/R2012a/lic_standalone.dat"
    alias wakeUpNewMail="wol 4c:72:b9:4e:ca:75"
    alias wakeUpAnduin="wol 00:22:4d:ab:1e:07"
    alias start="screen -dmS sanjayk ~/Dropbox/Service/startup.sh"
    alias startH="/home/sanjayk/Dropbox/Service/start.sh"
fi
#-------To increase history size------------#
export HISTSIZE=10000
export HISTCONTROL=erasedups
shopt -s histappend
export TERM=xterm-color
export GREP_OPTIONS="--color=auto" 
export GREP_COLOR="1;32"
unset GREP_OPTIONS
unset GREP_COLOR
alias 777="echo $PASS | sudo -S chmod -R 777 $@"
alias 755="echo $PASS | sudo -S chmod -R 755 $@"
alias ks="echo $PASS | sudo -S kill -9 $@"
alias sgrep="find . | grep -i $@"
alias c="clear"
alias vi="vim"
alias cim="vim"
alias bim="vim"
alias l="ls -lA"
alias ssh="ssh -X"
alias ll="ls -alhSv"
alias lsr="ls -lSv"
alias md="mkdir"
alias rd="rmdir"
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias v="vim ~/.ssh/known_hosts"
alias fd="find . -name"
alias net='lsof -P -i -n | cut -f 1 -d " " |uniq'
alias gx='google-chrome --proxy-server="http://proxy.iisc.ernet.in:3128" --new-window www.gmail.com'
#---------to connect to cluster of iisc-------
alias dell="ssh secsjkr@10.16.28.52"
alias tesla="ssh secsjkr@10.16.28.49"
alias altrix="ssh secsjkr@10.16.28.20"
alias macsara="ssh sanjayk@10.112.10.25"
alias sara="ssh sanjayk@192.168.10.15"
alias anduin="ssh sanjayk@10.112.10.27"
alias nimrodel="ssh sanjayk@192.168.10.14"
alias ds="ssh accelrys@10.112.10.27"
alias dbio="ssh dpal@10.16.60.20"
alias rivendell="ssh sanjayk@10.112.10.23"
alias comet="ssh sanjayk@10.112.10.18"
alias cad="ssh root@cadl.iisc.ernet.in"
alias pico="ssh sanjayk@10.112.10.16"
alias long="ssh sanjayk@10.112.10.17"
alias py3i="echo $PASS | sudo -S python3 setup.py install"
alias pyi="echo $PASS | sudo -S python setup.py install"
alias wa="~/Dropbox/Git/wallpaper.sh"
#------------------------------------------------------------------------------
alias HEX="ruby -e 'printf(\"0x%X\n\", ARGV[0])'"
alias DEC="ruby -e 'printf(\"%d\n\", ARGV[0])'"
alias BIN="ruby -e 'printf(\"%bb\n\", ARGV[0])'"
alias WORD="ruby -e 'printf(\"0x%04X\n\", ARGV[0])'"
#------------------- Security-----------------//
alias rm="rm -i"
alias rmf="rm -irf"
alias grep="/usr/bin/grep $GREP_OPTIONS"
alias cp="cp -i"
alias mv="mv -i"
alias ln="ln -i"
ccat(){
   	pygmentize -f terminal -g $@
}
function myart(){
	cd ~/Dropbox/Personal/MyArticle
}
function bio(){
    cd /media/Data/FinalCode
}
function ytplay(){ 
    mplayer <(youtube-dl -o - "$1")
}
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}
#----------------------Environment Variables------------------------------//
#export HTTP_PROXY="http://proxy.iisc.ernet.in:3128"
#export HTTPS_PROXY="https://proxy.iisc.ernet.in:3128"
#export FTP_PROXY="ftp://proxy.iisc.ernet.in:3128"
#export RSYNC_PROXY="http://sercsanjay:fireisout5477@proxy.iisc.ernet.in:3128"
