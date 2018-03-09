alias clean='sudo apt autoremove && sudo apt autoclean'
alias src='source /home/jim/.bashrc'
#alias inxi='sudo inxi -v 7 -c 10' # Light Background
alias inxi='sudo inxi -v 7 -c 27' #For the medium gray background
alias o='less'
alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'
if test "$is" != "ksh" ; then
    alias -- +='pushd .'
    alias -- -='popd'
fi
alias rd='rmdir'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias blkid='sudo blkid -o list'
alias xxx='lsb_release -a; uname -a; inxi -Fxxxr'
alias free='free -m'

alias grep='grep --colour=auto'
alias ins='sudo apt-get install'

alias ls='ls --color=auto'
alias lst='dpkg -l | grep'
alias out='sudo apt-get purge'
alias pol='apt-cache policy'
alias show='apt show'
alias sym='apt-get purge -s'
alias up='sudo apt update && sudo apt dist-upgrade'
alias ar='sudo apt-get autoremove'

#User based aliases
#make rm mv and cp safer
alias rm='rm -vi'
alias py='python'
alias mv='mv -iv'
alias cp='cp -iv'

#Directories
alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'
alias o='less'


#Terminal Options
alias clr="clear"

#Shutdown and reboot options
#Reboot
alias boot='sudo shutdown -r now'
#Power off the computer.
alias off='sudo shutdown -Ph now'

#Directory Options
alias l='ls --group-directories-first -lhaF'
alias la='ls -a'
alias dir="ls -lahF"
#apt options


alias df='df -h'
alias nt='cat /home/jim/.notes /home/jim/.todo'
alias clnt='echo  > .notes && echo  > .todo'
alias st='date +%R'
alias tclean='sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get clean'
alias path='echo -e ${PATH//:/\\n}'

alias space='free; df -m'
alias ping='ping -c 3 www.google.com'
alias ckpref='cat /etc/apt/preferences.d/apt-listbugs'
alias l.='ls -d .* --color=auto'
alias mkdir='mkdir -pv'
alias diff='colordiff -ys'
alias db='sudo updatedb'
alias upd='sudo apt update'
alias upg='sudo apt upgrade'
alias qup='upd; upg; ar; boot'

#Display the 9 processes using the most memory
alias memuse='sudo ps -eo pid,ppid,cmd,%mem --sort=%mem | head'

alias gs='git status'
