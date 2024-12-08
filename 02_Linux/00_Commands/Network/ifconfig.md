# ifconfig
=============

configure a network interface


**Common Usage :**  ::

     # ifconfig


**Examples :**

.. code-block:: bash

     king@sysadminlabs:~# ifconfig
     eth1      Link encap:Ethernet  HWaddr f0:4d:a2:a2:b4:7a  
               inet addr:192.168.138.1  Bcast:192.168.138.255  Mask:255.255.255.0
               inet6 addr: fe80::f24d:a2ff:fea2:a49a/64 Scope:Link
               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
               RX packets:1158118 errors:0 dropped:0 overruns:0 frame:0
               TX packets:2254444 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:1000 
               RX bytes:91967075 (91.9 MB)  TX bytes:3244257407 (3.2 GB)
               Interrupt:17 

     lo        Link encap:Local Loopback  
               inet addr:127.0.0.1  Mask:255.0.0.0
               inet6 addr: ::1/128 Scope:Host
               UP LOOPBACK RUNNING  MTU:16436  Metric:1
               RX packets:18 errors:0 dropped:0 overruns:0 frame:0
               TX packets:18 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:0 
               RX bytes:1020 (1.0 KB)  TX bytes:1020 (1.0 KB)

     virbr0    Link encap:Ethernet  HWaddr 3a:40:9a:72:c0:ce  
               inet addr:192.168.122.1  Bcast:192.168.122.255  Mask:255.255.255.0
               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
               TX packets:47 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:0 
               RX bytes:0 (0.0 B)  TX bytes:5800 (5.8 KB)

     wlan0     Link encap:Ethernet  HWaddr c0:cb:38:6c:20:4d  
               UP BROADCAST MULTICAST  MTU:1500  Metric:1
               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
               TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:1000 
               RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)



Someimportant information provided by the ifconfig command includes ::

     Each active interface is identified by its name. For instance, on erebus, eth0 (the first Ethernet adapter) and lo (the loopback adapter) are both active.

     In the case of a physical network adapter, you'll get the MAC address, preceded by the term HWaddr.

     The IP address of the interface is preceded by the term inetaddr, the broadcast address by Bcast, and the subnet mask by Mask.

     The IPv6 address of each interface is preceded by the term inet6 addr and its scope, predictably, by the word Scope.

     The types of activity of each interface are listed together—in the case of eth0 above, it lists UP BROADCAST RUNNING MULTICAST.

     Statistics for received and transmitted packets are listed on lines beginning with RX or TX, respectively. On another line, summary information about the amount of received and transmitted data is listed, including the total number of bytes transmitted and received on that device so far.


.. code-block:: bash


     king@sysadminlabs:~# ifconfig -s
     Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
     eth1       1500 0   1842053      0      0 0       3593809      0      0      0 BMRU
     lo        16436 0        18      0      0 0            18      0      0      0 LRU
     virbr0     1500 0         0      0      0 0            48      0      0      0 BMRU
     wlan0      1500 0         0      0      0 0             0      0      0      0 BMU
     </pre>
     This is the "short listing" option, which shows a one-line summarized listing of data about each interface. The information returned is about interface activity, and not configuration. The output will be identical to what is returned by the netstat -i command.


.. code-block:: bash

     king@sysadminlabs:~# ifconfig eth1
     eth1      Link encap:Ethernet  HWaddr f0:4d:a2:a2:b4:7a  
               inet addr:192.168.138.1  Bcast:192.168.138.255  Mask:255.255.255.0
               inet6 addr: fe80::f24d:a2ff:fea2:a49a/64 Scope:Link
               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
               RX packets:2615829 errors:0 dropped:0 overruns:0 frame:0
               TX packets:5105363 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:1000 
               RX bytes:195813492 (195.8 MB)  TX bytes:7353349770 (7.3 GB)
               Interrupt:17 


*Simply follow up your ifconfig command with the name of an interface to get only information about that interface. For instance, you could issue the command ifconfig eth0 if you only wanted information about the eth0 interface, and not the loopback interface. Additionally, there are several options that require specifying the interface you wish to configure or get information about.*

.. code-block:: bash

     # ifconfig eth1 192.168.138.1 netmask 255.255.255.0 broadcast 192.168.2.255


**Bring interface up or down**

.. code-block:: bash 

     # ifconfig eth1 down

     # ifconfig eth1 up


