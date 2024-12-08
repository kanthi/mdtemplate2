# hwinfo
==========

used to probe for the hardware present in the system. It can be used to generate a system overview log which can be later used for support

**Common Usage :**  ::

	$ hwinfo --montior (more specific devices list availabale in man page )

**Examples :**


.. code-block:: bash

	king@sysadminlabs:~$ sudo hwinfo --monitor
	37: None 00.0: 10002 LCD Monitor                                
	  [Created at monitor.95]
	  Unique ID: rdCR.pr0H5Ij6zm6
	  Hardware Class: monitor
	  Model: "CR5M3 141AT LCD Monitor"
	  Vendor: SEC "CR5M3 141AT"
	  Device: eisa 0x5441 
	  Resolution: 1280x800@60Hz
	  Size: 303x190 mm
	  Detailed Timings #0:
	     Resolution: 1280x800
	     Horizontal: 1280 1292 1356 1452 (+12 +76 +172) -hsync
	       Vertical:  800  803  806  812 (+3 +6 +12) +vsync
	    Frequencies: 47.16 MHz, 32.48 kHz, 40.00 Hz
	  Detailed Timings #1:
	     Resolution: 1280x800
	     Horizontal: 1280 1292 1356 1452 (+12 +76 +172) -hsync
	       Vertical:  800  803  806  812 (+3 +6 +12) +vsync
	    Frequencies: 70.73 MHz, 48.71 kHz, 59.99 Hz
	  Config Status: cfg=new, avail=yes, need=no, active=unknown

	38: None 00.2: 10002 LCD Monitor
	  [Created at monitor.95]
	  Unique ID: aHB6.pr0H5Ij6zm6
	  Hardware Class: monitor
	  Model: "CR5M3 141AT LCD Monitor"
	  Vendor: SEC "CR5M3 141AT"
	  Device: eisa 0x5441 
	  Resolution: 1280x800@60Hz
	  Size: 303x190 mm
	  Detailed Timings #0:
	     Resolution: 1280x800
	     Horizontal: 1280 1292 1356 1452 (+12 +76 +172) -hsync
	       Vertical:  800  803  806  812 (+3 +6 +12) +vsync
	    Frequencies: 47.16 MHz, 32.48 kHz, 40.00 Hz
	  Detailed Timings #1:
	     Resolution: 1280x800
	     Horizontal: 1280 1292 1356 1452 (+12 +76 +172) -hsync
	       Vertical:  800  803  806  812 (+3 +6 +12) +vsync
	    Frequencies: 70.73 MHz, 48.71 kHz, 59.99 Hz
	  Config Status: cfg=new, avail=yes, need=no, active=unknown
