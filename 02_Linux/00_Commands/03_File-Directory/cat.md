# car

cat - concatenate files and print on the standard output

**Common Usage :**  ::

		$ cat <filename>

		
**Examples :**

*To display file contest*

.. code-block:: bash

		king@sysadminlabs:~$ cat test.txt
		cat: test.txt: No such file or directory
		king@sysadminlabs:~$ ls
		text1.txt  text2.txt
		king@sysadminlabs:~$ cat text1.txt
		king@sysadminlabs:~$ vim text1.txt
		king@sysadminlabs:~$ cat text1.txt
		Text test

		1

		2

		3

.. code-block:: bash


		king@sysadminlabs:~$ cat /etc/passwd
		root:x:0:0:root:/root:/bin/bash
		daemon:x:1:1:daemon:/usr/sbin:/bin/sh
		bin:x:2:2:bin:/bin:/bin/sh
		sys:x:3:3:sys:/dev:/bin/sh
		sync:x:4:65534:sync:/bin:/bin/sync
		games:x:5:60:games:/usr/games:/bin/sh
		man:x:6:12:man:/var/cache/man:/bin/sh
		lp:x:7:7:lp:/var/spool/lpd:/bin/sh
		mail:x:8:8:mail:/var/mail:/bin/sh
	
*To creat a file*
			
.. code-block:: bash

		king@sysadminlabs:~$ cat >text3.txt
		thi is a text
		with cat command
		<ctrl + D>
		king@sysadminlabs:~$