#!/bin/bash


cp serverlist.txt serverlist.txt2

for i in $(awk '{print $2}' serverlist.txt); do
    content="$(curl --max-time 4 --connect-timeout 4 -s "$i")"
   
 

if [[  -z $content ]]; then
  echo "$i is down, removing from current server list."
 sed -n '/'$i'/!p' serverlist.txt2 > temp && mv temp serverlist.txt2

 
 fi

done
echo Writing new server list ...
mv serverlist.txt2 serverlist.txt


   
