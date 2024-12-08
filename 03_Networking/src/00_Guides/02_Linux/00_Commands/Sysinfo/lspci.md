# lspci
=========

utility for displaying information about PCI buses in the system and devices connected to them


**Common Usage :**  ::

	$ lspci

	$ lspci -t (With -t option you can see PCI layout in a tree format)

	$ lspci -tv (use -v option with -t to get detailed information )


**Examples :**

.. code-block:: bash

	king@sysadminlabs:~$ lspci
	00:00.0 Host bridge: Intel Corporation Core Processor DRAM Controller (rev 02)
	00:02.0 VGA compatible controller: Intel Corporation Core Processor Integrated Graphics Controller (rev 02)
	00:16.0 Communication controller: Intel Corporation 5 Series/3400 Series Chipset HECI Controller (rev 06)
	00:1a.0 USB Controller: Intel Corporation 5 Series/3400 Series Chipset USB2 Enhanced Host Controller (rev 05)
	00:1b.0 Audio device: Intel Corporation 5 Series/3400 Series Chipset High Definition Audio (rev 05)
	00:1c.0 PCI bridge: Intel Corporation 5 Series/3400 Series Chipset PCI Express Root Port 1 (rev 05)
	00:1c.1 PCI bridge: Intel Corporation 5 Series/3400 Series Chipset PCI Express Root Port 2 (rev 05)
	00:1c.2 PCI bridge: Intel Corporation 5 Series/3400 Series Chipset PCI Express Root Port 3 (rev 05)
	00:1c.3 PCI bridge: Intel Corporation 5 Series/3400 Series Chipset PCI Express Root Port 4 (rev 05)
	00:1c.5 PCI bridge: Intel Corporation 5 Series/3400 Series Chipset PCI Express Root Port 6 (rev 05)
	00:1d.0 USB Controller: Intel Corporation 5 Series/3400 Series Chipset USB2 Enhanced Host Controller (rev 05)
	00:1e.0 PCI bridge: Intel Corporation 82801 Mobile PCI Bridge (rev a5)
	00:1f.0 ISA bridge: Intel Corporation Mobile 5 Series Chipset LPC Interface Controller (rev 05)
	00:1f.2 IDE interface: Intel Corporation 5 Series/3400 Series Chipset 4 port SATA IDE Controller (rev 05)
	00:1f.3 SMBus: Intel Corporation 5 Series/3400 Series Chipset SMBus Controller (rev 05)
	00:1f.5 IDE interface: Intel Corporation 5 Series/3400 Series Chipset 2 port SATA IDE Controller (rev 05)
	00:1f.6 Signal processing controller: Intel Corporation 5 Series/3400 Series Chipset Thermal Subsystem (rev 05)
	02:00.0 Network controller: Broadcom Corporation BCM43224 802.11a/b/g/n (rev 01)
	03:00.0 CardBus bridge: Ricoh Co Ltd Device e476 (rev 02)
	03:00.1 SD Host controller: Ricoh Co Ltd Device e822 (rev 03)
	03:00.4 FireWire (IEEE 1394): Ricoh Co Ltd Device e832 (rev 03)
	0b:00.0 Ethernet controller: Broadcom Corporation NetXtreme BCM5761e Gigabit Ethernet PCIe (rev 10)
	3f:00.0 Host bridge: Intel Corporation Core Processor QuickPath Architecture Generic Non-core Registers (rev 02)
	3f:00.1 Host bridge: Intel Corporation Core Processor QuickPath Architecture System Address Decoder (rev 02)
	3f:02.0 Host bridge: Intel Corporation Core Processor QPI Link 0 (rev 02)
	3f:02.1 Host bridge: Intel Corporation Core Processor QPI Physical 0 (rev 02)
	3f:02.2 Host bridge: Intel Corporation Core Processor Reserved (rev 02)
	3f:02.3 Host bridge: Intel Corporation Core Processor Reserved (rev 02)

.. code-block:: bash

	king@sysadminlabs:~$ lspci -t
	-+-[0000:3f]-+-00.0
	 |           +-00.1
	 |           +-02.0
	 |           +-02.1
	 |           +-02.2
	 |           \-02.3
	 \-[0000:00]-+-00.0
	             +-02.0
	             +-16.0
	             +-1a.0
	             +-1b.0
	             +-1c.0-[01]--
	             +-1c.1-[02]----00.0
	             +-1c.2-[03-04]--+-00.0
	             |               +-00.1
	             |               \-00.4
	             +-1c.3-[05-0a]--
	             +-1c.5-[0b]----00.0
	             +-1d.0
	             +-1e.0-[0c]--
	             +-1f.0
	             +-1f.2
	             +-1f.3
	             +-1f.5
	             \-1f.6
	

.. code-block:: bash

	king@sysadminlabs:~$ lspci -tv
	-+-[0000:3f]-+-00.0  Intel Corporation Core Processor QuickPath Architecture Generic Non-core Registers
	 |           +-00.1  Intel Corporation Core Processor QuickPath Architecture System Address Decoder
	 |           +-02.0  Intel Corporation Core Processor QPI Link 0
	 |           +-02.1  Intel Corporation Core Processor QPI Physical 0
	 |           +-02.2  Intel Corporation Core Processor Reserved
	 |           \-02.3  Intel Corporation Core Processor Reserved
	 \-[0000:00]-+-00.0  Intel Corporation Core Processor DRAM Controller
	             +-02.0  Intel Corporation Core Processor Integrated Graphics Controller
	             +-16.0  Intel Corporation 5 Series/3400 Series Chipset HECI Controller
	             +-1a.0  Intel Corporation 5 Series/3400 Series Chipset USB2 Enhanced Host Controller
	             +-1b.0  Intel Corporation 5 Series/3400 Series Chipset High Definition Audio
	             +-1c.0-[01]--
	             +-1c.1-[02]----00.0  Broadcom Corporation BCM43224 802.11a/b/g/n
	             +-1c.2-[03-04]--+-00.0  Ricoh Co Ltd Device e476
	             |               +-00.1  Ricoh Co Ltd Device e822
	             |               \-00.4  Ricoh Co Ltd Device e832
	             +-1c.3-[05-0a]--
	             +-1c.5-[0b]----00.0  Broadcom Corporation NetXtreme BCM5761e Gigabit Ethernet PCIe
	             +-1d.0  Intel Corporation 5 Series/3400 Series Chipset USB2 Enhanced Host Controller
	             +-1e.0-[0c]--
	             +-1f.0  Intel Corporation Mobile 5 Series Chipset LPC Interface Controller
	             +-1f.2  Intel Corporation 5 Series/3400 Series Chipset 4 port SATA IDE Controller
	             +-1f.3  Intel Corporation 5 Series/3400 Series Chipset SMBus Controller
	             +-1f.5  Intel Corporation 5 Series/3400 Series Chipset 2 port SATA IDE Controller
	             \-1f.6  Intel Corporation 5 Series/3400 Series Chipset Thermal Subsystem