# oVPN.to Speedtest Script
**light-weight, automated, cross-plattform shell script, to easily check current network quality of oVPN.to servers**

## Usage examples 
Manually check the network speed of some oVPN.to servers, before (re-)connecting your VPN connection (from home or on the road). To easily identify the servers that provide the connection speed you need/want. (e.g. before downloading ISOs or 100 GB porn site-rips, ...)

```
root@dl:~/oVPN.to-Speedtest# ./oVPN.to-Speedtest.sh nl6
[I] oVPN.to-Speedtest.sh: start 15/12/06@22:40:32 with process id 32719 by root@dl:/root/oVPN.to-Speedtest (NOLOG)
oVPN.to Speedtest
Testing current network quality of nl6.ovpn.to!
Metered download speed for nl6.ovpn.to: 46644 Kb/s (45.55 Mb/s).
[I] oVPN.to-Speedtest.sh finished at 22H40 (Time=12s, Error=0, Warning=0, RC=0).
root@dl:~/oVPN.to-Speedtest# ./oVPN.to-Speedtest.sh de3
[I] oVPN.to-Speedtest.sh: start 15/12/06@22:40:49 with process id 369 by root@dl:/root/oVPN.to-Speedtest (NOLOG)
oVPN.to Speedtest
Syntax: oVPN.to-Speedtest.sh <server>
To show all valid servers: oVPN.to-Speedtest.sh --list

Error: Syntax error or invalid server name chosen.
[I] oVPN.to-Speedtest.sh finished at 22H40 (Time=0s, Error=0, Warning=0, RC=0).
root@dl:~/oVPN.to-Speedtest# ./oVPN.to-Speedtest.sh is1
[I] oVPN.to-Speedtest.sh: start 15/12/06@22:41:40 with process id 464 by root@dl:/root/oVPN.to-Speedtest (NOLOG)
oVPN.to Speedtest
Testing current network quality of is1.ovpn.to!
Metered download speed for is1.ovpn.to: 39896 Kb/s (38.96 Mb/s).
[I] oVPN.to-Speedtest.sh finished at 22H41 (Time=12s, Error=0, Warning=0, RC=0).
root@dl:~/oVPN.to-Speedtest#
```

