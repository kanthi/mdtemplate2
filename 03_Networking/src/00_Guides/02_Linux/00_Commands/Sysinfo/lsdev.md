# lsdev
=======

gathers  information  about your computer's installed hardware from the interrupts, ioports and dma files in the /proc directory


**Common Usage :** ::

	$ lsdev


**Examples :**

.. code-block:: bash

	king@sysadminlabs:~$ lsdev
	Device            DMA   IRQ  I/O Ports
	------------------------------------------------
	0000:00:02.0                   80e0-80e7
	0000:00:1f.2                   8080-808f   8090-809f   80a0-80a3   80b0-80b7   80c0-80c3   80d0-80d7
	0000:00:1f.3                   8000-801f
	0000:00:1f.5                   8020-802f   8030-803f   8040-8043   8050-8057   8060-8063   8070-8077
	acpi                      9 
	ACPI                             0400-0403     0404-0405     0408-040b     0410-0415     0420-042f     0450-0450
	ata_piix                         8020-802f     8030-803f     8040-8043     8050-8057     8060-8063     8070-8077     8080-808f     8090-809f     80a0-80a3     80b0-80b7     80c0-80c3     80d0-80d7
	cascade             4       
	dma                            0080-008f
	dma1                           0000-001f
	dma2                           00c0-00df
	eth0                     46 
	eth1                     17 
	firewire_ohci            16 
	fpu                            00f0-00ff
	hda_intel                47 
	i8042                  1 12 
	i915                     45 
	ips                      18 
	keyboard                       0060-0060   0064-0064
	mmc0                     19 
	PCI                          0000-0cf7 0cf8-0cff 0d00-ffff   2000-3fff     2000-20ff     2400-24ff   4000-4fff   5000-5fff   6000-6fff   7000-7fff
	pic1                           0020-0021
	pic2                           00a0-00a1
	pnp                            0400-047f   0500-057f   0680-069f   1000-1003   1004-1013   164e-164f   ffff-ffff
	rtc0                      8    0070-0077
	timer                     0 
	timer0                         0040-0043
	timer1                         0050-0053
	vga+                           03c0-03df