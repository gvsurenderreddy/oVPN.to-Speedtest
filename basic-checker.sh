#!/bin/bash

TMP_PATH=/tmp/speedcheck
TEST_TIME=10
### set your ovpn.to proxy credentials here (see: https://vcp.ovpn.to/?site=oprx)
source settings.conf
# Mac only
export PATH="/usr/local/opt/Coreutils/libexec/gnubin:$PATH"


rm -rf $TMP_PATH && mkdir $TMP_PATH

links=("http://cachefly.cachefly.net/100mb.test"
"http://proof.ovh.ca/files/100Mio.dat"
"http://speedtest.atlanta.linode.com/100MB-atlanta.bin"
"http://speedtest.dallas.linode.com/100MB-dallas.bin"
"http://793343545.r.cdn77.net/design/swf/testfile100.bin"
"http://speedtest.sea01.softlayer.com/downloads/test100.zip"
"http://speedtest.sjc01.softlayer.com/downloads/test100.zip"
"http://speedtest.wdc01.softlayer.com/downloads/test100.zip"
"http://mirror.us.leaseweb.net/speedtest/100mb.bin"
"http://proof.ovh.net/files/100Mio.dat"
"http://speedtest.london.linode.com/100MB-london.bin"
"http://mirror.nl.leaseweb.net/speedtest/100mb.bin"
"http://mirror.i3d.net/100mb.bin"
"http://hetzner.de/100MB.iso"
"http://lg.as47692.net/tools/100MB.test"
"http://www.seflow.it/infrastruttura/100MB.test")

echo "Testing current network quality of $1.ovpn.to!"
cd $TMP_PATH
for link in ${links[*]}
do
    timeout $TEST_TIME curl -s --proxy socks5://$PROXYUSER:$PROXYPASS@$2:1080 -O $link &
    done
    
    wait
    
    total_bytes=$(du -c $TMP_PATH | grep total | cut -f -1)
    
    # Cleaning up test downloads
    rm -rf $TMP_PATH
  
   speed=$(expr $total_bytes / $TEST_TIME)


    speed2=`(echo "scale=2;$speed/1024" | bc)`

    
    echo "Metered download speed for $1.ovpn.to: $speed Kb/s ($speed2 Mb/s)".
   
    
    exit 0
