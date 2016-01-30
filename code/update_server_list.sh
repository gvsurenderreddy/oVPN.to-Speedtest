#!/bin/bash
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
	
	echo Downloading config files from oVPN.to! 
	curl --silent --request POST $URL --data $DATA -o configs.zip

echo Extract new configs
if [ -d configs ]; then
  mv configs configs.old
fi
if [ -d configs.old ]; then
  rm -rf configs.old
fi


mkdir configs
unzip -q configs.zip -d configs 
rm configs.zip
export CONFIG_PATH=configs
grep "remote " $CONFIG_PATH/*.ovpn|sed -r 's/^.+\///' | sed  's/.ovpn:remote//g'|awk '{print $1 " " $2}' > serverlist.txt
count=`wc -l serverlist.txt|awk '{print $1}'`
echo -e "\nInsgesamt $count Server in Configs-Ordner gefunden und in Serverliste geschrieben."
