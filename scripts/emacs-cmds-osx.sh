#!/bin/bash
# -*- coding: utf-8 -*-
#
# Functions for emacs servers: start, stop, and list under running.

# Copyright (c) 2014-2017, Zuogong YUE
# Author: Zuogong YUE
#         https://github.com/oracleyue
# Licensed under the GNU General Public License
#
# Last modified on 03 Sep 2017



# =======================================================
# Function: list/start/stop emacs severs
# =======================================================

function es() {
    tmpfile="$HOME/.tmp.stdout"
    if [[ $(uname) == "Linux" ]]; then
        EMACS="/usr/bin/emacs"
    else
        EMACS="/usr/local/bin/emacs"
    fi

    if [[ $# -eq 0 ]] || [[ "$1" == "list" ]]; then
        ps aux | grep -i 'emacs.* --bg-daemon' | grep -v 'grep' \
            | awk '{print $2 "\t" $9 "\tEmacs " $12}' > $tmpfile
        while read line; do
            echo "$line" | sed 's/\0123,4\012//'
        done < $tmpfile
        rm -f $tmpfile

    elif [[ "$1" == "stop" ]]; then
        if [[ -z $2 ]]; then
	        kill -9 $(ps aux | grep -i 'emacs.* --bg-daemon' \
                          | grep -v 'grep' | awk '{print $2}')
        else
            case $2 in
                m)
                    kill $(ps aux | grep -i 'emacs.* --bg-daemon' \
                               | grep "main" | grep -v 'grep' | awk '{print $2}')
                    ;;
                c)
                    kill $(ps aux | grep -i 'emacs.* --bg-daemon' \
                               | grep "coding" | grep -v 'grep' | awk '{print $2}')
                    ;;
                *)
                    kill $(ps aux | grep -i 'emacs.* --bg-daemon' \
                               | grep "$2" | grep -v 'grep' | awk '{print $2}')
                    ;;
            esac
        fi

    elif [[ "$1" == "start" ]]; then
        if [[ -z $2 ]]; then
            $EMACS --daemon=main
            $EMACS --daemon=coding
        else
            case $2 in
                m)
                    $EMACS --daemon=main
                    ;;
                c)
                    $EMACS --daemon=coding
                    ;;
                n)
                    $EMACS --daemon
                    ;;
                *)
                    $EMACS --daemon="$2"
                    ;;
            esac
        fi
    else
        echo 'usage: 0, 1 or 2 arguments'
        echo '  - 0: list running servers;'
        echo '  - 1: choose among "list, start, stop"; "start" use "main" as server name;'
        echo '  - 2: only for "es start SERVER_NAME" as you specified.'
    fi
}



# =======================================================
# Function: emacs client (main & coding)
# =======================================================

# emacsclient: main
function em() {
    if [[ $(uname) == "Linux" ]]; then
        EMACSCLIENT="/usr/bin/emacsclient"
    else
        EMACSCLIENT="/usr/local/bin/emacsclient"
    fi

    if [[ $# -eq 0 ]]; then
        $EMACSCLIENT -nc --socket-name=main
    elif [[ -n $1 ]]; then
        $EMACSCLIENT -nc --socket-name=main $1
    else
        echo 'usage: 0 or 1 argument'
        echo '  - 0: connet "emacsclient -nc" to "main" server;'
        echo '  - 1: run emacsclient to open FILES you specified.'
    fi
}

# emacsclient: coding
function ec() {
    if [[ $(uname) == "Linux" ]]; then
        EMACSCLIENT="/usr/bin/emacsclient"
    else
        EMACSCLIENT="/usr/local/bin/emacsclient"
    fi

    if [[ $# -eq 0 ]]; then
        $EMACSCLIENT -nc --socket-name=coding
    elif [[ -n $1 ]]; then
        $EMACSCLIENT -nc --socket-name=coding $1
    else
        echo 'usage: 0 or 1 argument'
        echo '  - 0: connet "emacsclient -nc" to "coding" server;'
        echo '  - 1: run emacsclient to open FILES you specified.'
    fi
}

# emacsclient: ac-mode
function eca() {
    if [[ $(uname) == "Linux" ]]; then
        EMACSCLIENT="/usr/bin/emacsclient"
    else
        EMACSCLIENT="/usr/local/bin/emacsclient"
    fi

    if [[ $# -eq 0 ]]; then
        $EMACSCLIENT -nc --socket-name=ac-mode
    elif [[ -n $1 ]]; then
        $EMACSCLIENT -nc --socket-name=ac-mode $1
    else
        echo 'usage: 0 or 1 argument'
        echo '  - 0: connet "emacsclient -nc" to "ac-mode" server;'
        echo '  - 1: run emacsclient to open FILES you specified.'
    fi
}
