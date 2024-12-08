# tar

tar (tape archive) command bundles a bunch of files together and creates an archive (commonly called a tar file or tarball) on a tape, disk drive, or floppy disk. The original files are not deleted after being copied to the tar file.

**Common Usage :**  ::

		$ tar cfv <filename> <folder or files to be tared>

		In these examples, the c, v, and f flags mean create a new archive, be verbose (list files being archived), and write the archive to a file. You can also create tar files on tape drives or floppy disks, like this:

		$ tar xvf <filename>  ( to extract the tar file )



		$ tar zcvf <filename> <folder or files to be tared>

		To automatically compress the tar file as it is being created, add the z flag.

**Examples :**

.. code-block:: bash

	king@sysadminlabs:~# ls
	test1.doc  test1.txt  test1.xls  test2.doc  test2.txt  test2.xls

	king@sysadminlabs:~# tar cvf alldocs.tar *
	test1.doc
	test1.txt
	test1.xls
	test2.doc
	test2.txt
	test2.xls

	king@sysadminlabs:~# ls
	alldocs.tar  test1.doc  test1.txt  test1.xls  test2.doc  test2.txt  test2.xls

.. code-block:: bash

	king@sysadminlabs:~# ls
	alldocs.tar

	king@sysadminlabs:~# tar xvf alldocs.tar 
	test1.doc
	test1.txt
	test1.xls
	test2.doc
	test2.txt
	test2.xls

	king@sysadminlabs:~# ls
	alldocs.tar  test1.doc  test1.txt  test1.xls  test2.doc  test2.txt  test2.xls

.. code-block:: bash

	king@sysadminlabs:~# ls
	test1.doc  test1.txt  test1.xls  test2.doc  test2.txt  test2.xls

	king@sysadminlabs:~# tar zcvf docs.tar.gz * 
	test1.doc
	test1.txt
	test1.xls
	test2.doc
	test2.txt
	test2.xls

	king@sysadminlabs:~# ls
	docs.tar.gz  test1.doc  test1.txt  test1.xls  test2.doc  test2.txt  test2.xls


.. code-block:: bash

		king@sysadminlabs:~# ls
		test1.doc  test1.txt  test1.xls  test2.doc  test2.txt  test2.xls

		king@sysadminlabs:~# tar cjvf docs.tar.bz2 *
		test1.doc
		test1.txt
		test1.xls
		test2.doc
		test2.txt
		test2.xls

		king@sysadminlabs:~# ls
		docs.tar.bz2  test1.doc  test1.txt  test1.xls  test2.doc  test2.txt  test2.xls

.. code-block:: bash

		king@sysadminlabs:~# ls
		docs.tar.bz2

		king@sysadminlabs:~# tar -jxvf docs.tar.bz2 
		test1.doc
		test1.txt
		test1.xls
		test2.doc
		test2.txt
		test2.xls

		king@sysadminlabs:~# ls
		docs.tar.bz2  test1.doc  test1.txt  test1.xls  test2.doc  test2.txt  test2.xls


