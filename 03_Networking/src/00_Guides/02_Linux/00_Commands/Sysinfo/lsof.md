# lsof
======

list open files ( Very efficient tool useful in troubleshooting )

**Common Usage :** ::

	$ lsof -i   ( Show all connections/open files )


**Examples :**


.. code-block:: bash

	king@sysadminlabs:~# lsof -i
	COMMAND    PID  USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
	avahi-dae  804 avahi   13u  IPv4   2938      0t0  UDP *:mdns 
	avahi-dae  804 avahi   14u  IPv6   2939      0t0  UDP *:mdns 
	avahi-dae  804 avahi   15u  IPv4   2940      0t0  UDP *:33395 
	avahi-dae  804 avahi   16u  IPv6   2941      0t0  UDP *:48071 
	cupsd     1196  root    5u  IPv6  11659      0t0  TCP ip6-localhost:ipp (LISTEN)
	cupsd     1196  root    6u  IPv4  11660      0t0  TCP localhost:ipp (LISTEN)
	telepathy 4929  king    9u  IPv4 110982      0t0  TCP king-linux-laptop.local:35274->jabber-01-01-snc2.facebook.com:xmpp-client (ESTABLISHED)
	telepathy 4929  king   10u  IPv4 109265      0t0  TCP king-linux-laptop.local:51476->hx-in-f125.1e100.net:xmpp-client (ESTABLISHED)
	telepathy 4929  king   12u  IPv4 179368      0t0  TCP king-linux-laptop.local:49840->hx-in-f125.1e100.net:xmpp-client (ESTABLISHED)
	ssh       5917  king    3r  IPv4 135938      0t0  TCP king-linux-laptop.local:38144->192.168.138.150:ssh (ESTABLISHED)
	gvfsd-htt 6455  king   11u  IPv4 175000      0t0  TCP king-linux-laptop.local:43917->papeda.canonical.com:https (CLOSE_WAIT)
	gvfsd-htt 6455  king   12w  IPv4 174965      0t0  TCP king-linux-laptop.local:40706->sumac.canonical.com:www (CLOSE_WAIT)
	gvfsd-htt 6455  king   14u  IPv4 175333      0t0  TCP king-linux-laptop.local:36664->sumac.canonical.com:https (CLOSE_WAIT)
	gvfsd-htt 6455  king   23u  IPv4 165093      0t0  TCP king-linux-laptop.local:48824->barbadine.canonical.com:www (CLOSE_WAIT)
	gvfsd-htt 6455  king   24u  IPv4 165064      0t0  TCP king-linux-laptop.local:47295->sumac.canonical.com:www (CLOSE_WAIT)

*Show only TCP connection*

.. code-block:: bash

	king@sysadminlabs:~# lsof -iTCP
	COMMAND    PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
	cupsd     1196 root    5u  IPv6  11659      0t0  TCP ip6-localhost:ipp (LISTEN)
	cupsd     1196 root    6u  IPv4  11660      0t0  TCP localhost:ipp (LISTEN)
	telepathy 4929 king    9u  IPv4 110982      0t0  TCP king-linux-laptop.local:35274->jabber-01-01-snc2.facebook.com:xmpp-client (ESTABLISHED)
	telepathy 4929 king   10u  IPv4 109265      0t0  TCP king-linux-laptop.local:51476->hx-in-f125.1e100.net:xmpp-client (ESTABLISHED)
	telepathy 4929 king   12u  IPv4 179368      0t0  TCP king-linux-laptop.local:49840->hx-in-f125.1e100.net:xmpp-client (ESTABLISHED)	

*-i :port show all networking related to a given port*

.. code-block:: bash

	king@sysadminlabs:~# lsof -i :22
	COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
	ssh     5917 king    3r  IPv4 135938      0t0  TCP king-linux-laptop.local:38144->192.168.138.150:ssh (ESTABLISHED)

*To show connections to a specific host, use @host*

.. code-block:: bash

	king@sysadminlabs:~# lsof -i@192.168.138.150
	COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
	ssh     5917 king    3r  IPv4 135938      0t0  TCP king-linux-laptop.local:38144->192.168.138.150:ssh (ESTABLISHED)

*Show the connections based on the host and port using @host:port*

