# ps
=====

report a snapshot of the current processes.

**Common Usage :**

	$ ps

	$ ps -aux

**Examples :**

*Show list of processes owned by a specific user*

.. code-block:: bash

	king@sysadminlabs:~# ps ux
	USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
	root         1  0.0  0.0  24140  2216 ?        Ss   May16   0:01 /sbin/init
	root         2  0.0  0.0      0     0 ?        S    May16   0:00 [kthreadd]
	root         3  0.0  0.0      0     0 ?        S    May16   0:09 [ksoftirqd/0]
	root         6  0.0  0.0      0     0 ?        S    May16   0:00 [migration/0]
	root        17  0.0  0.0      0     0 ?        S<   May16   0:00 [cpuset]
	root        18  0.0  0.0      0     0 ?        S<   May16   0:00 [khelper]
	root        19  0.0  0.0      0     0 ?        S<   May16   0:00 [netns]
	root        21  0.0  0.0      0     0 ?        S    May16   0:00 [sync_supers]
	root        22  0.0  0.0      0     0 ?        S    May16   0:00 [bdi-default]
	root        23  0.0  0.0      0     0 ?        S<   May16   0:00 [kintegrityd]
	root        24  0.0  0.0      0     0 ?        S<   May16   0:00 [kblockd]
	root        25  0.0  0.0      0     0 ?        S<   May16   0:00 [kacpid]
	root        26  0.0  0.0      0     0 ?        S<   May16   0:00 [kacpi_notify]


	or


	king@sysadminlabs:~# ps U root
	  PID TTY      STAT   TIME COMMAND
	    1 ?        Ss     0:01 /sbin/init
	    2 ?        S      0:00 [kthreadd]
	    3 ?        S      0:09 [ksoftirqd/0]
	    6 ?        S      0:00 [migration/0]
	   17 ?        S<     0:00 [cpuset]
	   18 ?        S<     0:00 [khelper]
	   19 ?        S<     0:00 [netns]
	   21 ?        S      0:00 [sync_supers]
	   22 ?        S      0:00 [bdi-default]
	   23 ?        S<     0:00 [kintegrityd]
	   24 ?        S<     0:00 [kblockd]
	   25 ?        S<     0:00 [kacpid]
	   26 ?        S<     0:00 [kacpi_notify]
	   27 ?        S<     0:00 [kacpi_hotplug]
	   28 ?        S<     0:00 [ata_sff]
	   29 ?        S      0:00 [khubd]
	   30 ?        S<     0:00 [md]
	   33 ?        S      0:00 [khungtaskd]
	   34 ?        S      0:06 [kswapd0]
	   35 ?        SN     0:00 [ksmd]
	   36 ?        S      0:00 [fsnotify_mark]
	   37 ?        S<     0:00 [aio]
	   38 ?        S      0:00 [ecryptfs-kthrea]
	   39 ?        S<     0:00 [crypto]
	   43 ?        S<     0:00 [kthrotld]


*show all processes*

.. code-block:: bash

	king@sysadminlabs:~# ps -aux
	Warning: bad ps syntax, perhaps a bogus '-'? See http://procps.sf.net/faq.html
	USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
	root         1  0.0  0.0  24140  2216 ?        Ss   May16   0:01 /sbin/init
	postgres  1044  0.0  0.1 103832  6612 ?        S    May16   0:00 /usr/lib/postgresql/8.4/bin/postgres -D /var/lib/postgresql/8.4/main -c config_file=/
	nobody    1113  0.0  0.0  21688  1096 ?        S    May16   0:00 dnsmasq --strict-order --bind-interfaces --pid-file=/var/run/libvirt/network/default.
	postgres  1155  0.0  0.0 103832  1664 ?        Ss   May16   0:06 postgres: writer process                                                            
	postgres  1156  0.0  0.0 103832  1420 ?        Ss   May16   0:04 postgres: wal writer process                                                        
	postgres  1157  0.0  0.0 103964  1820 ?        Ss   May16   0:01 postgres: autovacuum launcher process                                               
	postgres  1158  0.0  0.0  75380  1508 ?        Ss   May16   0:01 postgres: stats collector process                                                   
	root      1205  0.0  0.1  81552  3904 ?        Ssl  May16   0:00 gdm-binary
	root      1212  0.0  0.1 125412  4064 ?        Sl   May16   0:01 /usr/sbin/console-kit-daemon --no-daemon
	root      1287  0.0  0.1  96176  4504 ?        Sl   May16   0:00 /usr/lib/gdm/gdm-simple-slave --display-id /org/gnome/DisplayManager/Display1
	root      1290  0.0  0.0      0     0 ?        S<   May16   0:00 [hd-audio0]
	root      1336  0.0  0.0  75512  2792 ?        Ss   May16   0:00 /usr/sbin/cupsd -F


