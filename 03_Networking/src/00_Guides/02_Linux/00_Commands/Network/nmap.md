# nmap
==============

nmap - Network exploration tool and security / port scanner

Nmap (“Network Mapper”) is an open source tool for network exploration and security auditing. It was designed to rapidly scan large networks, although it works fine against single hosts. Nmap uses raw IP packets in novel ways to determine what hosts are available on the network, what services (application name and version) those hosts are offering, what operating systems (and OS versions) they are running, what type of packet filters/firewalls are in use, and dozens of other characteristics. While Nmap is commonly used for security audits, many systems and network administrators find it useful for routine tasks such as network inventory, managing service upgrade schedules, and monitoring host or service       uptime.



**Common Usage :**  ::

	# nmap <ip>

	# nmap -A localhost


**Examples :**

.. code-block:: bash


	king@sysadminlabs:~# nmap localhost

	Starting Nmap 5.21 ( http://nmap.org ) at 2011-05-17 10:26 IST
	Nmap scan report for localhost (127.0.0.1)
	Host is up (0.0000080s latency).
	Not shown: 995 closed ports
	PORT     STATE SERVICE
	22/tcp   open  ssh
	80/tcp   open  http
	631/tcp  open  ipp
	3306/tcp open  mysql
	5432/tcp open  postgresql

	Nmap done: 1 IP address (1 host up) scanned in 0.12 seconds



*A typical Nmap scan is shown in Example 1. The only Nmap arguments used in this example are -A, to enable OS and version detection, script scanning, and traceroute; -T4 for faster execution; and then the target hostnames*

.. code-block:: bash


	king@sysadminlabs:~# nmap -A -T4 localhost

	Starting Nmap 5.21 ( http://nmap.org ) at 2011-05-17 10:25 IST
	Nmap scan report for localhost (127.0.0.1)
	Host is up (0.000040s latency).
	Not shown: 995 closed ports
	PORT     STATE SERVICE    VERSION
	22/tcp   open  ssh        OpenSSH 5.8p1 Debian 1ubuntu3 (protocol 2.0)
	| ssh-hostkey: 1024 d0:55:75:29:ea:fb:2a:42:ac:2a:85:a6:94:98:d4:00 (DSA)
	|_2048 bf:21:e3:55:c7:40:c6:ca:87:f3:c6:1d:08:2d:55:29 (RSA)
	80/tcp   open  http       Apache httpd 2.2.17 ((Ubuntu))
	|_html-title: Site doesn't have a title (text/html).
	631/tcp  open  ipp        CUPS 1.4
	3306/tcp open  mysql      MySQL 5.1.54-1ubuntu4
	| mysql-info: Protocol: 10
	| Version: 5.1.54-1ubuntu4
	| Thread ID: 50
	| Some Capabilities: Long Passwords, Connect with DB, Compress, ODBC, Transactions, Secure Connection
	| Status: Autocommit
	|_Salt: {qGK$p+#ilb&6y#?Uk;%
	5432/tcp open  postgresql PostgreSQL DB
	Device type: general purpose
	Running: Linux 2.6.X
	OS details: Linux 2.6.31 - 2.6.32
	Network Distance: 0 hops
	Service Info: OS: Linux

	OS and Service detection performed. Please report any incorrect results at http://nmap.org/submit/ .
	Nmap done: 1 IP address (1 host up) scanned in 8.08 seconds



*To check what OS is used by the target server*

.. code-block:: bash

	king@sysadminlabs:~# nmap -O localhost

	Starting Nmap 5.21 ( http://nmap.org ) at 2011-05-17 11:02 IST
	Nmap scan report for localhost (127.0.0.1)
	Host is up (0.000041s latency).
	Not shown: 995 closed ports
	PORT     STATE SERVICE
	22/tcp   open  ssh
	80/tcp   open  http
	631/tcp  open  ipp
	3306/tcp open  mysql
	5432/tcp open  postgresql
	Device type: general purpose
	Running: Linux 2.6.X
	OS details: Linux 2.6.31 - 2.6.32
	Network Distance: 0 hops

	OS detection performed. Please report any incorrect results at http://nmap.org/submit/ .
	Nmap done: 1 IP address (1 host up) scanned in 1.62 seconds



.. code-block:: bash


	king@sysadminlabs:~# nmap -vv localhost

	Starting Nmap 5.21 ( http://nmap.org ) at 2011-05-17 11:08 IST
	Initiating SYN Stealth Scan at 11:08
	Scanning localhost (127.0.0.1) [1000 ports]
	Discovered open port 80/tcp on 127.0.0.1
	Discovered open port 3306/tcp on 127.0.0.1
	Discovered open port 22/tcp on 127.0.0.1
	Discovered open port 631/tcp on 127.0.0.1
	Discovered open port 5432/tcp on 127.0.0.1
	Completed SYN Stealth Scan at 11:08, 0.07s elapsed (1000 total ports)
	Nmap scan report for localhost (127.0.0.1)
	Host is up (0.0000080s latency).
	Scanned at 2011-05-17 11:08:26 IST for 0s
	Not shown: 995 closed ports
	PORT     STATE SERVICE
	22/tcp   open  ssh
	80/tcp   open  http
	631/tcp  open  ipp
	3306/tcp open  mysql
	5432/tcp open  postgresql

	Read data files from: /usr/share/nmap
	Nmap done: 1 IP address (1 host up) scanned in 0.14 seconds
	           Raw packets sent: 1000 (44.000KB) | Rcvd: 2005 (84.220KB)


*Service Scan:*

.. code-block:: bash


**Network Scan** 


.. code-block:: bash

	king@sysadminlabs:~# nmap -sP 192.168.138.0/24

	Starting Nmap 5.21 ( http://nmap.org ) at 2011-05-17 11:13 IST
	Nmap scan report for 192.168.138.1
	Host is up.
	Nmap scan report for 192.168.138.20
	Host is up (0.00017s latency).
	MAC Address: 00:50:BA:88:6B:94 (D-link)
	Nmap scan report for 192.168.138.30
	Host is up (0.00026s latency).
	MAC Address: 00:22:19:BA:D6:0C (Dell)
	Nmap scan report for 192.168.138.111
	Host is up (0.00030s latency).
	MAC Address: 00:13:10:AB:57:66 (Cisco-Linksys)
	Nmap scan report for 192.168.138.150
	Host is up (0.00024s latency).
	MAC Address: 00:05:5D:42:05:70 (D-Link Systems)
	Nmap done: 256 IP addresses (5 hosts up) scanned in 14.43 seconds

