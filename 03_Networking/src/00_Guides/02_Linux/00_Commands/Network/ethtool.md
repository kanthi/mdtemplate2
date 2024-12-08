# ethtool
========

Display or change ethernet card settings

**Common Usage :**  ::

	$ ethtool <interface>

**Examples :**

.. code-block:: bash

	king@sysadminlabs:~# ethtool eth1
	Settings for eth1:
		Supported ports: [ TP ]
		Supported link modes:   10baseT/Half 10baseT/Full 
		                        100baseT/Half 100baseT/Full 
		                        1000baseT/Half 1000baseT/Full 
		Supports auto-negotiation: Yes
		Advertised link modes:  10baseT/Half 10baseT/Full 
		                        100baseT/Half 100baseT/Full 
		                        1000baseT/Half 1000baseT/Full 
		Advertised pause frame use: No
		Advertised auto-negotiation: Yes
		Speed: 100Mb/s
		Duplex: Full
		Port: Twisted Pair
		PHYAD: 1
		Transceiver: internal
		Auto-negotiation: on
		MDI-X: Unknown
		Supports Wake-on: g
		Wake-on: g
		Current message level: 0x000000ff (255)
				       drv probe link timer ifdown ifup rx_err tx_err
		Link detected: yes



