if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
HOST=`uname`
if [ "${HOST}" == "Darwin" ]; then
    randlst=`ls /opt/local/share/cowsay/cows | unsort -r | head -1`
    /opt/local/bin/fortune | /opt/local/bin/cowsay -n -f $randlst
else 
    OS=`lsb_release -a | grep "Distributor ID:" | cut -d ":" -f 2 | tr -d '[[:space:]]'`
    if [[ $OS == "Fedora" ]]; then
	screenfetch
	randlst=`ls /usr/share/cowsay/ | sort -R | head -1`
	/usr/bin/fortune | /usr/bin/cowsay -n -f $randlst
    elif [[ $OS == "LinuxMint" ]];then
	/usr/bin/archey
	randlst=`ls /usr/share/cowsay/cows/ | sort -R | head -1`
	/usr/bin/fortune | /usr/bin/cowsay -n -f $randlst
    fi
fi

##
# Your previous /Users/sanjayk/.bash_profile file was backed up as /Users/sanjayk/.bash_profile.macports-saved_2016-08-22_at_11:36:37
##

# MacPorts Installer addition on 2016-08-22_at_11:36:37: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