*list the details of a single process*

.. code-block:: bash

		king@sysadminlabs:~# ps -aux | grep firefox
		Warning: bad ps syntax, perhaps a bogus '-'? See http://procps.sf.net/faq.html
		king      2190  0.4  4.5 891604 176044 ?       Sl   May16   7:13 /usr/lib/firefox-4.0.1/firefox-bin
		king      3468  0.0  0.5 238368 19696 ?        Sl   May16   0:08 /usr/lib/firefox-4.0.1/plugin-container /var/lib/flashplugin-installer/npwrapper.libflashplayer.so -omnijar /usr/lib/firefox-4.0.1/omni.jar 2190 true plugin
		root     20622  0.0  0.0  11516  1060 pts/5    S+   12:53   0:00 grep --color=auto firefox


*List the Process based on the UID and Commands (ps -u, ps -C)*

.. code-block:: bash

	king@sysadminlabs:~#  ps -f -u www-data
	UID        PID  PPID  C STIME TTY          TIME CMD
	www-data  1549  1535  0 May16 ?        00:00:00 /usr/sbin/apache2 -k start
	www-data  1550  1535  0 May16 ?        00:00:00 /usr/sbin/apache2 -k start
	www-data  1551  1535  0 May16 ?        00:00:00 /usr/sbin/apache2 -k start
	www-data  1552  1535  0 May16 ?        00:00:00 /usr/sbin/apache2 -k start
	www-data  1553  1535  0 May16 ?        00:00:00 /usr/sbin/apache2 -k start
	www-data 18638  1535  0 10:25 ?        00:00:00 /usr/sbin/apache2 -k start


*Instead of using grep along with PS commad we can use -C to list out the process running with particular command.*

.. code-block:: bash

	king@sysadminlabs:~# ps -f -C applet.py
	UID        PID  PPID  C STIME TTY          TIME CMD
	king      2173  1811  0 May16 ?        00:00:11 /usr/bin/python /usr/share/system-config-printer/applet.py

	or

	king@sysadminlabs:~# ps -aux | grep  applet.py
	Warning: bad ps syntax, perhaps a bogus '-'? See http://procps.sf.net/faq.html
	king      2173  0.0  0.6 236092 24228 ?        S    May16   0:11 /usr/bin/python /usr/share/system-config-printer/applet.py
	root     20652  0.0  0.0  11516  1060 pts/5    S+   12:57   0:00 grep --color=auto applet.py


*# ps -auxw
# The ‘a’ argument means “show all processes”, not just my processes. (There’s a bit more to it than that, but this is usually close enough.)
# The ‘u’ argument adds “user information” columns to the output. (Try your ps command without the ‘u’, and you’ll see a major difference in the columns that are displayed.)
# The ‘x’ lifts the BSD-style “must have a tty” restriction, meaning it will show processes that are not associated with a terminal (tty)>
# The ‘w’ means “wide output”. Use this option twice for unlimited width.*

