# ls


list the files and directories


**Common Usage :**  ::

		$ ls

		
**Examples :**

.. code-block:: bash

	king@sysadminlabs:~$ ls
	text1.txt  text2.txt  text3.txt
	
	king@sysadminlabs:~$ ls -l
	total 8
	-rw-rw-r-- 1 king king 21 Jun 26 07:25 text1.txt
	-rw-rw-r-- 1 king king  0 Jun 20 04:12 text2.txt
	-rw-rw-r-- 1 king king 31 Jun 26 07:28 text3.txt
	
	king@sysadminlabs:~$ ls -lrt
	total 8
	-rw-rw-r-- 1 king king  0 Jun 20 04:12 text2.txt
	-rw-rw-r-- 1 king king 21 Jun 26 07:25 text1.txt
	-rw-rw-r-- 1 king king 31 Jun 26 07:28 text3.txt
