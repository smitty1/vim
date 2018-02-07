#Apply color to man pages.
#From https://wiki.archlinux.org/index.php/Man_Page#Colored_man_pages
man() {
        env \
                LESS_TERMCAP_mb=$(printf "\e[1;31m") \
                LESS_TERMCAP_md=$(printf "\e[1;31m") \
                LESS_TERMCAP_me=$(printf "\e[0m") \
                LESS_TERMCAP_se=$(printf "\e[0m") \
                LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
                LESS_TERMCAP_ue=$(printf "\e[0m") \
                        man "$@"
}

# cd and ls in one
# From https://wiki.archlinux.org/index.php/Bash
cl() {
    if [[ -d "$1" ]]; then
        cd "$1"
        ls -lAhF --color=auto
    else
        echo "bash: cl: '$1': Directory not found"
    fi
}

     
# Simple note taker 
# From https://wiki.archlinux.org/index.php/Bash
note () {
    # if file doesn't exist, create it
    if [[ ! -f /home/jim/.notes ]]; then
        touch /home/jim/.notes
    fi

    if [[ $# -eq 0 ]]; then
        # no arguments, print file
        cat /home/jim/.notes
    elif [[ "$1" == "-c" ]]; then
        # clear file
        echo "" > /home/jim/.notes
    else
        # add all arguments to file
        echo "$@" >> /home/jim/.notes
    fi
}



#Simple task utility
#Inspired by #Simple note taker 
# From https://wiki.archlinux.org/index.php/Bash

todo() {
    if [[ ! -f /home/jim/.todo ]]; then
        touch /home/jim/.todo
    fi

    if [[ $# -eq 0 ]]; then
        cat /home/jim/.todo
    elif [[ "$1" == "-l" ]]; then
        cat -n /home/jim/.todo
    elif [[ "$1" == "-c" ]]; then
        echo "" > /home/jim/.todo
    elif [[ "$1" == "-r" ]]; then
        cat -n /home/jim/.todo
        echo -ne "----------------------------\nType a number to remove: "
        read NUMBER
        sed -ie ${NUMBER}d /home/jim/.todo
    else
        echo "$@" >> /home/jim/.todo
    fi
}


 ###### apt-history function ###################
function apt-history(){
      case "$1" in
        install)
              cat /var/log/dpkg.log | grep 'install '
              ;;
        upgrade|remove)
              cat /var//log/dpkg.log | grep $1
              ;;
        rollback)
              cat /var/log/dpkg.log | grep upgrade | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


#Use one command to make a directory  and change into it.
mkdircd(){ mkdir "$1" && cd "$1" ; }


genpasswd() { 
    strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 14 | tr -d '\n'; echo
}

pins() {
	if [[ -f /etc/apt/preferences.d/apt-listbugs ]]; then
		cat /etc/apt/preferences.d/apt-listbugs
	else
		echo "No packages are pinned."
	fi
}

du() {
	if [ -f ~/.bash_functions ]; then
		terminator -e 'sh -c "sudo apt update && sudo apt dist-upgrade; exec bash"'
	else
		echo "shit"
       fi
}