.. code-block:: bash


		king@sysadminlabs:~# ps -auxw
		Warning: bad ps syntax, perhaps a bogus '-'? See http://procps.sf.net/faq.html
		USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
		root     17920  0.0  0.0  21604   876 ?        S<   10:13   0:00 udevd --daemon
		root     17921  0.0  0.0  21604   876 ?        S<   10:13   0:00 udevd --daemon
		king     18395  0.3  1.5 936160 61564 ?        Sl   10:19   0:37 /opt/google/chrome/chrome --type=renderer --lang=en-US --force-fieldtest=CacheSize/Ca
		www-data 18638  0.0  0.1 155532  6484 ?        S    10:25   0:00 /usr/sbin/apache2 -k start
		king     18694  0.0  0.1  26532  5528 pts/13   Ss+  10:33   0:00 /bin/bash
		king     18770  0.0  0.1  26532  5528 pts/14   Ss+  10:35   0:00 /bin/bash
		king     18891  0.0  0.8 878748 32340 ?        SNl  10:38   0:00 /opt/google/chrome/chrome --type=renderer --lang=en-US --force-fieldtest=CacheSize/Ca
		king     18950  0.1  2.1 440196 84356 ?        Sl   10:44   0:11 /usr/lib/opera/opera
		king     19039  0.1  4.0 531100 156668 ?       Sl   10:45   0:11 evince /home/king/.opera/temporary_downloads/CS_Intro_Book.pdf
		king     19043  0.0  0.0 122452  2852 ?        Sl   10:45   0:00 


*Shows a list of users that currently running processes are executing as.*

.. code-block:: bash

	king@sysadminlabs:~# ps axgu | cut -f1 -d' ' | sort -u
	102
	avahi
	daemon
	king
	mysql
	nobody
	postgres
	root
	rtkit
	syslog
	USER
	www-data


*processes per user counter*

.. code-block:: bash

		king@sysadminlabs:~# ps hax -o user | sort | uniq -c
	      2 avahi
	      1 daemon
	    121 king
	      1 messagebus
	      1 mysql
	      1 nobody
	      5 postgres
	    109 root
	      1 rtkit
	      1 syslog
	      6 www-data

*Sort all running processes by their memory & CPU usage*

.. code-block:: bash


		king@sysadminlabs:~# ps aux --sort=%mem,%cpu
		USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
		king     18891  0.0  0.8 878748 32092 ?        SNl  10:38   0:00 /opt/google/chrome/chrome --type=renderer --lang=en-US --force-fieldtest=CacheSize/Ca
		king      1886  0.0  0.9 407080 35744 ?        SLl  May16   0:15 nm-applet --sm-disable
		king      2171  0.0  0.9 424412 38156 ?        SLl  May16   0:44 /usr/bin/python /usr/bin/gwibber-service
		king     19441  0.0  0.9 890104 38340 ?        SNl  11:30   0:04 /opt/google/chrome/chrome --type=renderer --lang=en-US --force-fieldtest=CacheSize/Ca
		king      4282  0.0  1.1 501168 43876 ?        Sl   May16   1:16 /usr/bin/python /usr/bin/terminator
		king     20777  0.3  1.1 886916 44064 ?        SNl  13:12   0:02 /opt/google/chrome/chrome --type=renderer --lang=en-US --force-fieldtest=CacheSize/Ca
		king     20684  0.1  1.1 889236 45120 ?        SNl  13:03   0:02 /opt/google/chrome/chrome --type=renderer --lang=en-US --force-fieldtest=CacheSize/Ca
		king     20774  0.9  1.1 891700 45988 ?        Sl   13:11   0:07 /opt/google/chrome/chrome --type=renderer --lang=en-US --force-fieldtest=CacheSize/Ca

*Print the Process Tree*

