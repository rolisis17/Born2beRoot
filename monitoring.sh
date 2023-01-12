#!/bin/sh
# Archtecture /and/ Kernel Version
arc=$(uname -a)
# Physical Processors
PCore=$(cat /proc/cpuinfo | grep 'cpu cores' | uniq | awk '{print $4}')
# Virtual Processors
VCore=$(cat /proc/cpuinfo | grep 'siblings' | uniq | awk '{print $3}')
# Available RAM
# NOT! AvailRAM=$(cat /proc/meminfo | grep 'MemAvailable:' | awk '{print $2}')
# Avail and Used RAM in %
PorcentRam=$(free | grep 'Mem' | awk '{print "Avail: "$4"/"$2"  "$3/($2/100)"%"}')
# Available Disk Space
AvalROMusage=$(df --block-size=MB --total | grep 'total' | awk '{print $4"/"$2,"\t" $5}')
# Last Reboot
# NOP! LastReboot=$(last reboot | grep 'still running' | awk '{print $5, $6, $7, $8}')
LastReboot=$(last -n 2 reboot | awk '{if (on < $8){On = $6" "$7" "$8}; if ($10+$10 > 0){Off = $6" "$7" "$10};} END {print Off" / "On}')
# CPU % USAGE
# NOP! (ps aux | grep -v 'CPU' | awk '{t += $3}{if ($3) {print "\t"$3/16"%\t",$11};} END {print "\t"t/16"%\t total"}')
CPU=$(top -bn1 | grep '%Cpu' | awk '{print $2+$4+$6+$10+$12+$14+$16"%"}')
# NOP! TurnOff=$(last -n 2 reboot | grep -v 'wtmp' | grep -v 'running' | awk '{print $10}')
Reboot=$(last -n 2 reboot | awk '{if (On < $8){On = $6" "$7" "$8}; if ($10+$10 > 0){Off = $6" "$7" "$10};} END {print "Off: "Off" / On: "On}')
# LVM Group Active or Not
LVMG=$(lsblk | grep 'lvm' | wc -l | awk '{t = $1}; {if (t > 0){print "Active"} else {print "Not Active"};}')
# TCP Connections Active
TCP=$(ss | grep 'tcp' | wc -l)
# Users Active
Log=$(users | wc -w)
# Machine IP
Ip=$(hostname -I)
# Machine Mac Address
Mac=$(ip link show | grep 'ether' | awk '{print $2}')
# Command SUDO used
Sud=$(journalctl | grep sudo | grep COMMAND | wc -l)

wall	"$arc

	#CPU Cores: $PCore
	#CPU Threads: $VCore
	#RAM: $PorcentRam - used
	#Free Space: $AvalROMusage - used
	#CPU Utilization: $CPU
	#Last Reboot: $Reboot
	#LVM Group: $LVMG
	#TCP Connection(s): $TCP Active
	#User(s) Logged: $Log
	#IP(s): $Ip
	#Mac Address: $Mac
	#CMD Sudo used: $Sud times"

