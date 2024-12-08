# route
========

show / manipulate the IP routing table

Route manipulates the kernel's IP routing tables.  Its primary use is to set up static routes to spe‐cific hosts or networks via an interface after it has been configured with the ifconfig(8) program.
 
When  the  add  or  del  options are used, route modifies the routing tables.  Without these options, route displays the current contents of the routing tables.


**Common Usage :**  ::

	# route

	# route -n 


You can use -n option, to display numerical addresses instead of trying to determine symbolic host names (via dns or /etc/hosts file). 


**Examples :**

.. code-block:: bash


		king@sysadminlabs:~# route
		Kernel IP routing table
		Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
		192.168.138.0   *               255.255.255.0   U     1      0        0 eth1
		192.168.122.0   *               255.255.255.0   U     0      0        0 virbr0
		link-local      *               255.255.0.0     U     1000   0        0 eth1
		default         192.168.138.111 0.0.0.0         UG    0      0        0 eth1
		king@sysadminlabs:~# route -n
		Kernel IP routing table
		Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
		192.168.138.0   0.0.0.0         255.255.255.0   U     1      0        0 eth1
		192.168.122.0   0.0.0.0         255.255.255.0   U     0      0        0 virbr0
		169.254.0.0     0.0.0.0         255.255.0.0     U     1000   0        0 eth1
		0.0.0.0         192.168.138.111 0.0.0.0         UG    0      0        0 eth1



*Add / setup a new route*

route add default gw {IP-ADDRESS} {INTERFACE-NAME}

.. code-block:: bash


	king@sysadminlabs:~# route add -net 10.12.76.0 netmask 255.255.255.0  dev eth1
	king@sysadminlabs:~# route -n
	Kernel IP routing table
	Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
	10.12.76.0      0.0.0.0         255.255.255.0   U     0      0        0 eth1
	192.168.138.0   0.0.0.0         255.255.255.0   U     1      0        0 eth1
	192.168.122.0   0.0.0.0         255.255.255.0   U     0      0        0 virbr0
	169.254.0.0     0.0.0.0         255.255.0.0     U     1000   0        0 eth1
	0.0.0.0         192.168.138.111 0.0.0.0         UG    0      0        0 eth1



*Add a New Route With ‘route add -host’*

.. code-block:: bash


*Remove A Routing Rule With ‘route del’*

.. code-block:: bash

	king@sysadminlabs:~# route del -net 10.12.76.0 netmask 255.255.255.0  dev eth1
	king@sysadminlabs:~# route -n
	Kernel IP routing table
	Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
	192.168.138.0   0.0.0.0         255.255.255.0   U     1      0        0 eth1
	192.168.122.0   0.0.0.0         255.255.255.0   U     0      0        0 virbr0
	169.254.0.0     0.0.0.0         255.255.0.0     U     1000   0        0 eth1
	0.0.0.0         192.168.138.111 0.0.0.0         UG    0      0        0 eth1

