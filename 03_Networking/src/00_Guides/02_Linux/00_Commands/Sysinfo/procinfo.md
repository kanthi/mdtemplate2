# procinfo
=========

gathers some system data from the /proc directory and prints it nicely formatted on the standard output device


**Common Usage :** ::

	$ procinfo

**Examples :**

.. code-block:: bash

	king@sysadminlabs:~$ procinfo
	Memory:        Total        Used        Free     Buffers                       
	RAM:         3852436     3070012      782424      384820                       
	Swap:        3905532           0     3905532                                   

	Bootup: Wed Apr 13 10:32:02 2011   Load average: 1.10 1.05 1.06 1/513 12278    

	user  :   00:27:37.28   2.8%  page in :          1024571                       
	nice  :   00:00:26.31   0.0%  page out:           565640                       
	system:   00:07:59.99   0.8%  page act:           744498                       
	IOwait:   00:05:33.75   0.6%  page dea:                0                       
	hw irq:   00:00:00.00   0.0%  page flt:         11330417                       
	sw irq:   00:00:09.11   0.0%  swap in :                0                       
	idle  :   15:29:00.62  95.7%  swap out:                0                       
	uptime:   03:58:09.06         context :         25909993                       

	irq   0:         74  timer               irq  17:         32  ehci_hcd:usb2, et
	irq   1:      19719  i8042               irq  18:          0  yenta, ips       
	irq   8:          1  rtc0                irq  19:     148012  ata_piix, ata_pii
	irq   9:      17433  acpi                irq  45:     407560  i915             
	irq  12:     403645  i8042               irq  46:     124251  eth0             
	irq  16:         80  ehci_hcd:usb1, fi   irq  47:       1391  hda_intel        

	sda            32103r           39970w                                         

	eth0        TX 8.47MiB       RX 63.36MiB      lo          TX 480.00B       RX 480.00B      
	eth1        TX 0.00B         RX 0.00B         vboxnet0    TX 0.00B         RX 0.00B     