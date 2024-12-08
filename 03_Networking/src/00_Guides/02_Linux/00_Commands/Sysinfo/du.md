# du
==========

estimate or check for file space usage


**Common Usage :**  ::

	$  du -sh ( The -s flag instructs the du command to display only the sum total disk usage, -h is for human readable format )


**Examples :**


.. code-block:: bash
	
	king@sysadminlabs:~$ du -sh 
	39G	.

.. code-block:: bash

	king@sysadminlabs:~$ du -sh ~
	39G	/home/king

.. code-block:: bash

	king@sysadminlabs:~$ du -h /var/log/  --exclude=apache2*
	4.0K	/var/log/unattended-upgrades
	8.0K	/var/log/cups
	148K	/var/log/apt
	4.0K	/var/log/speech-dispatcher
	12K	/var/log/fsck
	204K	/var/log/gdm
	4.0K	/var/log/remote-tty/out
	8.0K	/var/log/remote-tty
	4.0K	/var/log/apparmor
	4.0K	/var/log/news
	4.0K	/var/log/samba/cores/winbindd
	8.0K	/var/log/samba/cores
	48K	/var/log/samba
	344K	/var/log/installer/cdebconf
	1.8M	/var/log/installer
	256K	/var/log/ConsoleKit
	16K	/var/log/dist-upgrade
	13M	/var/log/