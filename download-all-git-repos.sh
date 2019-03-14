#!/bin/bash
# Author: https://gist.github.com/erdincay
# Link:   https://gist.github.com/erdincay/4f1d2e092c50e78ae1ffa39d13fa404e
if [ -z "$1" ]; then
    echo "waiting for the following arguments: username + max-page-number"
    exit 1
else
    name=$1
fi

if [ -z "$2" ]; then 
    max=2
else
    max=$2
fi

cntx="users"
page=1

echo $name
echo $max
echo $cntx
echo $page

until (( $page -lt $max ))
do 
    curl "https://api.github.com/$cntx/$name/repos?page=$page&per_page=100" | grep -e 'git_url*' | cut -d \" -f 4 | xargs -L1 git clone
    $page=$page+1
done

exit 0

