#!/bin/bash
set -e

PROGNAME=$(basename $0)
scriptdir=$(readlink -f $(dirname "$0"))

clear




update() {

PORT="443"; DOMAIN="vcp.ovpn.to"; API="xxxapi.php"; URL="https://${DOMAIN}:${PORT}/$API";
SSL="CE:4F:88:43:F8:6B:B6:60:C6:02:C7:AB:9C:A9:2F:15:3A:9F:F4:65:A3:20:D0:11:A1:27:74:B4:07:B9:54:6A";
    
APICONFIGFILE="settings.conf";
ASTUPDATEFILE="lastovpntoupdate.txt";
OCFGTYPE="lin";
CVERSION="22x"


	if test -e ${APICONFIGFILE}; then 
		source ${APICONFIGFILE};
	else
		echo  -e "No config file found. Creating new one.\nPlease edit: `pwd`/${APICONFIGFILE}\n";
		
		echo -e "USERID=\"00000\";\nAPIKEY=\"0x123abc\";\nPROXYUSER=\"oVPN12345\";\nPROXYPASS=\"0ade904361f156c739e1\";\n" > ${APICONFIGFILE}
	#	cat ${APICONFIGFILE};
		exit 1;
	fi;
	if ! test ${USERID} -gt 0; then echo "Invalid USERID in ${APICONFIGFILE}"; exit 1; fi
	if ! test `echo -n "${APIKEY}"|wc -c` -eq "128"; then echo "Invalid APIKEY in ${APICONFIGFILE}"; exit 1; fi
	
	DATA="uid=${USERID}&apikey=${APIKEY}&action=getconfigs&version=${CVERSION}&type=${OCFGTYPE}";
	
	echo Download Configs 
	curl --request POST $URL --data $DATA -o configs.zip

echo Extract new configs
if [ -d configs ]; then
  mv configs configs.old
fi


mkdir configs
unzip configs.zip -d configs
rm configs.zip

}
checker() {
   
TMP_PATH=/tmp/speedcheck
TEST_TIME=10
### set your ovpn.to proxy credentials here (see: https://vcp.ovpn.to/?site=oprx)
#source /tmp/settings.conf
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

    
    echo "Metered download speed for $1: $speed Kb/s ($speed2 Mb/s)".
   
    
   # exit 0
   # exit 1
}




die() {
    echo "$PROGNAME: $*" >&2
    exit 1
}

usage() {
  

cat banner.txt

 if [ "$*" != "" ] ; then
        echo -e "\033[31m\nError:\033[0m $*"
        
    fi
echo -e "\nSyntax:"
echo -e "\033[0;33m$PROGNAME SERVERNAME [SERVERNAME] [...] [SERVERNAME]\033[0m" 
echo -e "\033[0;34m$PROGNAME [OPTION]\033[0m"
  
   

echo
echo General options:
echo -h, --help          display this help message
echo -l, --list          list all valid servers
echo -g, --gen           generate server list from config directory
echo -u, --update        update config files
echo -e "\nTarget specification options:"
echo -a, --all           check all servers
echo -5, --rand5         check 5 random servers from list
echo -3, --rand3         check 3 random servers from list

echo -e "\nExample usage:\n\033[0;33m$PROGNAME CH6 MD2 UK1 FR2 BG1 MD1 NL6 US1\033[0m"
echo -e "\033[0;34m$PROGNAME --list\033[0m"
    exit 1
}

foo=""
bar=""
delete=0
output="-"
while [ $# -gt 0 ] ; do
    case "$1" in
    -h|--help)
        usage
        ;;
        
    -a|--all)
        {      
        
         if [ -f settings.conf ]; then
              source settings.conf
         		while read -r line
					do
    					host=$(echo $line|awk '{print $1}')
						ip=$(echo $line|awk '{print $2}')
  				    	checker $host $ip
					done < "serverlist.txt" ;
else echo -e "No config file found. Generate a new one, with option \033[31m--update\033[0m or copy an existing one to: \033[31msettings.conf\033[0m."
fi   
        }
        
        bar="1"
        ;;
        
          -3|--rand3)
        {      
        
         if [ -f settings.conf ]; then
              source settings.conf
              shuf -n 3 serverlist.txt > serverlist3.tmp
              serv=`awk '{print $1}' serverlist3.tmp| tr '\n' ' '`
              echo -e "\nTesting current network quality of: $serv\n"
         		while read -r line
					do
    					host=$(echo $line|awk '{print $1}')
						ip=$(echo $line|awk '{print $2}')
  				    	checker $host $ip
					done < "serverlist3.tmp"
					rm $scriptdir/serverlist3.tmp;
else echo -e "No config file found. Generate a new one, with option \033[31m--update\033[0m or copy an existing one to: \033[31msettings.conf\033[0m."
fi   
        }
        
        bar="1"
        ;;
        
    -l|--list)
        { echo  -e "\033[31mCurrent oVPN.to Server List\033[0m\n";
            if [ -f serverlist.txt ]; then
              cat serverlist.txt;count=`wc -l serverlist.txt | awk '{print $1}'`;echo -e "\n\033[31mTotal: $count active\033[0m"; 
else echo -e "No server list found. Generate a new one, with option \033[31m--gen\033[0m, or copy an existing list to: \033[31mserverlist.txt\033[0m."
fi           }
        bar="1"
        ;;
   -g|--gen)
      {   export CONFIG_PATH=configs
grep "remote " $CONFIG_PATH/*.ovpn|sed -r 's/^.+\///' | sed  's/.ovpn:remote//g'|awk '{print $1 " " $2}' > serverlist.txt
count=`wc -l serverlist.txt|awk '{print $1}'`
echo Insgesamt $count gefunden und in Serverliste geschrieben.
         }
        bar="1"
        ;;
   -u|--update)
        update
        bar="1"
        ;;
    -*)
        usage "Unknown option '$1'"
        ;;
    *)
        if [ -z "$foo" ] ; then
            foo="$1"
        elif [ -z "$bar" ] ; then
            bar="$1"
        else
            usage "Too many arguments"
        fi
        ;;
    esac
    shift
done

if [ -z "$bar" ] ; then
    usage "No input arguments passed. At least supply: one target host (to be tested) or an valid command-line option (to be executed)."
fi

