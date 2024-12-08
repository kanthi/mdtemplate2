# temp



## Configure Chrony as NTP Client

Before we start with the steps to configure chrony as NTP server, let us understand some basic directive used with `chrony.conf`. The default configuration file for chronyd is `/etc/chrony.conf`. The `-f` option can be used to specify an alternate configuration file path.

 

Below is a selection of chronyd configuration options which we will use to configure chrony as NTP Server and NTP Client:

**server hostname [option]…**
The server directive specifies an NTP server which can be used as a time source. The client-server relationship is strictly hierarchical: a client might synchronise its system time to that of the server, but the server’s system time will never be influenced by that of a client.

The server directive is immediately followed by either the name of the server, or its IP address.

**pool name [option]…**
The syntax of this directive is similar to that for the server directive, except that it is used to specify a pool of NTP servers rather than a single NTP server. The pool name is expected to resolve to multiple addresses which might change over time.

An example of the pool directive is

```
pool pool.ntp.org iburst maxsources 3
```

**iburst**
With this option, the interval between the first four requests sent to the server will be 2 seconds or less instead of the interval specified by the `minpoll` option, which allows chronyd to make the first update of the clock shortly after start.

**makestep**
If the system clock can be far from the true time after boot for any reason, chronyd should be allowed to correct it quickly by stepping instead of slewing, which would take a very long time. The makestep directive does that.

An example of the use of this directive is:

```
makestep 1000 10
```

This would step the system clock if the adjustment is larger than 1000 seconds, but only in the first ten clock updates.

**driftfile**
To stabilise the initial synchronisation on the next start, the estimated drift of the system clock is saved to a file specified by the driftfile directive.

**rtcsync**
The `rtcsync` directive is present in the `/etc/chrony.conf` file by default and enables a mode where the system time is periodically copied to the RTC and chronyd does not try to track its drift. This will inform the kernel the system clock is kept synchronized and the kernel will update the real-time clock every 11 minutes.

```
[root@centos-8 ~]# timedatectl
               Local time: Sat 2019-11-02 16:30:37 IST
           Universal time: Sat 2019-11-02 11:00:37 UTC
                 RTC time: Sat 2019-11-02 10:50:04
                Time zone: Asia/Kolkata (IST, +0530)
System clock synchronized: no
              NTP service: inactive
          RTC in local TZ: no
```

If `synchronized` is **yes**, chronyd(ntpd) is in sync and 11 minutes mode is working.
If you disable "`rtcsync`" option in `/etc/chrony.conf`, synchronized will be no. so kernel discipline is disabled and 11 minutes mode would not work.

chrony basically works on slew mode. if chrony(or nptd) is working on slews mode, chrony(or ntpd) does not let kernel know if it is synchronized. however chrony has "rtcsync" as a default option so that chryony can let kernel to know it is synchronized every 10 minitues

