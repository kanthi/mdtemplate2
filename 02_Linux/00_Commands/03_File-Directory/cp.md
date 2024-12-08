# cp

copy files and directories 


**Common Usage :**  ::

		$ cp <source> <destination>

		
**Examples :**

.. code-block:: bash

		king@sysadminlabs:~$ ls
		text1.txt  text2.txt  text3.txt
		
		king@sysadminlabs:~$ cp text1.txt /tmp
		
		king@sysadminlabs:~$ ls /tmp
		text1.txt
		
		

.. code-block:: bash

		king@sysadminlabs:~$ ls
		text1.txt  text2.txt  text3.txt
		
		king@sysadminlabs:~$ mkdir text
		
		king@sysadminlabs:~$ cd text/
		
		king@sysadminlabs:~/text$ touch text11.txt
		
		king@sysadminlabs:~/text$ cd ..
		
		king@sysadminlabs:~$ ls -l
		total 12
		drwxrwxr-x 2 king king 4096 Jun 26 09:14 text
		-rw-rw-r-- 1 king king   21 Jun 26 07:25 text1.txt
		-rw-rw-r-- 1 king king    0 Jun 20 04:12 text2.txt
		-rw-rw-r-- 1 king king   31 Jun 26 07:28 text3.txt
		
		king@sysadminlabs:~$ cp text
		text/      text1.txt  text2.txt  text3.txt
		
		king@sysadminlabs:~$ cp -r text* /tmp
		
		king@sysadminlabs:~$ ls /tmp/
		text  text1.txt  text2.txt  text3.txt

.. code-block:: bash

.. code-block:: bash

