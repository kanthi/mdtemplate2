# netstat
===========

Print network connections, routing tables, interface statistics, masquerade connections, and multicast memberships


    -S displays statistical information about the protocols.
    -I displays statistical information about the network interface.
    -R displays the routing table.
    -C displays statistical information and updates every second
    -L displays information about all sockets that are ready to listen.
    -A displays information about all sockets that are ready to listen and not listen.
    -P displays information about sockets and PID with ProcessName.


    
**Common Usage :**  ::

    # netstat -rn

    # netstat -a 

**Examples :**

.. code-block:: bash

    king@sysadminlabs:~#  netstat --tcp 
    Active Internet connections (w/o servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State      
    tcp        0      0 king-linux-laptop:56697 ec2-174-129-241-1:https ESTABLISHED
    tcp        0      0 king-linux-laptop:42177 59.165.251.112.ma:https ESTABLISHED
    tcp        0      0 king-linux-laptop:49387 192.168.138.150:ssh     ESTABLISHED
    tcp        0      0 king-linux-laptop:36741 ty-in-f125.:xmpp-client ESTABLISHED
    tcp        0      0 king-linux-laptop:36740 ty-in-f125.:xmpp-client ESTABLISHED
    tcp        0      0 king-linux-laptop:42190 59.165.251.112.ma:https ESTABLISHED
    tcp        0      0 king-linux-laptop:58628 box677.bluehost.com:www ESTABLISHED
    tcp        0      0 king-linux-laptop:36743 ty-in-f125.:xmpp-client ESTABLISHED
    tcp        0      0 king-linux-laptop:46561 jabber-02-0:xmpp-client ESTABLISHED
    


.. code-block:: bash

    
    king@sysadminlabs:~#  netstat --tcp --numeric 
    Active Internet connections (w/o servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State      
    tcp        0      0 192.168.138.1:56697     174.129.241.144:443     ESTABLISHED
    tcp        0      0 192.168.138.1:42177     59.165.251.112:443      ESTABLISHED
    tcp        0      0 192.168.138.1:49387     192.168.138.150:22      ESTABLISHED
    tcp        0      0 192.168.138.1:36741     74.125.153.125:5222     ESTABLISHED
    tcp        0      0 192.168.138.1:36740     74.125.153.125:5222     ESTABLISHED
    tcp        0      0 192.168.138.1:42190     59.165.251.112:443      ESTABLISHED
    tcp        0      0 192.168.138.1:58628     66.147.244.177:80       ESTABLISHED
    tcp        0      0 192.168.138.1:36743     74.125.153.125:5222     ESTABLISHED
    tcp        0      0 192.168.138.1:46561     69.171.241.10:5222      ESTABLISHED
    


    --programs which indicates which process is listening on the specified port.

.. code-block:: bash

    king@sysadminlabs:~# netstat --tcp --listening --programs
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 *:www                   *:*                     LISTEN      1162/apache2    
    tcp        0      0 king-linux-lapto:domain *:*                     LISTEN      1041/dnsmasq    
    tcp        0      0 *:ssh                   *:*                     LISTEN      823/sshd        
    tcp        0      0 localhost:ipp           *:*                     LISTEN      1529/cupsd      
    tcp6       0      0 [::]:ssh                [::]:*                  LISTEN      823/sshd        
    tcp6       0      0 ip6-localhost:ipp       [::]:*                  LISTEN      1529/cupsd     
    
.. code-block:: bash
   
    king@sysadminlabs:~# netstat --route
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
    192.168.138.0   *               255.255.255.0   U         0 0          0 eth1
    192.168.122.0   *               255.255.255.0   U         0 0          0 virbr0
    link-local      *               255.255.0.0     U         0 0          0 eth1
    default         192.168.138.111 0.0.0.0         UG        0 0          0 eth1
    


.. code-block:: bash
    
    king@sysadminlabs:~# netstat --statistics --raw
    Ip:
        11737732 total packets received
        9 with invalid addresses
        0 forwarded
        0 incoming packets discarded
        11737108 incoming packets delivered
        3661706 requests sent out
        102 dropped because of missing route
    Icmp:
        282 ICMP messages received
        0 input ICMP message failed.
        ICMP input histogram:
            destination unreachable: 276
            timeout in transit: 6
        277 ICMP messages sent
        0 ICMP messages failed
        ICMP output histogram:
            destination unreachable: 277
    IcmpMsg:
            InType3: 276
            InType11: 6
            OutType3: 277
    UdpLite:
    IpExt:
        InMcastPkts: 1282
        OutMcastPkts: 885
        InBcastPkts: 1604
        InOctets: 728956329
        OutOctets: 1378220505
        InMcastOctets: 64907
        OutMcastOctets: 52227
        InBcastOctets: 499456
    


*To see all of the TCP ports being listened to on the system, and by what program, use:*

    
    king@sysadminlabs:~# netstat -l --tcp -p
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 *:www                   *:*                     LISTEN      1162/apache2    
    tcp        0      0 king-linux-lapto:domain *:*                     LISTEN      1041/dnsmasq    
    tcp        0      0 *:ssh                   *:*                     LISTEN      823/sshd        
    tcp        0      0 localhost:ipp           *:*                     LISTEN      1529/cupsd      
    tcp6       0      0 [::]:ssh                [::]:*                  LISTEN      823/sshd        
    tcp6       0      0 ip6-localhost:ipp       [::]:*                  LISTEN      1529/cupsd    
    


*The -i switch provides a list of network interfaces and the number of packets transmitted*
  
.. code-block:: bash

    king@sysadminlabs:~# netstat -i
    Kernel Interface table
    Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
    eth1       1500 0  11738163      0      0 0      22841742      0      0      0 BMRU
    lo        16436 0       502      0      0 0           502      0      0      0 LRU
    virbr0     1500 0         0      0      0 0           554      0      0      0 BMRU
    wlan0      1500 0         0      0      0 0             0      0      0      0 BMU
    

*-c switch, which will print a continuous listing of whatever you have asked it to display, refreshing every second.*
  
.. code-block:: bash

    king@sysadminlabs:~# netstat -ic
    Kernel Interface table
    Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
    eth1       1500 0  11738210      0      0 0      22841792      0      0      0 BMRU
    lo        16436 0       502      0      0 0           502      0      0      0 LRU
    virbr0     1500 0         0      0      0 0           554      0      0      0 BMRU
    wlan0      1500 0         0      0      0 0             0      0      0      0 BMU
    Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
    eth1       1500 0  11738210      0      0 0      22841792      0      0      0 BMRU
    lo        16436 0       502      0      0 0           502      0      0      0 LRU
    virbr0     1500 0         0      0      0 0           554      0      0      0 BMRU
    wlan0      1500 0         0      0      0 0             0      0      0      0 BMU
    Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
    eth1       1500 0  11738211      0      0 0      22841793      0      0      0 BMRU
    lo        16436 0       502      0      0 0           502      0      0      0 LRU
    virbr0     1500 0         0      0      0 0           554      0      0      0 BMRU
    wlan0      1500 0         0      0      0 0             0      0      0      0 BMU
    Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
    eth1       1500 0  11738211      0      0 0      22841793      0      0      0 BMRU
    lo        16436 0       502      0      0 0           502      0      0      0 LRU
    virbr0     1500 0         0      0      0 0           554      0      0      0 BMRU
    wlan0      1500 0         0      0      0 0             0      0      0      0 BMU
    ^C
   


    netstat -tulpn

    -t : TCP port
    -u : UDP port
    -l : Show only listening sockets.
    -p : Show the PID and name of the program to which each socket / port belongs
    -n : No DNS lookup (speed up operation)

.. code-block:: bash

   
    king@sysadminlabs:~# netstat -tulpn
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      1162/apache2    
    tcp        0      0 192.168.122.1:53        0.0.0.0:*               LISTEN      1041/dnsmasq    
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      823/sshd        
    tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      1529/cupsd      
    tcp6       0      0 :::22                   :::*                    LISTEN      823/sshd        
    tcp6       0      0 ::1:631                 :::*                    LISTEN      1529/cupsd      
    udp        0      0 0.0.0.0:5353            0.0.0.0:*                           850/avahi-daemon: r
    udp        0      0 0.0.0.0:38305           0.0.0.0:*                           850/avahi-daemon: r
    udp        0      0 192.168.122.1:53        0.0.0.0:*                           1041/dnsmasq    
    udp        0      0 0.0.0.0:67              0.0.0.0:*                           1041/dnsmasq    
    udp6       0      0 :::60290                :::*                                850/avahi-daemon: r
    udp6       0      0 :::5353                 :::*                                850/avahi-daemon: r

   


*argument to better visualize process and ports, inclusive root programs.*

.. code-block:: bash

    
    king@sysadminlabs:~# netstat -antpuew
    Active Internet connections (servers and established)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       User       Inode       PID/Program name
    tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      0          9439        1162/apache2    
    tcp        0      0 192.168.122.1:53        0.0.0.0:*               LISTEN      0          9377        1041/dnsmasq    
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      0          507         823/sshd        
    tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      0          10004       1529/cupsd      
    tcp        0      0 192.168.138.1:38093     174.129.241.144:443     ESTABLISHED 1000       636565      2058/python     
    tcp        0      0 192.168.138.1:48772     59.165.251.112:443      TIME_WAIT   0          0           -               
    tcp        0      0 192.168.138.1:49387     192.168.138.150:22      ESTABLISHED 0          433558      6319/ssh        
    tcp        0      0 192.168.138.1:38428     59.165.251.112:443      ESTABLISHED 1000       643198      2006/firefox-bin
    tcp        0      0 192.168.138.1:43300     66.147.244.177:80       ESTABLISHED 1000       644137      2024/chrome     
    tcp        0      0 192.168.138.1:36741     74.125.153.125:5222     ESTABLISHED 1000       423345      6165/telepathy-gabb
    tcp        0      0 192.168.138.1:36740     74.125.153.125:5222     ESTABLISHED 1000       423343      6165/telepathy-gabb
    tcp        1      0 192.168.138.1:43299     66.147.244.177:80       CLOSE_WAIT  1000       643259      2024/chrome     
    tcp        0      0 192.168.138.1:36743     74.125.153.125:5222     ESTABLISHED 1000       422205      2024/chrome     
    tcp        0      0 192.168.138.1:46561     69.171.241.10:5222      ESTABLISHED 1000       422190      6165/telepathy-gabb
    tcp6       0      0 :::22                   :::*                    LISTEN      0          509         823/sshd        
    tcp6       0      0 ::1:631                 :::*                    LISTEN      0          10003       1529/cupsd      
    udp        0      0 0.0.0.0:5353            0.0.0.0:*                           104        7560        850/avahi-daemon: r
    udp        0      0 0.0.0.0:38305           0.0.0.0:*                           104        7562        850/avahi-daemon: r
    udp        0      0 192.168.122.1:53        0.0.0.0:*                           0          9376        1041/dnsmasq    
    udp        0      0 0.0.0.0:67              0.0.0.0:*                           0          9372        1041/dnsmasq    
    udp6       0      0 :::60290                :::*                                104        7563        850/avahi-daemon: r
    udp6       0      0 :::5353                 :::*                                104        7561        850/avahi-daemon: r
   

.. code-block:: bash

    
    king@sysadminlabs:~# netstat --interfaces eth0
    Kernel Interface table
    Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
    eth1       1500 0  11738476      0      0 0      22842087      0      0      0 BMRU
    lo        16436 0       502      0      0 0           502      0      0      0 LRU
    virbr0     1500 0         0      0      0 0           557      0      0      0 BMRU
    wlan0      1500 0         0      0      0 0             0      0      0      0 BMU

    

*find out if your server is under attack or not. You can also list abusive IP address using this method.*
    
.. code-block:: bash

    king@sysadminlabs:~#  netstat -nat | awk '{print $6}' | sort | uniq -c | sort -n
          1 established)
          1 Foreign
          6 LISTEN
          9 ESTABLISHED

    


*Get List Of All Unique IP Address*

.. code-block:: bash

    
    king@sysadminlabs:~# netstat -nat | awk '{ print $5}' | cut -d: -f1 | sed -e '/^$/d' | uniq
    and
    Address
    0.0.0.0
    59.165.251.112
    192.168.138.150
    59.165.251.112
    74.125.153.125
    69.171.241.10
    174.129.193.12


.. code-block:: bash

    king@sysadminlabs:~# netstat -nat | awk '{ print $5}' | cut -d: -f1 | sed -e '/^$/d' | uniq | wc -l
    9



*tcp ports using netstat -at*

.. code-block:: bash

    
    king@sysadminlabs:~# netstat -at
    Active Internet connections (servers and established)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State      
    tcp        0      0 *:www                   *:*                     LISTEN     
    tcp        0      0 king-linux-lapto:domain *:*                     LISTEN     
    tcp        0      0 *:ssh                   *:*                     LISTEN     
    tcp        0      0 localhost:ipp           *:*                     LISTEN     
    tcp        0      0 king-linux-laptop:52546 59.165.251.112.ma:https ESTABLISHED
    tcp        0      0 king-linux-laptop:34575 box677.bluehost.com:www ESTABLISHED
    tcp        0      0 king-linux-laptop:52547 59.165.251.112.ma:https ESTABLISHED
    ^C

    
*List Sockets which are in Listening State*

.. code-block:: bash

    king@sysadminlabs:~# netstat -l
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State      
    tcp        0      0 *:www                   *:*                     LISTEN     
    tcp        0      0 king-linux-lapto:domain *:*                     LISTEN     
    tcp        0      0 *:ssh                   *:*                     LISTEN     
    tcp        0      0 localhost:ipp           *:*                     LISTEN     
    

*List only the listening UNIX Ports using netstat -lx*
    
.. code-block:: bash

    king@sysadminlabs:~# netstat -lx
    Active UNIX domain sockets (only servers)
    Proto RefCnt Flags       Type       State         I-Node   Path
    unix  2      [ ACC ]     STREAM     LISTENING     7152     /tmp/.X11-unix/X0
    unix  2      [ ACC ]     STREAM     LISTENING     13567    @/tmp/dbus-ygjuS54GbB
    unix  2      [ ACC ]     STREAM     LISTENING     11046    /tmp/ssh-senafXPy1700/agent.1700
    unix  2      [ ACC ]     STREAM     LISTENING     13584    /tmp/.ICE-unix/1700
    unix  2      [ ACC ]     STREAM     LISTENING     9226     /var/run/dbus/system_bus_socket
    unix  2      [ ACC ]     STREAM     LISTENING     13603    /tmp/orbit-king/linc-6ce-0-354456978075c
    unix  2      [ ACC ]     STREAM     LISTENING     13608    /tmp/orbit-king/linc-6a4-0-43b591b586162
    unix  2      [ ACC ]     STREAM     LISTENING     11591    /tmp/keyring-IePuwd/pkcs11
    unix  2      [ ACC ]     STREAM     LISTENING     12776    /tmp/keyring-IePuwd/control
    unix  2      [ ACC ]     STREAM     LISTENING     22353    /tmp/orbit-king/linc-8fc-0-6c7ac35f7638d
    unix  2      [ ACC ]     STREAM     LISTENING     17864    /tmp/orbit-king/linc-7d6-0-8428bf165ea
    unix  2      [ ACC ]     STREAM     LISTENING     10005    /var/run/cups/cups.sock
    unix  2      [ ACC ]     STREAM     LISTENING     11594    /tmp/keyring-IePuwd/ssh
    unix  2      [ ACC ]     STREAM     LISTENING     13728    /tmp/orbit-king/linc-6d7-0-2d3a42ab5dc0
    unix  2      [ ACC ]     STREAM     LISTENING     14421    /tmp/orbit-king/linc-6e6-0-6ae401e21aec6
    unix  2      [ ACC ]     STREAM     LISTENING     492509   /tmp/.esd-1000/socket
    unix  2      [ ACC ]     STREAM     LISTENING     492511   /home/king/.pulse/c6554e6575ef79f02697498e0000000c-runtime/native
    unix  2      [ ACC ]     STREAM     LISTENING     13162    /tmp/orbit-king/linc-6ea-0-53a7c2f765ea2
    unix  2      [ ACC ]     STREAM     LISTENING     546      /var/run/avahi-daemon/socket
    unix  2      [ ACC ]     STREAM     LISTENING     11781    /tmp/orbit-king/linc-6f7-0-2fd77557036b
    unix  2      [ ACC ]     STREAM     LISTENING     14622    /tmp/orbit-king/linc-703-0-391aa2167f13d
    unix  2      [ ACC ]     STREAM     LISTENING     11983    /tmp/orbit-king/linc-72b-0-2f3c073fa0b4
    unix  2      [ ACC ]     STREAM     LISTENING     11998    /tmp/orbit-king/linc-744-0-c8f800920a9e
    unix  2      [ ACC ]     STREAM     LISTENING     13959    /tmp/orbit-king/linc-70b-0-25091fd92107d
    unix  2      [ ACC ]     STREAM     LISTENING     12073    /tmp/orbit-king/linc-767-0-ae85503bcca1
    unix  2      [ ACC ]     STREAM     LISTENING     14857    /tmp/orbit-king/linc-76d-0-59ae4699d1aad
    unix  2      [ ACC ]     STREAM     LISTENING     12228    /tmp/orbit-king/linc-7a1-0-1e778e2ee6eac
    unix  2      [ ACC ]     STREAM     LISTENING     12240    /tmp/orbit-king/linc-7a7-0-1e25fe4de8220
    unix  2      [ ACC ]     STREAM     LISTENING     15680    /tmp/orbit-king/linc-794-0-59fae6bfe8eb7
    unix  2      [ ACC ]     STREAM     LISTENING     14186    /tmp/orbit-king/linc-7b9-0-4396d6753bea
    unix  2      [ ACC ]     STREAM     LISTENING     14991    /tmp/orbit-king/linc-7bc-0-50471bb9d2074
    unix  2      [ ACC ]     STREAM     LISTENING     14997    /tmp/orbit-king/linc-776-0-5c91200aed615
    unix  2      [ ACC ]     STREAM     LISTENING     15022    /tmp/orbit-king/linc-7c4-0-6d5136c97985
    unix  2      [ ACC ]     STREAM     LISTENING     16072    /tmp/orbit-king/linc-7db-0-11c5d2e0522bd
    unix  2      [ ACC ]     STREAM     LISTENING     18736    /tmp/.com.google.chrome.4ZKaDc/SingletonSocket
    unix  2      [ ACC ]     STREAM     LISTENING     19985    /tmp/orbit-king/linc-7e8-0-340aeb326bff
    unix  2      [ ACC ]     STREAM     LISTENING     609381   /tmp/orbit-king/linc-1ec8-0-14e222b36eb5e
    unix  2      [ ACC ]     STREAM     LISTENING     7333     @/com/ubuntu/upstart
    unix  2      [ ACC ]     STREAM     LISTENING     27055    /tmp/gedit.king.1416966279
    unix  2      [ ACC ]     STREAM     LISTENING     26082    /tmp/orbit-king/linc-9d2-0-6ef7a8aad97ed
    unix  2      [ ACC ]     STREAM     LISTENING     32181    /tmp/orbit-king/linc-9a8-0-5c1c612ce182d
    unix  2      [ ACC ]     STREAM     LISTENING     495192   /tmp/orbit-king/linc-1afd-0-1613c310e6e5a
    unix  2      [ ACC ]     STREAM     LISTENING     9297     /var/run/acpid.socket
    unix  2      [ ACC ]     STREAM     LISTENING     7622     @/org/bluez/audio
    unix  2      [ ACC ]     STREAM     LISTENING     10531    @/tmp/gdm-session-rnWMJzFK
    unix  2      [ ACC ]     STREAM     LISTENING     7151     @/tmp/.X11-unix/X0
    unix  2      [ ACC ]     STREAM     LISTENING     9319     /var/run/libvirt/libvirt-sock
    unix  2      [ ACC ]     STREAM     LISTENING     9321     /var/run/libvirt/libvirt-sock-ro
    unix  2      [ ACC ]     STREAM     LISTENING     114235   @/org/wrapper/NSPlugins/libflashplayer.so/3995-1
    unix  2      [ ACC ]     STREAM     LISTENING     57899    @/org/wrapper/NSPlugins/libflashplayer.so/2978-2
    unix  2      [ ACC ]     STREAM     LISTENING     7619     /var/run/sdp
    unix  2      [ ACC ]     STREAM     LISTENING     10053    @/tmp/gdm-greeter-uFfbdOjf
    unix  2      [ ACC ]     STREAM     LISTENING     13583    @/tmp/.ICE-unix/1700
    unix  2      [ ACC ]     STREAM     LISTENING     1002     /var/run/apache2/cgisock.1162

    
*Find out on which port a program is running*

.. code-block:: bash

    
    king@sysadminlabs:~# netstat -ap | grep ssh
    tcp        0      0 *:ssh                   *:*                     LISTEN      823/sshd        
    tcp        0      0 king-linux-laptop:49387 192.168.138.150:ssh     ESTABLISHED 6319/ssh        
    tcp6       0      0 [::]:ssh                [::]:*                  LISTEN      823/sshd        
    unix  2      [ ACC ]     STREAM     LISTENING     11046    1733/ssh-agent      /tmp/ssh-senafXPy1700/agent.1700
    unix  2      [ ACC ]     STREAM     LISTENING     11594    1681/gnome-keyring- /tmp/keyring-IePuwd/ssh

    

*Find out which process is using a particular port:*

.. code-block:: bash

    king@sysadminlabs:~#  netstat -an | grep ':80'
    tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN     
    tcp        0      0 192.168.138.1:41593     66.147.244.177:80       ESTABLISHED

