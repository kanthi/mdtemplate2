# who
=========

show who is logged on

**Common Usage :**  ::

		$ who
		

**Examples :**

.. code-block:: bash

	king@sysadminlabs:~$ who
	king     tty1         2013-10-31 18:06
	king     pts/1        2013-10-31 18:08 (kings-imac.sysadminlabs.local)
	user1    pts/2        2013-10-31 18:57 (kings-imac.sysadminlabs.local)
	
To Get the last system boot time
.. code-block:: bash

	king@sysadminlabs:~$ who -b
	         system boot  2013-10-27 14:18
			 
			 
.. code-block:: bash

	king@sysadminlabs:~$ who -l
	LOGIN    tty4         2013-10-27 14:18               992 id=4
	LOGIN    tty5         2013-10-27 14:18               999 id=5
	LOGIN    tty2         2013-10-27 14:18              1024 id=2
	LOGIN    tty3         2013-10-27 14:18              1025 id=3
	LOGIN    tty6         2013-10-27 14:18              1028 id=6
	
	
.. code-block:: bash

	king@sysadminlabs:~$ who -r
	         run-level 2  2013-10-27 14:18
			 
.. code-block:: bash

	king@sysadminlabs:~$ who -u
	king     tty1         2013-10-31 18:06 00:55        1210
	king     pts/1        2013-10-31 18:08   .          1321 (kings-imac.sysadminlabs.local)
	
.. code-block:: bash

	king@sysadminlabs:~$ who -q
	king king
	# users=2

.. code-block:: bash

	king@sysadminlabs:~$ who -a
	           system boot  2013-10-27 14:18
	           run-level 2  2013-10-27 14:18
	LOGIN      tty4         2013-10-27 14:18               992 id=4
	LOGIN      tty5         2013-10-27 14:18               999 id=5
	LOGIN      tty2         2013-10-27 14:18              1024 id=2
	LOGIN      tty3         2013-10-27 14:18              1025 id=3
	LOGIN      tty6         2013-10-27 14:18              1028 id=6
	king     - tty1         2013-10-31 18:06 00:55        1210
	king     + pts/1        2013-10-31 18:08   .          1321 (kings-imac.sysadminlabs.local)
	           pts/2        2013-10-31 18:58              1497 id=ts/2  term=0 exit=0
	king@sysadminlabs:~$