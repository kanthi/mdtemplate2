# date
=========

print or set the system date and time.


**Common Usage :**  ::


	$ date


**Examples :**


.. code-block:: bash

	 
	king@sysadminlabs:~$ date
	Sat Jul 14 06:28:08 IST 2012

.. code-block:: bash

	king@sysadminlabs:~$ date -d "1978-12-03"
	Sun Dec  3 00:00:00 IST 1978

.. code-block:: bash

	king@sysadminlabs:~$ date +"Week number: %V Year: %y"
	Week number: 28 Year: 12

.. code-block:: bash

	king@sysadminlabs:~$ date -d now
	Sat Jul 14 07:18:27 IST 2012
	king@sysadminlabs:~$ date -d today
	Sat Jul 14 07:18:33 IST 2012
	king@sysadminlabs:~$ date -d sunday
	Sun Jul 15 00:00:00 IST 2012
	king@sysadminlabs:~$ date -d monday
	Mon Jul 16 00:00:00 IST 2012
	king@sysadminlabs:~$ date -d last-monday
	Mon Jul  9 00:00:00 IST 2012

*Convert time to Unix Epoch time [seconds since 00:00:00, Jan 1, 1970]*

.. code-block:: bash


	king@sysadminlabs:~$ date +%s
	1342462234

	king@sysadminlabs:~$ date -d "1975-07-15" +"%s"
	174594600
	king@sysadminlabs:~$
