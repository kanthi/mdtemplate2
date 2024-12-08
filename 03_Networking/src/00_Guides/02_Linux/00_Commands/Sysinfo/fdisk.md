# fdisk
========

show hardisk partition details ( Partition table manipulator for Linux )

**Common Usage :**  ::


	$ fdisk -l


**Examples :**


.. code-block:: bash

	king@sysadminlabs:~# fdisk -l

	Disk /dev/sda: 250.1 GB, 250059350016 bytes
	255 heads, 63 sectors/track, 30401 cylinders
	Units = cylinders of 16065 * 512 = 8225280 bytes
	Sector size (logical/physical): 512 bytes / 512 bytes
	I/O size (minimum/optimal): 512 bytes / 512 bytes
	Disk identifier: 0x08000000

	   Device Boot      Start         End      Blocks   Id  System
	/dev/sda1   *           1        6375    51200000    7  HPFS/NTFS
	/dev/sda2            6375       19123   102400000    7  HPFS/NTFS
	/dev/sda3           19123       30402    90596353    5  Extended
	/dev/sda5           19123       19609     3905536   82  Linux swap / Solaris
	/dev/sda6           19609       22649    24413184   83  Linux
	/dev/sda7           22649       30402    62275584   83  Linux 



