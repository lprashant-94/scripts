#!/bin/bash


db_set() {
    echo "$1,$2" >> ~/database
}

db_get() {
    grep "^$1," ~/database | sed -e "s/^$1,//" | tail -n 1
}


_db_suggest() {
    local cur 
    local stringreply
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}

    if (($COMP_CWORD == 1 ))
    then
        stringreply=$(cat /home/prashant/database | sed -e "s/,.*//" | grep "$cur" | tr '\n' ' ' )
        COMPREPLY=($stringreply)
    else
        return 0
    fi
}


function countdown(){
    date1=$((`date +%s` + $1)); 
    while [ "$date1" -ge `date +%s` ]; do 
        echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
        sleep 0.1
    done
}
function stopwatch(){
    date1=`date +%s`; 
    while true; do 
        echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
        sleep 0.1
    done
}


alias urldecode='python -c "import sys, urllib as ul; \
        print ul.unquote_plus(sys.argv[1])"'

 alias urlencode='python -c "import sys, urllib as ul; \
         print ul.quote_plus(sys.argv[1])"'

 alias beutify_json='python -mjson.tool'

complete -F _db_suggest db_get 

function datonis_sign_in(){
    echo "$1,$2"
    curl -X POST -H 'Content-Type:application/json' -d "{\"email\":\"$1\",\"password\":\"$2\"}" 'https://api.datonis.io/api_sign_in' 
}


alias ks=ls
alias sl=ls
alias s=ls
alias LS=ls

function epoch_con(){
    date -d "@$1"
}