####  
**Or easily check the speed  any oVPN.to server, from an any device that runs Bash (VPS, router, load balancer, ...)
for whatever useful reason (monitoring, load balance, disguising, analyzing, ...)**
```
root@dl:~/oVPN.to-Speedtest# ./testall.sh
Testing current network quality of BG1.ovpn.to.ovpn.to!
Metered download speed for BG1.ovpn.to.ovpn.to: 31025 Kb/s (30.29 Mb/s).
Testing current network quality of CH4.ovpn.to.ovpn.to!
Metered download speed for CH4.ovpn.to.ovpn.to: 1896 Kb/s (1.85 Mb/s).
Testing current network quality of CH5.ovpn.to.ovpn.to!
Metered download speed for CH5.ovpn.to.ovpn.to: 1889 Kb/s (1.84 Mb/s).
Testing current network quality of CH6.ovpn.to.ovpn.to!
Metered download speed for CH6.ovpn.to.ovpn.to: 20335 Kb/s (19.85 Mb/s).
Testing current network quality of CH7.ovpn.to.ovpn.to!
Metered download speed for CH7.ovpn.to.ovpn.to: 16951 Kb/s (16.55 Mb/s).
Testing current network quality of CH8.ovpn.to.ovpn.to!
Metered download speed for CH8.ovpn.to.ovpn.to: 15781 Kb/s (15.41 Mb/s).
Testing current network quality of DE1.ovpn.to.ovpn.to!
Metered download speed for DE1.ovpn.to.ovpn.to: 7270 Kb/s (7.09 Mb/s).
Testing current network quality of DE2.ovpn.to.ovpn.to!
Metered download speed for DE2.ovpn.to.ovpn.to: 8221 Kb/s (8.02 Mb/s).
Testing current network quality of DE3.ovpn.to.ovpn.to!
Metered download speed for DE3.ovpn.to.ovpn.to: 55673 Kb/s (54.36 Mb/s).
Testing current network quality of FR1.ovpn.to.ovpn.to!
Metered download speed for FR1.ovpn.to.ovpn.to: 50359 Kb/s (49.17 Mb/s).
Testing current network quality of FR2.ovpn.to.ovpn.to!
Metered download speed for FR2.ovpn.to.ovpn.to: 46560 Kb/s (45.46 Mb/s).
Testing current network quality of HU1.ovpn.to.ovpn.to!
Metered download speed for HU1.ovpn.to.ovpn.to: 30469 Kb/s (29.75 Mb/s).
Testing current network quality of HU3.ovpn.to.ovpn.to!
Metered download speed for HU3.ovpn.to.ovpn.to: 23631 Kb/s (23.07 Mb/s).
Testing current network quality of IS1.ovpn.to.ovpn.to!
Metered download speed for IS1.ovpn.to.ovpn.to: 15175 Kb/s (14.81 Mb/s).
Testing current network quality of MD1.ovpn.to.ovpn.to!
Metered download speed for MD1.ovpn.to.ovpn.to: 36231 Kb/s (35.38 Mb/s).
Testing current network quality of MD2.ovpn.to.ovpn.to!
Metered download speed for MD2.ovpn.to.ovpn.to: 38355 Kb/s (37.45 Mb/s).
Testing current network quality of NL1.ovpn.to.ovpn.to!
Metered download speed for NL1.ovpn.to.ovpn.to: 48792 Kb/s (47.64 Mb/s).
Testing current network quality of NL2.ovpn.to.ovpn.to!
Metered download speed for NL2.ovpn.to.ovpn.to: 48107 Kb/s (46.97 Mb/s).
Testing current network quality of NL3.ovpn.to.ovpn.to!
Metered download speed for NL3.ovpn.to.ovpn.to: 52068 Kb/s (50.84 Mb/s).
Testing current network quality of NL4.ovpn.to.ovpn.to!
Metered download speed for NL4.ovpn.to.ovpn.to: 51770 Kb/s (50.55 Mb/s).
Testing current network quality of NL5.ovpn.to.ovpn.to!
Metered download speed for NL5.ovpn.to.ovpn.to: 49292 Kb/s (48.13 Mb/s).
Testing current network quality of NL6.ovpn.to.ovpn.to!
Metered download speed for NL6.ovpn.to.ovpn.to: 51752 Kb/s (50.53 Mb/s).
Testing current network quality of NL7.ovpn.to.ovpn.to!
Metered download speed for NL7.ovpn.to.ovpn.to: 48829 Kb/s (47.68 Mb/s).
Testing current network quality of NL8.ovpn.to.ovpn.to!
Metered download speed for NL8.ovpn.to.ovpn.to: 52488 Kb/s (51.25 Mb/s).
Testing current network quality of NL9.ovpn.to.ovpn.to!
Metered download speed for NL9.ovpn.to.ovpn.to: 47006 Kb/s (45.90 Mb/s).
Testing current network quality of RO3.ovpn.to.ovpn.to!
Metered download speed for RO3.ovpn.to.ovpn.to: 41204 Kb/s (40.23 Mb/s).
Testing current network quality of RO4.ovpn.to.ovpn.to!
Metered download speed for RO4.ovpn.to.ovpn.to: 45009 Kb/s (43.95 Mb/s).
Testing current network quality of UA1.ovpn.to.ovpn.to!
Metered download speed for UA1.ovpn.to.ovpn.to: 27914 Kb/s (27.25 Mb/s).
Testing current network quality of UK1.ovpn.to.ovpn.to!
Metered download speed for UK1.ovpn.to.ovpn.to: 0 Kb/s (0 Mb/s).
Testing current network quality of US1.ovpn.to.ovpn.to!
Metered download speed for US1.ovpn.to.ovpn.to: 46851 Kb/s (45.75 Mb/s).
root@dl:~/oVPN.to-Speedtest#
```

```
Syntax:
oVPN.to-Speedtest.sh SERVERNAME [SERVERNAME] [...] [SERVERNAME]
oVPN.to-Speedtest.sh [OPTION]

General options:
-h, --help       display this help message
-l, --list       list all valid servers
-g, --gen        generate server list from config directory
-u, --update     download current configs & generate new server list

Target specification options:
-a, --all        check all servers
-5, --rand5      check 5 random servers from list
-3, --rand3      check 3 random servers from list

Example usage:
oVPN.to-Speedtest.sh CH6 MD2 UK1 FR2 BG1 MD1 NL6 US1
oVPN.to-Speedtest.sh --list
root@dl:~/oVPN.to-Speedtest#
```






## Features
* generate server list from config-file archiv
* cross-plattform: tested on Mac OS X, Linux, OpenWRT, Synology Diskstation, etc.
* no dependencies

### Misc
<pre>
 Status: unfinished, draft 
 Version: 1.2
 Roadmap: i may improve, fix and extend it or never commit one line again
</pre>

                      __         ____                ____          __
 ___ _  _____  ___   / /____    / __/__  ___ ___ ___/ / /____ ___ / /_
/ _ \ |/ / _ \/ _ \_/ __/ _ \  _\ \/ _ \/ -_) -_) _  / __/ -_|_-</ __/
\___/___/ .__/_//_(_)__/\___/ /___/ .__/\__/\__/\_,_/\__/\__/___/\__/
       /_/                       /_/