.. code-block:: bash

	king@sysadminlabs:~# lsof -i@192.168.138.150:22
	COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
	ssh     5917 king    3r  IPv4 135938      0t0  TCP king-linux-laptop.local:38144->192.168.138.150:ssh (ESTABLISHED)

.. code-block:: bash

*Grepping for "LISTEN" show what ports your system is waiting for connections on*	

.. code-block:: bash

	king@sysadminlabs:~# lsof -i| grep ESTABLISHED
	dropbox   1609     king   24u  IPv4  20195      0t0  TCP king-linux-laptop.local:36365->208.43.202.2-static.reverse.softlayer.com:www (ESTABLISHED)
	dropbox   1609     king   31u  IPv4  28999      0t0  TCP king-linux-laptop.local:33736->ec2-184-72-255-170.compute-1.amazonaws.com:https (ESTABLISHED)
	chrome    1870     king   93u  IPv4  19980      0t0  TCP king-linux-laptop.local:49025->hx-in-f125.1e100.net:xmpp-client (ESTABLISHED)
	ubuntuone 2058     king   38u  IPv4  20450      0t0  TCP king-linux-laptop.local:56587->ec2-174-129-241-144.compute-1.amazonaws.com:https (ESTABLISHED)
	firefox-b 2339     king   34r  IPv4  34002      0t0  TCP king-linux-laptop.local:45705->nx-in-f102.1e100.net:www (ESTABLISHED)
	firefox-b 2339     king   48u  IPv4  34005      0t0  TCP king-linux-laptop.local:39787->nx-in-f113.1e100.net:www (ESTABLISHED)

*To show what a given user has open using -u*

.. code-block:: bash
	
	king@sysadminlabs:~# lsof -u king
	COMMAND    PID USER   FD   TYPE             DEVICE SIZE/OFF       NODE NAME
	gnome-key 1462 king  cwd    DIR                8,7     4096          2 /
	gnome-key 1462 king  rtd    DIR                8,7     4096          2 /
	gnome-key 1462 king  txt    REG                8,7   935600    2752970 /usr/bin/gnome-keyring-daemon
	gnome-key 1462 king  mem    REG                8,7    31416    2758308 /usr/lib/gio/modules/libdconfsettings.so
	gnome-key 1462 king  mem    REG                8,7    51728    3149596 /lib/x86_64-linux-gnu/libnss_files-2.13.so
	gnome-key 1462 king  mem    REG                8,7    47680    3149600 /lib/x86_64-linux-gnu/libnss_nis-2.13.so
	gnome-key 1462 king  mem    REG                8,7    97248    3149590 /lib/x86_64-linux-gnu/libnsl-2.13.so
	gnome-key 1462 king  mem    REG                8,7    35712    3149592 /lib/x86_64-linux-gnu/libnss_compat-2.13.so
	gnome-key 1462 king  mem    REG                8,7  5205824    2759890 /usr/lib/locale/locale-archive
	gnome-key 1462 king  mem    REG                8,7    14280    3149584 /lib/x86_64-linux-gnu/libgpg-error.so.0.8.0
	gnome-key 1462 king  mem    REG                8,7   117544    3149621 /lib/x86_64-linux-gnu/libselinux.so.1
	gnome-key 1462 king  mem    REG                8,7    96816    3149633 /lib/x86_64-linux-gnu/libz.so.1.2.3.4
	gnome-key 1462 king  mem    REG                8,7   101192    3149617 /lib/x86_64-linux-gnu/libresolv-2.13.so
	gnome-key 1462 king  mem    REG                8,7    31752    3149619 /lib/x86_64-linux-gnu/librt-2.13.so
	gnome-key 1462 king  mem    REG                8,7   243800    3149612 /lib/x86_64-linux-gnu/libpcre.so.3.12.1
	gnome-key 1462 king  mem    REG                8,7    14696    3149560 /lib/x86_64-linux-gnu/libdl-2.13.so
	gnome-key 1462 king  mem    REG                8,7    14472    2761342 /usr/lib/x86_64-linux-gnu/libgmodule-2.0.so.0.2800.5
	gnome-key 1462 king  mem    REG                8,7  1638120    3149550 /lib/x86_64-linux-gnu/libc-2.13.so
	gnome-key 1462 king  mem    REG                8,7   975080    3149582 /lib/x86_64-linux-gnu/libglib-2.0.so.0.2800.5
	gnome-key 1462 king  mem    REG                8,7    18824    2761356 /usr/lib/x86_64-linux-gnu/libgthread-2.0.so.0.2800.5
	gnome-key 1462 king  mem    REG                8,7   327048    2761350 /usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.2800.5
	gnome-key 1462 king  mem    REG                8,7   499320    3149580 /lib/x86_64-linux-gnu/libgcrypt.so.11.6.0

	
