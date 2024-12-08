# arp
=====

	The arp table or arp cache keeps track of all devices on your network that your computer is capable of communicating with. It stores the Layer 2 data ( MAC addresses ) as well as the interface in which the device is connected through (i.e. which interface the traffic came in on ). This table can be viewed, modified, flushed using the arp command 


**Common Usage :**  ::

	# arp

	# arp -n    ( The -n will stop the name resolution and just simply display the IP address, otherwise the system tries to identify the actual name (if specified by dns) of the IP.)


**Examples :**

.. code-block:: bash

	king@sysadminlabs:~# arp 
	Address                  HWtype  HWaddress           Flags Mask            Iface
	192.168.138.30           ether   00:22:19:ba:d6:0c   C                     eth1
	192.168.138.111          ether   00:13:10:ab:57:66   C                     eth1
	king-linux-laptop.local  ether   f0:4d:a2:a2:a4:9a   CM                    eth1

	king@sysadminlabs:~# arp -n
	Address                  HWtype  HWaddress           Flags Mask            Iface
	192.168.138.30           ether   00:22:19:ba:d6:0c   C                     eth1
	192.168.138.111          ether   00:13:10:ab:57:66   C                     eth1
	192.168.138.1            ether   f0:4d:a2:a2:a4:9a   CM                    eth1

*We can also view the arp entries using /proc/net/arp*

.. code-block:: bash

	king@sysadminlabs:~# cat /proc/net/arp 
	IP address       HW type     Flags       HW address            Mask     Device
	192.168.138.30   0x1         0x2         00:22:19:ba:d6:0c     *        eth1
	192.168.138.111  0x1         0x2         00:13:10:ab:57:66     *        eth1

*Add Static Arp Entry*

.. code-block:: bash

	king@sysadminlabs:~# arp -n
	Address                  HWtype  HWaddress           Flags Mask            Iface
	192.168.138.30           ether   00:22:19:ba:d6:0c   C                     eth1
	192.168.138.111          ether   00:13:10:ab:57:66   C                     eth1
	192.168.138.1            ether   f0:4d:a2:a2:a4:9a   CM                    eth1


*Delete the Arp Entry*

.. code-block:: bash

	king@sysadminlabs:~# arp -i eth1 -d 192.168.138.1 
	king@sysadminlabs:~# arp -n
	Address                  HWtype  HWaddress           Flags Mask            Iface
	192.168.138.30           ether   00:22:19:ba:d6:0c   C                     eth1
	192.168.138.111          ether   00:13:10:ab:57:66   C                     eth1
	192.168.138.1                    (incomplete)                              eth1
	king@sysadminlabs:~# arp -n
	Address                  HWtype  HWaddress           Flags Mask            Iface
	192.168.138.30           ether   00:22:19:ba:d6:0c   C                     eth1
	192.168.138.111          ether   00:13:10:ab:57:66   C                     eth1
	192.168.138.1                    (incomplete)                              eth1
	king@sysadminlabs:~# arp -i eth1 -d 192.168.138.1 
	No ARP entry for 192.168.138.1
	



