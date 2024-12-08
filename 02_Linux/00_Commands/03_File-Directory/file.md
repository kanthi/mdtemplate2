# file


determine file type  


**Common Usage :**  ::

		$ file <filename>

		
**Examples :**

.. code-block:: bash

	king@sysadminlabs:~$ ls
	text  text1.txt  text2.txt  text3.txt
	
	king@sysadminlabs:~$ file text1.txt
	text1.txt: ASCII text
	
	king@sysadminlabs:~$ touch hello.c
	
	king@sysadminlabs:~$ file hello.c
	hello.c: empty
	
	king@sysadminlabs:~$ file /dev/sda1
	/dev/sda1: block special
	