*See what files and network connections a command is using with -c*

.. code-block:: bash
	
	king@sysadminlabs:~# lsof -c rsyslog
	COMMAND  PID   USER   FD   TYPE             DEVICE SIZE/OFF       NODE NAME
	rsyslogd 769 syslog  cwd    DIR                8,7     4096          2 /
	rsyslogd 769 syslog  rtd    DIR                8,7     4096          2 /
	rsyslogd 769 syslog  txt    REG                8,7   331192    2761619 /usr/sbin/rsyslogd
	rsyslogd 769 syslog  mem    REG                8,7    88384    3146567 /lib/x86_64-linux-gnu/libgcc_s.so.1
	rsyslogd 769 syslog  mem    REG                8,7    47680    3149600 /lib/x86_64-linux-gnu/libnss_nis-2.13.so
	rsyslogd 769 syslog  mem    REG                8,7    97248    3149590 /lib/x86_64-linux-gnu/libnsl-2.13.so
	rsyslogd 769 syslog  mem    REG                8,7    35712    3149592 /lib/x86_64-linux-gnu/libnss_compat-2.13.so
	rsyslogd 769 syslog  mem    REG                8,7    23544    2760768 /usr/lib/rsyslog/imklog.so
	rsyslogd 769 syslog  mem    REG                8,7    15312    2760772 /usr/lib/rsyslog/imuxsock.so
	rsyslogd 769 syslog  mem    REG                8,7    51728    3149596 /lib/x86_64-linux-gnu/libnss_files-2.13.so
	rsyslogd 769 syslog  mem    REG                8,7    23264    2760773 /usr/lib/rsyslog/lmnet.so
	rsyslogd 769 syslog  mem    REG                8,7  1638120    3149550 /lib/x86_64-linux-gnu/libc-2.13.so
	rsyslogd 769 syslog  mem    REG                8,7    31752    3149619 /lib/x86_64-linux-gnu/librt-2.13.so
	rsyslogd 769 syslog  mem    REG                8,7    14696    3149560 /lib/x86_64-linux-gnu/libdl-2.13.so
	rsyslogd 769 syslog  mem    REG                8,7   140254    3149615 /lib/x86_64-linux-gnu/libpthread-2.13.so
	rsyslogd 769 syslog  mem    REG                8,7    96816    3149633 /lib/x86_64-linux-gnu/libz.so.1.2.3.4
	rsyslogd 769 syslog  mem    REG                8,7   141088    3149537 /lib/x86_64-linux-gnu/ld-2.13.so
	rsyslogd 769 syslog    0u  unix 0xffff88010fa50000      0t0       2735 /dev/log
	rsyslogd 769 syslog    1w   REG                8,7    66055    2622220 /var/log/auth.log
	rsyslogd 769 syslog    3r   REG                0,3        0 4026532013 /proc/kmsg
	rsyslogd 769 syslog    4w   REG                8,7   151015    2622365 /var/log/syslog
	rsyslogd 769 syslog    5w   REG                8,7  1632914    2622366 /var/log/kern.log


*Pointing to a file shows what's interacting with that file*

.. code-block:: bash

	king@sysadminlabs:~# lsof /etc/passwd
	COMMAND    PID USER   FD   TYPE DEVICE SIZE/OFF    NODE NAME
	applet.py 2029 king   12w   REG    8,7     1524 1966275 /etc/passwd

*The -p switch lets you see what a given process ID has open, which is good
for learning more about unknown processes*

