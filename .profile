# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

########################################################################
### DEFAULT 
########################################################################

# if running bash
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#    fi
#fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

########################################################################
### HISTORY 
########################################################################

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=1000000                   # big big history
export HISTFILESIZE=1000000               # big big history

# Save and reload the history after each command finishes
alias saveh="history -a; history -c; history -r "

########################################################################
### PROMPT 
########################################################################

function precmd()
{
	RET=$?
	[ "$RET" != "0" ] && echo "$RET|"
}

PS1_FULL='\[\033[00;91m\]$(precmd)${debian_chroot:+($debian_chroot)}\[\033[00;96m\]\w\$ \[\033[00m\]'
PS1_SHORT='${debian_chroot:+($debian_chroot)}\[\033[00;96m\]\W\$ \[\033[00m\]'
PS1=$PS1_FULL

########################################################################
### NAVIGATION 
########################################################################

bind '"\C-P": history-search-backward'
bind '"\C-N": history-search-forward'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

########################################################################
### ALIAS 
########################################################################

alias java8='export PATH=/var/workdir/sdk/build-tools/25.0.2/:/usr/lib/jvm/java-8-openjdk-amd64/bin/:$PATH'
alias ..='cd ..'
alias ...='cd ../..'
alias rights='sudo chmod -R a+rw . && sudo find . -type d -exec chmod a+x {} \;'
alias ps1_full='PS1="$PS1_FULL"'
alias ps1_short='PS1="$PS1_SHORT"'
alias lock='gnome-screensaver-command -l'
alias br='git branch -vva'
alias robot='robot -b debug.txt --loglevel TRACE'

########################################################################
### EXPORT 
########################################################################

export LS_COLORS="rs=0:di=95:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=04;95:ow=01;95:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"


