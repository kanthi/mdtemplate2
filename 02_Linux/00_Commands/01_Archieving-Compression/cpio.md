# cpio

Used for creating archives


When creating an archive, a list of files is fed to its standard-input (rather than specifying the files on the commandline).

This file-list is typically created by ls, find or locate and then piped directly to cpio; but it can also first be filtered/edited with commands like *grep, sed, sort and others.* 

A (pre-edited) list stored as a file can also be used, by using cat to feed the pipeline or simply by redirecting the shell's standard-input (<).)

cpio -o - Copy-Out mode: Files are copied out from the filesystem to create an archive. Usually the archive is created by simply using the shell to redirect cpio's output to a file (with >).

cpio -i - Copy-In mode: Files from an existing archive are restored/extracted, and copied back in to the filesystem.

cpio -p - Pass-Through mode: cpio is used to copy files from one location in the directory-tree to another, without an actual archiving being made.

In addition comes:

cpio -t - List archive: The content of an archive is listed without extracting it.

cpio -tv - Here the verbose-option (-v) will cause a "long listing", with permissions, size and ownership.



**Common Usage :**  ::



**Examples :**


.. code-block:: bash

	king@sysadminlabs:~# ls *.doc | cpio -ov > docs.cpio
	test1.doc
	test2.doc
	test.doc
	1 block

	king@sysadminlabs:~# ls
	docs.cpio  test1.doc  test1.txt  test2.doc  test.doc

*Using find and fgrep to create an archive of just the txt-files containing the word wiki (any case):
For fgrep the option -i means "ignore case", and the option -l cause it to just list the filenames of files matching the pattern.*

.. code-block:: bash

	king@sysadminlabs:~#  find . -name "*.txt" -exec fgrep -l -i "wiki" {} \; | cpio -ov > wiki.cpio
	./test1.txt
	1 block