.. code-block:: bash

	king@sysadminlabs:~# lsof -p 2426
	COMMAND  PID USER   FD   TYPE             DEVICE SIZE/OFF    NODE NAME
	su      2426 root  cwd    DIR                8,7     4096 1179649 /root
	su      2426 root  rtd    DIR                8,7     4096       2 /
	su      2426 root  txt    REG                8,7    36832  524418 /bin/su
	su      2426 root  mem    REG                8,7    43472 3149490 /lib/security/pam_gnome_keyring.so
	su      2426 root  mem    REG                8,7    14472 2756270 /usr/lib/libck-connector.so.0.0.0
	su      2426 root  mem    REG                8,7    31752 3149619 /lib/x86_64-linux-gnu/librt-2.13.so
	su      2426 root  mem    REG                8,7   140254 3149615 /lib/x86_64-linux-gnu/libpthread-2.13.so
	su      2426 root  mem    REG                8,7   277304 3149559 /lib/x86_64-linux-gnu/libdbus-1.so.3.5.4
	su      2426 root  mem    REG                8,7    10296 3149488 /lib/security/pam_ck_connector.so
	su      2426 root  mem    REG                8,7     6040 3278142 /lib/x86_64-linux-gnu/security/pam_permit.so
	su      2426 root  mem    REG                8,7     5944 3278122 /lib/x86_64-linux-gnu/security/pam_deny.so
	su      2426 root  mem    REG                8,7    43296 3149556 /lib/x86_64-linux-gnu/libcrypt-2.13.so
	su      2426 root  mem    REG                8,7    56088 3278157 /lib/x86_64-linux-gnu/security/pam_unix.so
	su      2426 root  mem    REG                8,7    10240 3278137 /lib/x86_64-linux-gnu/security/pam_mail.so
	su      2426 root  mem    REG                8,7    14392 3278124 /lib/x86_64-linux-gnu/security/pam_env.so
	su      2426 root  mem    REG                8,7   117544 3149621 /lib/x86_64-linux-gnu/libselinux.so.1
	su      2426 root  mem    REG                8,7     6056 3278145 /lib/x86_64-linux-gnu/security/pam_rootok.so
	su      2426 root  mem    REG                8,7    51728 3149596 /lib/x86_64-linux-gnu/libnss_files-2.13.so
	su      2426 root  mem    REG                8,7    47680 3149600 /lib/x86_64-linux-gnu/libnss_nis-2.13.so
	su      2426 root  mem    REG                8,7    97248 3149590 /lib/x86_64-linux-gnu/libnsl-2.13.so
	su      2426 root  mem    REG                8,7    35712 3149592 /lib/x86_64-linux-gnu/libnss_compat-2.13.so
	su      2426 root  mem    REG                8,7  5205824 2759890 /usr/lib/locale/locale-archive
	su      2426 root  mem    REG                8,7    14696 3149560 /lib/x86_64-linux-gnu/libdl-2.13.so
	su      2426 root  mem    REG                8,7  1638120 3149550 /lib/x86_64-linux-gnu/libc-2.13.so
	su      2426 root  mem    REG                8,7    14528 3149607 /lib/x86_64-linux-gnu/libpam_misc.so.0.82.0
	su      2426 root  mem    REG                8,7    51712 3149605 /lib/x86_64-linux-gnu/libpam.so.0.82.3
	su      2426 root  mem    REG                8,7   141088 3149537 /lib/x86_64-linux-gnu/ld-2.13.so
	su      2426 root    0u   CHR              136,0      0t0       3 /dev/pts/0
	su      2426 root    1u   CHR              136,0      0t0       3 /dev/pts/0
	su      2426 root    2u   CHR              136,0      0t0       3 /dev/pts/0
	su      2426 root    4u  unix 0xffff8800a543fb80      0t0   32621 socket


*The -t option returns just a PID*

.. code-block:: bash

	king@sysadminlabs:~# lsof -t -c apache2
	997
	10001002
	1004

*Using-a allows you to combine search terms, so the query below says, "show me everything running as king connected to ip xx.xx.xx.xx"*

.. code-block:: bash

	king@sysadminlabs:~# lsof -a -u king  -i @208.43.202.2
	COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
	dropbox 1609 king   24u  IPv4  20195      0t0  TCP king-linux-laptop.local:36365->208.43.202.2-static.reverse.softlayer.com:www (ESTABLISHED)

