#!/bin/bash
#rm -r /home/prashant/myramfs/
# 6m17.670s/6m54.444s with out rmfs
#real	3m25.775s with ramfs
#user	0m42.112s
#sys	0m16.128s

# Test cases - 1. Mongorestore on disk -> 6m 30s
#2.mongorestore on ramfs  -> 3m 25s
#3. rails thing fetch task on disk -> 7.8s
#4. rails thing fetch taks on disk using unix socket  -> 7.8s
#5. rails thing fetch task on ramfs
#6. rails thing fetch task on ramfs using unix socket
#7. Try on machine 16gb+ rams and 8gb+ ramfs folder. Swap space and dump present on disk are 2 bottlenecks.


#sudo mount -t tmpfs -o size=1000m tmpfs /home/prashant/myramfs/

cp ~/Downloads/mongodb-linux-x86_64-enterprise-ubuntu1604-3.2.10.tgz ~/myramfs

#pushd `dirname $0`
cd ~/myramfs
pwd
tar -xzvf mongodb-linux-x86_64-enterprise-ubuntu1604-3.2.10.tgz

rm *.tgz

cd mongo*
pwd
sleep 1
mkdir -p data
mkdir -p conf
#touch conf/mongodb.conf

echo 'fork = true
dbpath = /home/prashant/myramfs/mongodb-linux-x86_64-enterprise-ubuntu1604-3.2.10/data
logpath = /home/prashant/myramfs/mongodb-linux-x86_64-enterprise-ubuntu1604-3.2.10/mongodb.log
logappend = true
journal = true
' > conf/mongodb.conf


bin/mongod -f conf/mongodb.conf
bin/mongorestore ~/mongo-dump/

#popd
