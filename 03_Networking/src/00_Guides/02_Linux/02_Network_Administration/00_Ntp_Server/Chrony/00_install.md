# Installation



### How to configure an NTP client on RHEL 8 / CentOS 8 Linux step by step instructions



Install Chrony NTP package:

```
# dnf install chrony
```

Enable Chrony to start after boot:

```
# systemctl enable chronyd
```

Set Chrony to act as an NTP client

To turn Chrony into the NTP cleint add the following line into the main Chrony `/etc/chrony.conf` configuration file. Change the IP address accordingly to point to your local Chrony NTP server:

```
Server 192.168.1.150
```

Restart Chrony NTP daemon to apply the changes:

```
# systemctl restart chronyd
```



Check for NTP server sources. Your local NTP server should be listed:

```
# chronyc sources 
210 Number of sources = 9
MS Name/IP address         Stratum Poll Reach LastRx Last sample               
===============================================================================
^* rhel8.localdomain             3   6     7    36  -8235ns[-1042us] +/- 5523us
```



Check NTP client list on the NTP server:

```
# chronyc clients
Hostname                      NTP   Drop Int IntL Last     Cmd   Drop Int  Last
===============================================================================
ntp-client.localdomain       7      0  10   -    48       0      0   -     -
```





Install package Chrony from the repo

​	

```
# dnf install chrony
```

Enable chrony service

```
# systemctl enable chronyd
```



Open firewall port to allow for incoming NTP requests:
	
```
# firewall-cmd --permanent --add-service=ntp
# firewall-cmd --reload
```


​		
❯ timedatectl
​               Local time: Thu 2020-05-21 19:06:12 IST
​           Universal time: Thu 2020-05-21 13:36:12 UTC
​                 RTC time: Thu 2020-05-21 13:36:13    
​                Time zone: Asia/Kolkata (IST, +0530)  
System clock synchronized: no                         
​              NTP service: inactive                   
​          RTC in local TZ: no                         





To Install NTPStat, it's possible to display time synchronization status.

```
[root@node01 ~]# dnf -y install ntpstat
[root@node01 ~]# ntpstat
synchronised to NTP server (10.0.0.30) at stratum 3
   time correct to within 9 ms
   polling server every 64 s
```

