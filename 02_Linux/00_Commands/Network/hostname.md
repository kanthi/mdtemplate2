# hostname
=========

how or set the system's host name

**Common Usage :**  ::

		$ hostname
		

**Examples :**

.. code-block:: bash

				king@sysadminlabs:~$ hostname
				sysadminlabs
				
				
.. code-block:: bash

			king@sysadminlabs:~$ sudo hostname newhostname
			
			king@sysadminlabs:~$ hostname
			newhostname
			
			king@sysadminlabs:~$
			
.. note::
		This command changes hostname untill reboot only. For making permanent change edit file "/etc/hostname"

