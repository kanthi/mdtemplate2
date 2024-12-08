# free
=========

Display used and memory on the system.

**Common Usage :**  ::

	$ free

	$ free -m

	$ free -g

**Examples :**

.. code-block:: bash

	king@sysadminlabs:~$ free
	             total       used       free     shared    buffers     cached
	Mem:       3852436    2404056    1448380          0     380128     715004
	-/+ buffers/cache:    1308924    2543512
	Swap:      3905532          0    3905532



.. code-block:: bash


	king@sysadminlabs:~$ free -m
	             total       used       free     shared    buffers     cached
	Mem:          3762       2346       1415          0        371        697
	-/+ buffers/cache:       1278       2483
	Swap:         3813          0       3813
	

.. code-block:: bash

	king@sysadminlabs:~$ free -g
	             total       used       free     shared    buffers     cached
	Mem:             3          2          1          0          0          0
	-/+ buffers/cache:          1          2
	Swap:            3          0          3
	

.. code-block:: bash

	king@sysadminlabs:~$ free -t -m
	             total       used       free     shared    buffers     cached
	Mem:          3762       2472       1289          0        372        714
	-/+ buffers/cache:       1384       2377
	Swap:         3813          0       3813
	Total:        7576       2472       5103


*The -s option followed by an integer tells free to keep providing a new, updated output at regular intervals for which the integer indicates the number of seconds*

.. code-block:: bash

	king@sysadminlabs:~$ free -ms 5
	             total       used       free     shared    buffers     cached
	Mem:          3762       2433       1328          0        371        700
	-/+ buffers/cache:       1360       2401
	Swap:         3813          0       3813

	             total       used       free     shared    buffers     cached
	Mem:          3762       2433       1329          0        371        700
	-/+ buffers/cache:       1360       2401
	Swap:         3813          0       3813

	             total       used       free     shared    buffers     cached
	Mem:          3762       2432       1329          0        371        700
	-/+ buffers/cache:       1360       2401
	Swap:         3813          0       3813

	             total       used       free     shared    buffers     cached
	Mem:          3762       2432       1329          0        371        700
	-/+ buffers/cache:       1360       2401
	Swap:         3813          0       3813

	             total       used       free     shared    buffers     cached
	Mem:          3762       2433       1328          0        371        700
	-/+ buffers/cache:       1360       2401
	Swap:         3813          0       3813

	             total       used       free     shared    buffers     cached
	Mem:          3762       2432       1329          0        371        700
	-/+ buffers/cache:       1360       2401
	Swap:         3813          0       3813

	             total       used       free     shared    buffers     cached
	Mem:          3762       2433       1329          0        371        700
	-/+ buffers/cache:       1360       2401
	Swap:         3813          0       3813

	             total       used       free     shared    buffers     cached
	Mem:          3762       2433       1329          0        371        700
	-/+ buffers/cache:       1360       2401
	Swap:         3813          0       3813
	


*Another usefull way of monitoring the difference in memory usage, it higlights the 
mem diff for every time it checks with previous. Easy on eyes.*

.. code-block:: bash

	king@sysadminlabs:~$ watch -n 1 -d free

	Every 10.0s: free                                       Wed Apr 13 12:31:13 2011

	             total       used       free     shared    buffers     cached
	Mem:       3852436    2496300    1356136          0     381148     717652
	-/+ buffers/cache:    1397500    2454936
	Swap:      3905532          0    3905532


*More detailed information about total memory and current memory usage can be obtained by reading the proc/meminfo file directly.*

.. code-block:: bash

	king@sysadminlabs:~$ cat /proc/meminfo 
	MemTotal:        3852436 kB
	MemFree:         1357804 kB
	Buffers:          380808 kB
	Cached:           720384 kB
	SwapCached:            0 kB
	Active:          1389948 kB
	Inactive:         812376 kB
	Active(anon):    1101824 kB
	Inactive(anon):   112528 kB
	Active(file):     288124 kB
	Inactive(file):   699848 kB
	Unevictable:          48 kB
	Mlocked:              48 kB
	SwapTotal:       3905532 kB
	SwapFree:        3905532 kB
	Dirty:                52 kB
	Writeback:             0 kB
	AnonPages:       1101068 kB
	Mapped:           178500 kB
	Shmem:            113224 kB
	Slab:             107000 kB
	SReclaimable:      76384 kB
	SUnreclaim:        30616 kB
	KernelStack:        4184 kB
	PageTables:        42860 kB
	NFS_Unstable:          0 kB
	Bounce:                0 kB
	WritebackTmp:          0 kB
	CommitLimit:     5831748 kB
	Committed_AS:    4083688 kB
	VmallocTotal:   34359738367 kB
	VmallocUsed:      383772 kB
	VmallocChunk:   34359293060 kB
	HardwareCorrupted:     0 kB
	HugePages_Total:       0
	HugePages_Free:        0
	HugePages_Rsvd:        0
	HugePages_Surp:        0
	Hugepagesize:       2048 kB
	DirectMap4k:        8572 kB
	DirectMap2M:     3979264 kB

