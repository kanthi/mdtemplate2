# unzip

extract compressed files in a ZIP archive

**Common Usage :**  ::

	
	$ unzip <filename>


**EXamples :**

.. code-block:: bash

		king@sysadminlabs:~$ ls
		file.zip
		
		king@sysadminlabs:~$ unzip file.zip
		Archive:  file.zip
		 extracting: zip1.txt
		 extracting: zip2.txt
		 extracting: zip3.txt
		 
		king@sysadminlabs:~$ ls
		file.zip  zip1.txt  zip2.txt  zip3.txt
		king@sysadminlabs:~$
		

		
