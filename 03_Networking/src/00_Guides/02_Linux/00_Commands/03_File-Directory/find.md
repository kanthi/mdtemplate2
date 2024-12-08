# find


search for files in a directory hierarchy


**Common Usage :**  ::

		$ find <search-directory-path> options <file-to-search>

		
**Examples :**


.. code-block:: bash

		ing@sysadminlabs:~$ ls
		hello.c  text  text1.txt  text2.txt  text3.txt
		
		king@sysadminlabs:~$ find /home/king -name text1
		
		king@sysadminlabs:~$ find /home/king -name text1*
		/home/king/text1.txt
		
		king@sysadminlabs:~$ find /home/king -name "text1*"
		/home/king/text/text11.txt
		/home/king/text1.txt
		
		
		
*use iname option to ignore case sensitive names*
.. code-block:: bash

		king@sysadminlabs:~$ find /home/king -iname text1*
		/home/king/Text1.txt
		/home/king/text1.txt
		king@sysadminlabs:~$



*search file using file-permissions*		

.. code-block:: bash



*find files using file-size + for greater than and - for less than file size*

.. code-block:: bash

		

*find files between dates(based on age of the file)*

.. code-block:: bash
