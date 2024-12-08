# ifconfig
==========

Display Network Interface details ( See more use of this command for configuring network interface in Network Commands Section )


**Common Usage :**  ::

	$ ifconfig

	$ ifconfig -a


**Examples :**


.. code-block:: bash

	king@sysadminlabs:~# ifconfig
     eth1      Link encap:Ethernet  HWaddr f0:4d:a2:a2:a4:9a  
               inet addr:192.168.138.1  Bcast:192.168.138.255  Mask:255.255.255.0
               inet6 addr: fe80::f24d:a2ff:fea2:a49a/64 Scope:Link
               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
               RX packets:34209 errors:0 dropped:0 overruns:0 frame:0
               TX packets:28886 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:1000 
               RX bytes:36748662 (36.7 MB)  TX bytes:4289103 (4.2 MB)
               Interrupt:17 

     lo        Link encap:Local Loopback  
               inet addr:127.0.0.1  Mask:255.0.0.0
               inet6 addr: ::1/128 Scope:Host
               UP LOOPBACK RUNNING  MTU:16436  Metric:1
               RX packets:38 errors:0 dropped:0 overruns:0 frame:0
               TX packets:38 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:0 
               RX bytes:2332 (2.3 KB)  TX bytes:2332 (2.3 KB)


*This option tells ifconfig to show information about all interfaces, both active and inactive.*

.. code-block:: bash
 
          king@sysadminlabs:~# ifconfig -a
          eth1      Link encap:Ethernet  HWaddr f0:4d:a2:a2:a4:9a  
                    inet addr:192.168.138.1  Bcast:192.168.138.255  Mask:255.255.255.0
                    inet6 addr: fe80::f24d:a2ff:fea2:a49a/64 Scope:Link
                    UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
                    RX packets:34212 errors:0 dropped:0 overruns:0 frame:0
                    TX packets:28891 errors:0 dropped:0 overruns:0 carrier:0
                    collisions:0 txqueuelen:1000 
                    RX bytes:36749164 (36.7 MB)  TX bytes:4289879 (4.2 MB)
                    Interrupt:17 

          lo        Link encap:Local Loopback  
                    inet addr:127.0.0.1  Mask:255.0.0.0
                    inet6 addr: ::1/128 Scope:Host
                    UP LOOPBACK RUNNING  MTU:16436  Metric:1
                    RX packets:38 errors:0 dropped:0 overruns:0 frame:0
                    TX packets:38 errors:0 dropped:0 overruns:0 carrier:0
                    collisions:0 txqueuelen:0 
                    RX bytes:2332 (2.3 KB)  TX bytes:2332 (2.3 KB)

          wlan0     Link encap:Ethernet  HWaddr c0:cb:38:6c:20:4d  
                    BROADCAST MULTICAST  MTU:1500  Metric:1
                    RX packets:0 errors:0 dropped:0 overruns:0 frame:0
                    TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
                    collisions:0 txqueuelen:1000 
                    RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)