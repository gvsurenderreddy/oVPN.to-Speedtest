# oVPN.to Speedtest Script
**light-weight, automatable & cross-plattform shell script, to easily check current network quality of oVPN.to servers**

```
Syntax:
oVPN.to-Speedtest SERVERNAME [SERVERNAME] [...] [SERVERNAME]
oVPN.to-Speedtest [OPTION]

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
```

## Features
* generate server list from config-file archive
* download latest config files from oVPN.to control panel (via official API and personal access key) 
* cross-plattform: tested on Mac OS X, Linux, OpenWRT, Synology Diskstation, etc.
* no dependencies


## Usage examples 
Manually check the network speed of some oVPN.to servers, before (re-)connecting your VPN connection (from home or on the road). To easily identify the servers that provide the connection speed you need/want. (e.g. before downloading ISOs or 100 GB porn site-rips, ...)

```
root@x:~/oVPN.to-Speedtest# ./oVPN.to-Speedtest -3
                      __         ____                ____          __
 ___ _  _____  ___   / /____    / __/__  ___ ___ ___/ / /____ ___ / /_
/ _ \ |/ / _ \/ _ \_/ __/ _ \  _\ \/ _ \/ -_) -_) _  / __/ -_|_-</ __/
\___/___/ .__/_//_(_)__/\___/ /___/ .__/\__/\__/\_,_/\__/\__/___/\__/
       /_/                       /_/

Testing current network quality of: HU1.ovpn.to UK1.ovpn.to FR2.ovpn.to

Metered download speed for HU1.ovpn.to: 20323 Kb/s (19.84 Mb/s).
Metered download speed for UK1.ovpn.to: 39367 Kb/s (38.44 Mb/s).
Metered download speed for FR2.ovpn.to: 47624 Kb/s (46.50 Mb/s).
root@x:~/oVPN.to-Speedtest#
```

####  
**Or easily check the speed  any oVPN.to server, from an any device that runs Bash (VPS, router, load balancer, ...)
for whatever useful reason (monitoring, load balance, disguising, analyzing, ...)**
```
root@x:~/oVPN.to-Speedtest# ./oVPN.to-Speedtest --all
                      __         ____                ____          __
 ___ _  _____  ___   / /____    / __/__  ___ ___ ___/ / /____ ___ / /_
/ _ \ |/ / _ \/ _ \_/ __/ _ \  _\ \/ _ \/ -_) -_) _  / __/ -_|_-</ __/
\___/___/ .__/_//_(_)__/\___/ /___/ .__/\__/\__/\_,_/\__/\__/___/\__/
       /_/                       /_/

Metered download speed for BG1.ovpn.to: 27109 Kb/s (26.47 Mb/s).
Metered download speed for CH4.ovpn.to: 1917 Kb/s (1.87 Mb/s).
Metered download speed for CH5.ovpn.to: 1746 Kb/s (1.70 Mb/s).
Metered download speed for CH6.ovpn.to: 17638 Kb/s (17.22 Mb/s).
Metered download speed for CH7.ovpn.to: 14434 Kb/s (14.09 Mb/s).
Metered download speed for CH8.ovpn.to: 14432 Kb/s (14.09 Mb/s).
<... snipped ...>
Metered download speed for RO3.ovpn.to: 55018 Kb/s (53.72 Mb/s).
Metered download speed for RO4.ovpn.to: 46600 Kb/s (45.50 Mb/s).
Metered download speed for UA1.ovpn.to: 33305 Kb/s (32.52 Mb/s).
Metered download speed for UK1.ovpn.to: 41142 Kb/s (40.17 Mb/s).
Metered download speed for US1.ovpn.to: 32664 Kb/s (31.89 Mb/s).
root@x:~/oVPN.to-Speedtest#
```

### Misc
<pre>
 Status: private beta
 Version: 0.37
 Goal: build a tool(set) for usage in (my) OpenWRT routers, that improves BW-management, LB- & QoS-decisions, based on  
 current real-world data (all available VPNs servers and realistically throughput)
 Roadmap: wat!?
</pre>