# w
=========

displays  information  about  the users currently on the machine, and their processes.

**Common Usage :**  ::

		$ w
		

**Examples :**

.. code-block:: bash

		king@sysadminlabs:~$ w
		 19:17:09 up  1:12,  2 users,  load average: 0.00, 0.01, 0.05
		USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
		king     tty1                      18:06    1:09m  0.06s  0.05s -bash
		king     pts/1    kings-imac.sysad 18:08    5.00s  0.07s  0.00s w
		
.. code-block:: bash

		king@sysadminlabs:~$ w -u
		 19:29:43 up  1:24,  2 users,  load average: 0.00, 0.01, 0.05
		USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
		king     tty1                      18:06    1:22m  0.06s  0.05s -bash
		king     pts/1    kings-imac.sysad 18:08    7.00s  0.07s  0.00s w -u

