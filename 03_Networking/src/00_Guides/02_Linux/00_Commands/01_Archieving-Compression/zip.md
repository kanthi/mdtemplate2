# zip 
package and compress files

**Common Usage :**  ::

	
	$ zip <filename> <files-to-be-zipped>
	
	$ zip -r file * 


**EXamples :**

.. code-block:: bash

		king@sysadminlabs:~$ touch zip1.txt zip2.txt zip3.txt
		
		king@sysadminlabs:~$ ls
		zip1.txt  zip2.txt  zip3.txt
		
		king@sysadminlabs:~$ zip file *
		  adding: zip1.txt (stored 0%)
		  adding: zip2.txt (stored 0%)
		  adding: zip3.txt (stored 0%)
		  
		king@sysadminlabs:~$ ls
		file.zip  zip1.txt  zip2.txt  zip3.txt
		king@sysadminlabs:~$

		