There are many more directives which can be used with Chrony, but those can make this article really long so you can refer to the [man page of chrony.conf](https://chrony.tuxfamily.org/doc/3.5/chrony.conf.html) to get the list of all the directives supported with chrony.

 

## Minimal configuration for Chrony NTP Client

The very minimal configuration (`/etc/chrony.conf`) required to configure Chrony suite as NTP Client would be

```
pool pool.ntp.org iburst
driftfile /var/lib/chrony/drift
makestep 10 3
rtcsync
```

Here we are using pool directive instead of selecting individual NTP server.

**HINT:**



This requires an active [internet connection](https://www.golinuxcloud.com/commands-check-if-connected-to-internet-shell/) as the node needs to contact `pool.ntp.org` to get the system time

Next, we need to check whether the system already uses NTP to synchronize our system clock over the network:

```
[root@centos-8 ~]# timedatectl
               Local time: Sat 2019-11-02 16:30:37 IST
           Universal time: Sat 2019-11-02 11:00:37 UTC
                 RTC time: Sat 2019-11-02 10:50:04
                Time zone: Asia/Kolkata (IST, +0530)
System clock synchronized: no
              NTP service: inactive
          RTC in local TZ: no
```

As we see the NTP Service is "**inactive**", we can either start the chrony service or use `timedatectl` command to turn it to "**active**".

```
[root@centos-8 ~]# systemctl is-active chronyd
inactive
```

Now let us change the NTP Service status to "active"

```
[root@centos-8 ~]# timedatectl set-ntp yes
```

Once the clock is synchornized with NTP Server, the "`System clock synchronized`" option should turn to "**yes**" in the above command

Enable the chronyd service to start the service on boot

```
[root@rhel-8 ~]# systemctl enable chronyd
```

Next restart the chronyd service with tcpdump running on a different terminal to monitor the traffic

```
[root@centos-8 ~]# systemctl restart chronyd
```

We will also monitor our NTP traffic using `tcpdump`

```
[root@centos-8 ~]# tcpdump port 123 -i enp0s8
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp0s8, link-type EN10MB (Ethernet), capture size 262144 bytes
21:12:05.038966 IP 162.159.200.1.ntp > centos-8.example.com.47655: NTPv4, Server, length 48
21:12:05.188531 IP centos-8.example.com.34596 > 157.119.108.165.ntp: NTPv4, Client, length 48
21:12:05.202094 IP 157.119.108.165.ntp > centos-8.example.com.34596: NTPv4, Server, length 48
21:12:05.392352 IP centos-8.example.com.60625 > 162.159.200.123.ntp: NTPv4, Client, length 48
21:12:05.437231 IP 162.159.200.123.ntp > centos-8.example.com.60625: NTPv4, Server, length 48
21:12:07.161521 IP centos-8.example.com.39474 > 162.159.200.1.ntp: NTPv4, Client, length 48
21:12:07.170817 IP mail.deva-ayurveda.eu.ntp > centos-8.example.com.49992: NTPv4, Server, length 48
21:12:07.205930 IP 162.159.200.1.ntp > centos-8.example.com.39474: NTPv4, Server, length 48
21:12:07.365353 IP centos-8.example.com.51002 > 157.119.108.165.ntp: NTPv4, Client, length 48
21:12:07.381159 IP 157.119.108.165.ntp > centos-8.example.com.51002: NTPv4, Server, length 48
```

We can see our client machine requesting time from NTP Server, and then NTP Server responding on the next line.

**NOTE:**



This also works to highlight the **iburst** option in action. Note the two-second differences between packet communication as I mentioned earlier in this article.

Next check the service status

```
[root@centos-8 ~]# systemctl status chronyd
● chronyd.service - NTP client/server
   Loaded: loaded (/usr/lib/systemd/system/chronyd.service; enabled; vendor preset: enabled)
   Active: active (running) since Mon 2019-11-04 11:07:41 IST; 9h ago
     Docs: man:chronyd(8)
           man:chrony.conf(5)
  Process: 779 ExecStartPost=/usr/libexec/chrony-helper update-daemon (code=exited, status=0/SUCCESS)
  Process: 760 ExecStart=/usr/sbin/chronyd $OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 776 (chronyd)
    Tasks: 1 (limit: 11519)
   Memory: 1.9M
   CGroup: /system.slice/chronyd.service
           └─776 /usr/sbin/chronyd
```

This command displays information about the current time sources that chronyd is accessing.

```
[root@centos-8 ~]# chronyc sources
210 Number of sources = 4
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
^* 162.159.200.123               3   8   377    66   -529us[ -720us] +/-   47ms
^+ 162.159.200.1                 3   8   377    64  +3569us[+3569us] +/-   51ms
^- 38.143.223.53                 2   8   337   120    +13ms[  +13ms] +/-  217ms
^- mail.deva-ayurveda.eu         2   8   377   255    +19ms[  +19ms] +/-  131ms
```

With -v you get a more verbose output. In this case, extra caption lines are shown as a reminder of the meanings of the columns.

```
[root@centos-8 ~]# chronyc sources -v
210 Number of sources = 4

  .-- Source mode  '^' = server, '=' = peer, '#' = local clock.
 / .- Source state '*' = current synced, '+' = combined , '-' = not combined,
| /   '?' = unreachable, 'x' = time may be in error, '~' = time too variable.
||                                                 .- xxxx [ yyyy ] +/- zzzz
||      Reachability register (octal) -.           |  xxxx = adjusted offset,
||      Log2(Polling interval) --.      |          |  yyyy = measured offset,
||                                     |          |  zzzz = estimated error.
||                                 |    |           
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
^* 162.159.200.123               3   8   377    84   -529us[ -720us] +/-   47ms
^+ 162.159.200.1                 3   8   377    82  +3569us[+3569us] +/-   51ms
^- 38.143.223.53                 2   8   337   139    +13ms[  +13ms] +/-  217ms
^- mail.deva-ayurveda.eu         2   8   377    18  +2666us[+2666us] +/-  121ms
```

The below tracking command displays parameters about the system’s clock performance

```
[root@centos-8 ~]# chronyc tracking
Reference ID    : A29FC87B (162.159.200.123)
Stratum         : 4
Ref time (UTC)  : Mon Nov 04 15:24:03 2019
System time     : 0.000096395 seconds slow of NTP time
Last offset     : -0.000190930 seconds
RMS offset      : 0.000347281 seconds
Frequency       : 12.779 ppm slow
Residual freq   : -0.017 ppm
Skew            : 0.997 ppm
Root delay      : 0.092059635 seconds
Root dispersion : 0.000978533 seconds
Update interval : 256.1 seconds
Leap status     : Normal
```

**NOTE:**



Here as you see the System time value printed by the chronyc's tracking command is **non-zero** which is the remaining correction that needs to be applied to the system clock. This can performed faster by using the `makestep` directive in `chrony.conf`

**HINT:**



The preceding code may take a second to populate and you may get "`Leap Status`" as "**Not synchronised**". If you're particularly quick off the mark, try again in a few seconds.

The "`chronyc activity`" command reports the number of servers and peers that are online and offline. If the `auto_offline` option is used in specifying some of the servers or peers, the activity command can be useful for detecting when all of them have entered the offline state after the network link has been disconnected.

```
[root@centos-8 ~]# chronyc activity
200 OK
4 sources online
0 sources offline
0 sources doing burst (return to online)
0 sources doing burst (return to offline)
0 sources with unknown address
```

 

## Configure Chrony as NTP Server

To configure chrony as NTP Server you just need to add an "`allow`" directive to the `/etc/chrony.conf` file in order to open the NTP port and allow chronyd to reply to client requests. "`allow`" with no specified subnet allows access from all IPv4 and [IPv6 addresses](https://www.golinuxcloud.com/how-to-configure-ipv6-address-in-linux-rhel-centos-7/).

**allow [all] [subnet]**
The allow directive is used to designate a particular subnet from which NTP clients are allowed to access the computer as an NTP server. The default is that no clients are allowed access, i.e. chronyd operates purely as an NTP client.

Example:

```
allow 192.0.2.0/24
```

So we will add this directive on our NTP Client which we created above, with this we configure chrony as NTP Server.

```
[root@centos-8 ~]# egrep allow /etc/chrony.conf
allow 192.168.0.0/24
```

Restart the Chronyd service

```
[root@centos-8 ~]# systemctl restart chronyd.service
```

With this the steps to configure chrony as NTP Server is complete. You may add more directives as provided in the [chrony.conf man page](https://chrony.tuxfamily.org/doc/3.5/chrony.conf.html).

Next configure your NTP Client, below are the minimal configuration for `chrony.conf`

```
[root@rhel-8 ~]# egrep -v "#" /etc/chrony.conf | sed /^$/d
server 192.168.0.113 iburst
driftfile /var/lib/chrony/drift
makestep 10 3
rtcsync
```

Here I have added the IP of my NTP Server i.e. 192.168.0.113

Next we will start tcpdump from one terminal and restart the chronyd service on another terminal.

```
[root@rhel-8 ~]# systemctl restart chronyd
```

In parallel session I have tcpdump monitoring port 123

```
[root@rhel-8 ~]# tcpdump -i enp0s8 port 123
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp0s8, link-type EN10MB (Ethernet), capture size 262144 bytes
21:35:47.677015 IP rhel-8.golinuxcloud.com.41990 > 192.168.0.113.ntp: NTPv4, Client, length 48
21:35:47.677494 IP 192.168.0.113.ntp > rhel-8.golinuxcloud.com.41990: NTPv4, Server, length 48
21:35:49.682774 IP rhel-8.golinuxcloud.com.52592 > 192.168.0.113.ntp: NTPv4, Client, length 48
21:35:49.683364 IP 192.168.0.113.ntp > rhel-8.golinuxcloud.com.52592: NTPv4, Server, length 48
21:35:51.722416 IP rhel-8.golinuxcloud.com.58605 > 192.168.0.113.ntp: NTPv4, Client, length 48
21:35:51.723017 IP 192.168.0.113.ntp > rhel-8.golinuxcloud.com.58605: NTPv4, Server, length 48
21:35:53.759156 IP rhel-8.golinuxcloud.com.57763 > 192.168.0.113.ntp: NTPv4, Client, length 48
21:35:53.759635 IP 192.168.0.113.ntp > rhel-8.golinuxcloud.com.57763: NTPv4, Server, length 48
```

As you see with an interval of 2 seconds my NTP client is contacting the NTP Server.

Check the current time sources that chronyd is accessing.

```
[root@rhel-8 ~]# chronyc sources
210 Number of sources = 1
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
^* 192.168.0.113                 4   6   377     8  -1850us[-4252us] +/-   48ms
```

Check the system’s clock performance

```
[root@rhel-8 ~]# chronyc tracking
Reference ID    : C0A80071 (192.168.0.113)
Stratum         : 5
Ref time (UTC)  : Mon Nov 04 16:12:20 2019
System time     : 0.000221206 seconds slow of NTP time
Last offset     : -0.002402505 seconds
RMS offset      : 0.006636207 seconds
Frequency       : 6.789 ppm fast
Residual freq   : -2.177 ppm
Skew            : 39.512 ppm
Root delay      : 0.092386283 seconds
Root dispersion : 0.003397160 seconds
Update interval : 64.2 seconds
Leap status     : Normal
```

So our client is in sync with NTP Server which we created above.

 

## Chrony force sync with NTP Server

chronyd does not step the clock by default, but the default `chrony.conf` file provided in the chrony package allows steps in the first three updates of the clock. After that, all corrections are made slowly by speeding up or slowing down the clock. The `chronyc makestep` command can be issued to force chronyd to step the clock at any time.

```
[root@centos-8 ~]# chronyc makestep
200 OK
```

Be aware, though this command can have unexpected side effects. Sometimes, programs detect sudden jerks, and will forcibly kill themselves to avoid issues.
If you want to tell how busy your server is, you can also use `serverstats` on the command line:

```
[root@centos-8 ~]# chronyc serverstats
NTP packets received       : 16
NTP packets dropped        : 0
Command packets received   : 1
Command packets dropped    : 0
Client log records dropped : 0
```

But to Chrony force sync with NTP Server, then you can use "**-q**" argument. When run in this mode, chrony force sync with NTP Server and chronyd will set the system clock once and exit. It will not detach from the terminal

```
[root@centos-8 ~]# systemctl stop chronyd
```

Execute the command as shown below to chrony force sync with NTP Server where chronyd wiill pick the NTP Server from `/etc/chrony.conf`

```
[root@centos-8 ~]# chronyd -q
2019-11-01T06:31:07Z chronyd version 3.3 starting (+CMDMON +NTP +REFCLOCK +RTC +PRIVDROP +SCFILTER +SIGND +ASYNCDNS +SECHASH +IPV6 +DEBUG)
2019-11-01T06:31:07Z Frequency -13.129 +/- 2.279 ppm read from /var/lib/chrony/drift
2019-11-01T06:31:07Z Using right/UTC timezone to obtain leap second data
2019-11-01T06:31:13Z System clock wrong by 174651.064855 seconds (step)
2019-11-03T07:02:04Z chronyd exiting
```

If you wish to provide a custom NTP Server for chrony force sync with NTP Server, follow below syntax:

```
[root@rhel-8 ~]# chronyd -q "server 192.168.0.113 iburst"
2019-11-04T16:16:14Z chronyd version 3.3 starting (+CMDMON +NTP +REFCLOCK +RTC +PRIVDROP +SCFILTER +SIGND +ASYNCDNS +SECHASH +IPV6 +DEBUG)
2019-11-04T16:16:14Z Initial frequency -19.057 ppm
2019-11-04T16:16:18Z System clock wrong by -0.000991 seconds (step)
2019-11-04T16:16:18Z chronyd exiting
```

So as we see we were able to chrony force sync with NTP Server, next start the chronyd service

```
[root@centos-8 ~]# systemctl start chronyd
```

 

Lastly I hope the steps from the article to configure chrony as NTP Server and NTP Client and Chrony force sync with NTP Server on Linux was helpful. So, let me know your suggestions and feedback using the comment section.

 