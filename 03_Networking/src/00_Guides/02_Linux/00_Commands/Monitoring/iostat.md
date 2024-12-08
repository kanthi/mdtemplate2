# iostat
=========

eport Central Processing Unit (CPU) statistics and input/output statistics for devices and partitions.

**Common Usage :**  ::

		$ iostat
		

**Examples :**

.. code-block:: bash

		king@sysadminlabs:~$ iostat
		Linux 3.11.0-12-generic (sysadminlabs) 	Friday 01 November 2013 	_x86_64	(2 CPU)

		avg-cpu:  %user   %nice %system %iowait  %steal   %idle
		           0.02    0.00    0.02    0.04    0.00   99.92

		Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
		sda               0.32         5.29         5.00     161671     152528
		


.. code-block:: bash

		king@sysadminlabs:~$ iostat -c
		Linux 3.11.0-12-generic (sysadminlabs) 	Friday 01 November 2013 	_x86_64_	(2 CPU)

		avg-cpu:  %user   %nice %system %iowait  %steal   %idle
		           0.02    0.00    0.02    0.04    0.00   99.92
		

.. code-block:: bash

		king@sysadminlabs:~$ iostat -m
		Linux 3.11.0-12-generic (sysadminlabs) 	Friday 01 November 2013 	_x86_64_	(2 CPU)

		avg-cpu:  %user   %nice %system %iowait  %steal   %idle
		           0.02    0.00    0.02    0.03    0.00   99.92

		Device:            tps    MB_read/s    MB_wrtn/s    MB_read    MB_wrtn
		sda               0.30         0.00         0.00        157        149


.. code-block:: bash

		king@sysadminlabs:~$  iostat 2 3
		Linux 3.11.0-12-generic (sysadminlabs) 	Friday 01 November 2013 	_x86_64_	(2 CPU)

		avg-cpu:  %user   %nice %system %iowait  %steal   %idle
		           0.02    0.00    0.02    0.03    0.00   99.92

		Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
		sda               0.30         4.92         4.66     161671     153160

		avg-cpu:  %user   %nice %system %iowait  %steal   %idle
		           0.00    0.00    0.00    0.00    0.00  100.00

		Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
		sda               0.00         0.00         0.00          0          0

		avg-cpu:  %user   %nice %system %iowait  %steal   %idle
		           0.00    0.00    0.00    0.00    0.00  100.00

		Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
		sda               0.00         0.00         0.00          0          0

.. code-block:: bash


.. code-block:: bash