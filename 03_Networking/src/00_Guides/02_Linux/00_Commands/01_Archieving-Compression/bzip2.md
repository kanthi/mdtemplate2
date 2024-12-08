# bzip2
-------

### bzip2 and bunzip2 are similar to "gzip"/"gunzip" but with a different compression method. Compression is generally better but slower than "gzip".

*Common Usage :*

	$ bzip2 <archive file>

	$ bzip2 file.tar

	$ bunzip2 file.tar.bz2

**Examples :**



		king@sysadminlabs:~$ ls
		imp.txt  pop3.php  temp1.txt  temp2.txt  temp.txt

		king@sysadminlabs:~$ bzip2 temp1.txt temp2.txt temp.txt

		king@sysadminlabs:~$ ls
		imp.txt  pop3.php  temp1.txt.bz2  temp2.txt.bz2  temp.txt.bz2

		king@sysadminlabs:~$ ls
		imp.txt  pop3.php  temp1.txt  temp2.txt  temp.txt

		king@sysadminlabs:~$ tar -cfv temp1.txt temp2.txt temp.txt

		king@sysadminlabs:~$ ls
		imp.txt  pop3.php  temp1.txt  temp2.txt  temp.txt  v

		king@sysadminlabs:~$ tar -cvf temp1.txt temp2.txt temp.txt
		temp2.txt
		temp.txt

		king@sysadminlabs:~$ ls
		imp.txt  pop3.php  temp1.txt  temp2.txt  temp.txt  v
		king@sysadminlabs:~$ tar -cvf temp.tar temp1.txt temp2.txt temp.txt
		temp1.txt
		temp2.txt
		temp.txt

		king@sysadminlabs:~$ ls
		imp.txt  pop3.php  temp1.txt  temp2.txt  temp.tar  temp.txt  v

		king@sysadminlabs:~$ bzip2 temp.tar

		king@sysadminlabs:~$ ls
		imp.txt  pop3.php  temp1.txt  temp2.txt  temp.tar.bz2  temp.txt  v

		king@sysadminlabs:~$ bunzip2 temp.tar.bz2

		king@sysadminlabs:~$ ls
		imp.txt  pop3.php  temp1.txt  temp2.txt  temp.tar  temp.txt  v

