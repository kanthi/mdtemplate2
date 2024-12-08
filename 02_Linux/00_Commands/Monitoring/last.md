# last

Last searches back through the file /var/log/wtmp (or the file designated by the -f flag)
and  displays a list of all users logged in (and out) since that file was created.

**Common Usage :**  ::

		$ last


**Examples :**

.. code-block:: bash


	king@sysadminlabs:~$ last
	user1    pts/2        kings-imac.sysad Thu Oct 31 18:57 - 18:58  (00:00)
	king     pts/1        kings-imac.sysad Thu Oct 31 18:08   still logged in
	king     tty1                          Thu Oct 31 18:06   still logged in
	reboot   system boot  3.11.0-12-generi Sun Oct 27 14:18 - 19:33 (4+05:15)
	king     tty1                          Sun Oct 27 13:53 - down   (00:03)
	reboot   system boot  3.11.0-12-generi Sat Oct 26 13:36 - 13:57 (1+00:21)
	king     pts/0        kings-imac.sysad Sat Oct 26 13:35 - 13:35  (00:00)
	king     tty1                          Sat Oct 26 13:27 - down   (00:09)
	reboot   system boot  3.11.0-12-generi Sat Oct 26 13:26 - 13:36  (00:09)
	king     tty1                          Sat Oct 26 13:24 - down   (00:01)
	reboot   system boot  3.11.0-12-generi Sat Oct 26 13:24 - 13:26  (00:01)

	wtmp begins Sat Oct 26 13:24:51 2013
	king@sysadminlabs:~$
