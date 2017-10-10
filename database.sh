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


complete -F _db_suggest db_get 
