# hwclock
==========

query or set the hardware clock


**Common Usage :**  ::


	$ hwclock


**Examples :**


*To sync the hardware clock to the current system clock:*

.. code-block:: bash

	king@sysadminlabs:~$ sudo hwclock
	[sudo] password for king:
	Sat 21 Jul 2012 02:59:21 AM IST  -0.880887 seconds


.. code-block:: bash

	king@sysadminlabs:~$ hwclock --systohc
	hwclock: Sorry, only the superuser can change the Hardware Clock.


.. code-block:: bash

	king@sysadminlabs:~$ sudo hwclock --systohc
	king@sysadminlabs:~$ sudo hwclock --show
	Tue 17 Jul 2012 05:49:13 AM IST  -0.583722 seconds


.. code-block:: bash

	king@sysadminlabs:~$ sudo hwclock
	Tue 17 Jul 2012 05:49:23 AM IST  -0.521337 seconds

