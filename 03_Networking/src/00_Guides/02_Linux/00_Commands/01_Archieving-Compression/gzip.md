# gzip 

file compression and decompression (  It is based on the DEFLATE algorithm, which is a combination of Lempel-Ziv (LZ77) and Huffman coding. )

**Common Usage :**  ::

	
	$ gzip <filename>

	$ gunzip <filename>

	$ gzip -c <filename> > filename.gz   ( -c  Write compressed file to stdout. Do not delete original file. )

**EXamples :**

.. code-block:: bash

		king@sysadminlabs:~# ls
		compression.txt

		king@sysadminlabs:~# gzip compression.txt 

		king@sysadminlabs:~# ls
		compression.txt.gz

		king@sysadminlabs:~# gunzip compression.txt.gz 

		king@sysadminlabs:~# ls
		compression.txt


.. code-block:: bash

		king@sysadminlabs:~# gzip -c compression.txt > compression.gz

		king@sysadminlabs:~# ls

		compression.gz  compression.txt