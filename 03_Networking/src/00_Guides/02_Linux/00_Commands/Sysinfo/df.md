# df
==========

df - ( disk free ) is the standard unix utility command 


**Common Usage :**  ::


	$ df

	$ df -h

	$ df -k

	$ df -ha


**Examples:**


.. code-block:: bash

	king@sysadminlabs:~$ df 
	Filesystem           1K-blocks      Used Available Use% Mounted on
	/dev/sda7             61296668  46538500  11644392  80% /
	none                   1919360       288   1919072   1% /dev
	none                   1926216      2384   1923832   1% /dev/shm
	none                   1926216       220   1925996   1% /var/run
	none                   1926216         0   1926216   0% /var/lock
	/dev/sda6             24030076   4839140  17970280  22% /king
	/dev/sda1             51199996  38104904  13095092  75% /media/C8BCA0D1BCA0BAF8
	/dev/sda2            102399996  35947452  66452544  36% /media/Data

	 
	
.. code-block:: bash

	king@sysadminlabs:~$ df -h --total
	Filesystem            Size  Used Avail Use% Mounted on
	/dev/sda7              59G   45G   12G  80% /
	none                  1.9G  288K  1.9G   1% /dev
	none                  1.9G  2.4M  1.9G   1% /dev/shm
	none                  1.9G  220K  1.9G   1% /var/run
	none                  1.9G     0  1.9G   0% /var/lock
	/dev/sda6              23G  4.7G   18G  22% /king
	/dev/sda1              49G   37G   13G  75% /media/C8BCA0D1BCA0BAF8
	/dev/sda2              98G   35G   64G  36% /media/Data
	total                 236G  120G  112G  52%


.. code-block:: bash

	king@sysadminlabs:~$ df -ha
	Filesystem            Size  Used Avail Use% Mounted on
	/dev/sda7              59G   45G   11G  81% /
	proc                     0     0     0   -  /proc
	none                     0     0     0   -  /sys
	fusectl                  0     0     0   -  /sys/fs/fuse/connections
	none                     0     0     0   -  /sys/kernel/debug
	none                     0     0     0   -  /sys/kernel/security
	none                  1.9G  288K  1.9G   1% /dev
	none                     0     0     0   -  /dev/pts
	none                  1.9G  568K  1.9G   1% /dev/shm
	none                  1.9G  208K  1.9G   1% /var/run
	none                  1.9G     0  1.9G   0% /var/lock
	none                   59G   45G   11G  81% /var/lib/ureadahead/debugfs
	/dev/sda6              23G  4.7G   18G  22% /king
	binfmt_misc              0     0     0   -  /proc/sys/fs/binfmt_misc
	gvfs-fuse-daemon         0     0     0   -  /home/king/.gvfs
	/dev/sda1              49G   37G   13G  75% /media/C8BCA0D1BCA0BAF8

.. code-block:: bash

	king@sysadminlabs:~$ du -h /home/king/Downloads/ | grep "[0-9]M" | sort -n -r 
	771M	/home/king/Downloads/old1
	5.3M	/home/king/Downloads/html5_template
	4.6M	/home/king/Downloads/fonts
	3.9M	/home/king/Downloads/wp-themes
	1.8M	/home/king/Downloads/Open_Compute_Project_Chassis_CAD_v1.0