.. code-block:: bash

		king@sysadminlabs:~# ps auxf
		USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND


		root      1535  0.0  0.2 155532  7828 ?        Ss   May16   0:01 /usr/sbin/apache2 -k start
		www-data  1549  0.0  0.1 155532  6468 ?        S    May16   0:00  \_ /usr/sbin/apache2 -k start
		www-data  1550  0.0  0.1 155532  6480 ?        S    May16   0:00  \_ /usr/sbin/apache2 -k start
		www-data  1551  0.0  0.1 155532  6468 ?        S    May16   0:00  \_ /usr/sbin/apache2 -k start
		www-data  1552  0.0  0.1 155532  6480 ?        S    May16   0:00  \_ /usr/sbin/apache2 -k start
		www-data  1553  0.0  0.1 155532  5648 ?        S    May16   0:00  \_ /usr/sbin/apache2 -k start
		www-data 18638  0.0  0.1 155532  6484 ?        S    10:25   0:00  \_ /usr/sbin/apache2 -k start
		rtkit     1677  0.0  0.0  37628  1316 ?        SNl  May16   0:00 /usr/lib/rtkit/rtkit-daemon
		king      3698  0.3  6.3 745040 244128 ?       Sl   May16   5:02 gedit
		king      3702  0.0  0.0  14612   832 ?        S    May16   0:00  \_ gnome-pty-helper
		king      3703  0.0  0.1  26524  5520 pts/0    Ss+  May16   0:00  \_ /bin/bash
		king      3761  0.0  0.1  26524  5524 pts/1    Ss+  May16   0:00  \_ /bin/bash
		king      4155  0.0  0.1  26524  5520 pts/2    Ss+  May16   0:00  \_ /bin/bash
		king      8206  0.0  0.1  26508  5516 pts/6    Ss+  May16   0:00  \_ /bin/bash
		king      8469  0.0  0.1  26508  5520 pts/7    Ss+  May16   0:00  \_ /bin/bash
		king     10125  0.0  0.1  26508  5520 pts/8    Ss+  May16   0:00  \_ /bin/bash
		king     10799  0.0  0.1  26508  5512 pts/9    Ss+  May16   0:00  \_ /bin/bash
		king     11561  0.0  0.1  26508  5520 pts/10   Ss+  May16   0:00  \_ /bin/bash
		king     12908  0.0  0.1  26508  5512 pts/11   Ss+  May16   0:00  \_ /bin/bash
		king     16414  0.0  0.1  26524  5524 pts/12   Ss+  04:41   0:00  \_ /bin/bash
		king     18694  0.0  0.1  26532  5528 pts/13   Ss+  10:33   0:00  \_ /bin/bash
		king     18770  0.0  0.1  26532  5528 pts/14   Ss+  10:35   0:00  \_ /bin/bash
		king     19086  0.0  0.1  26532  5528 pts/15   Ss+  10:50   0:00  \_ /bin/bash
		king     20311  0.0  0.1  26532  5528 pts/16   Ss+  12:32   0:00  \_ /bin/bash
		king      4282  0.0  1.1 500640 43356 ?        Sl   May16   1:13 /usr/bin/python /usr/bin/terminator
		king      4287  0.0  0.0  14612   852 ?        S    May16   0:00  \_ gnome-pty-helper
		king      4288  0.0  0.1  26508  5568 pts/3    Ss   May16   0:00  \_ /bin/bash
		root      5581  0.0  0.0  57704  1660 pts/3    S    May16   0:00  |   \_ su - root
		root      5589  0.0  0.1  26656  5760 pts/3    S+   May16   0:00  |       \_ -su
		king      7945  0.0  0.1  26508  5516 pts/5    Ss   May16   0:00  \_ /bin/bash
		root      7999  0.0  0.0  57704  1660 pts/5    S    May16   0:00      \_ su - root
		root      8008  0.0  0.1  26708  5804 pts/5    S    May16   0:01          \_ -su
		root     20889  0.0  0.0  20564  1444 pts/5    R+   13:22   0:00              \_ ps auxf
		king      7488  0.0  0.4 303200 15632 ?        S    May16   0:00 /usr/lib/gvfs/gvfsd-http --spawner :1.10 /org/gtk/gvfs/exec_spaw/2

*List all threads for a particular process (ps -L)*

.. code-block:: bash