# lsusb
=======

utility for displaying information about USB devices buses in the system and the devices conencted to them.

**Common Usage :** ::

	$ lsusb

**Examples :**

.. code-block:: bash

	king@sysadminlabs:~$ lsusb
	Bus 002 Device 002: ID 8087:0020 Intel Corp. Integrated Rate Matching Hub
	Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
	Bus 001 Device 003: ID 0c45:6419 Microdia 
	Bus 001 Device 002: ID 8087:0020 Intel Corp. Integrated Rate Matching Hub
	Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

.. code-block:: bash

	king@sysadminlabs:~$ lsusb -t
	/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci_hcd/2p, 480M
	    |__ Port 1: Dev 2, If 0, Class=hub, Driver=hub/8p, 480M
	/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci_hcd/2p, 480M
	    |__ Port 1: Dev 2, If 0, Class=hub, Driver=hub/6p, 480M
	        |__ Port 4: Dev 3, If 0, Class='bInterfaceClass 0x0e not yet handled', Driver=uvcvideo, 480M
	        |__ Port 4: Dev 3, If 1, Class='bInterfaceClass 0x0e not yet handled', Driver=uvcvideo, 480M