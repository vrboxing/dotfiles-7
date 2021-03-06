# The system of OS X use .profile to configure its console. However, .bashrc in
# Mac OS X will also be used by emacs for its term, xterm, etc.

# set for gnupg for vim
GPG_TTY=`tty`
export GPG_TTY

# add PATH
export PATH=/home/zyue/bin:$PATH

# environment variables
export EDITOR=vim
# export EA_EDITOR='emacsclient --socket-name=any -nc'   # Emacs-Anywhere
export GTAGSLABEL=pygments      # "gtags" in GNU global
export GTAGSLIBPATH=$HOME/.gtags/   # "gtags" create tags for system libs

# aliases
alias ls='ls --color=auto'
alias ll='ls -Alh --color=auto'
alias la='ls -a --color=auto'
alias view='vim -R'
alias svim='sudo -E vim'    # allow sudo vim to use local .vimrc
#alias svim='sudo vim -u ~/.vimrc'
alias enw='emacs -nw'
source $HOME/bin/emacs-cmds-linux.sh
alias rm='rm -i' # use =trash= more to delete files
alias mv='mv -i'
alias cp='cp -r -i'
alias du='du -h -d 1'
alias df='df -h'
#alias rsync='rsync -aP'
#alias rsync='rsync -rlptD -P --exclude=.DS_Store'
alias zip='zip -r'
alias tar='COPYFILE_DISABLE=1 tar'
#alias grep='grep -Hn -i --colour=always'
alias grep='grep -i'
#alias ack='ack -Hn --no-group --no-color'
alias ack='ack -Hni'
alias open='mimeopen'  # from pkg "perl-file-mimeinfo"
alias wine='env LC_CTYPE=en_US.UTF-8 wine'
alias winecfg='env LC_CTYPE=en_US.UTF-8 winecfg'

# use FASD
eval "$(fasd --init auto)"
# a: any; s: show/search/select; d: directory; f: file
# sd: interactive directory selection; sf: interactive file selection
# z: quick cd; zz: cd with interactive selection

# use FZF
# <CTRL+T> list files/folders in current directory
# <Ctrl+R> search history of shell commands
# <Esc+C>  fuzzy change directory
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# aliases for convenience
alias matlab-tty='matlab -nosplash -nodesktop'
alias blog="cd $BLOGPATH; hexo list post"
alias youtube-dl-best="youtube-dl -f 'best[ext=mp4]' --playlist-items"
alias youtube-dl-best720="youtube-dl -f 'best[ext=mp4][height>=480]' --playlist-items"
alias youtube-dl-best480="youtube-dl -f 'best[ext=mp4][height<=480]' --playlist-items"
alias youtube-dl-video480audioM4a="youtube-dl -f 'bestvideo[ext=mp4][height<=480]+bestaudio[ext=m4a]' --playlist-items"
alias youtube-dl-audio="youtube-dl -f 'bestaudio[ext=m4a]'"
alias youtube-trim-suffix='prename "s/-[A-z0-9-]*.mp4/.mp4/"'
alias wget-childsites='wget -r -np -R "index.html*"'

# colorize the bash
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# export PS1='\[\033[0;32m\]\u@\h\[\033[00m\]:\[\033[0;34m\]\w\[\033[00m\]\$ '
# Source: https://bbs.archlinux.org/viewtopic.php?pid=1068202#p1068202
PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]$(hostname)'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"

# using /less/ to colorize man page
export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')
    # Enable /less/ code syntax coloring
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
