# tcpdump
==========

cli packet analyzer tool for linux

**Common Usage :**  ::


	# tcpdump  ( captures all interfaces )

	# tcpdump -i eth0   ( captures only interface eth0 )

**Examples :**
 
.. code-block:: bash

	king@sysadminlabs:~# tcpdump -i eth1
	tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
	listening on eth1, link-type EN10MB (Ethernet), capture size 65535 bytes
	17:35:03.091063 CDPv1, ttl: 180s, Device-ID 'RACK1_SW3_2650_172.16.15.4(001279-1b3600)', length 136
	17:35:03.964184 IP king-linux-laptop.local.60206 > jabber-01-01-snc2.facebook.com.xmpp-client: Flags [P.], seq 841646439:841646572, ack 4090471311, win 501, options [nop,nop,TS val 2908209 ecr 2232535122], length 133
	17:35:03.964260 IP king-linux-laptop.local.36054 > iy-in-f125.1e100.net.xmpp-client: Flags [P.], seq 1160772541:1160772738, ack 2976022799, win 593, options [nop,nop,TS val 2908209 ecr 1231090682], length 197
	17:35:03.965143 IP king-linux-laptop.local.38042 > 192.168.138.111.domain: 26579+ PTR? 105.181.63.69.in-addr.arpa. (44)
	17:35:03.970949 IP 192.168.138.111.domain > king-linux-laptop.local.38042: 26579 1/0/0 PTR jabber-01-01-snc2.facebook.com. (88)
	17:35:03.971142 IP king-linux-laptop.local.47219 > 192.168.138.111.domain: 41647+ PTR? 1.138.168.192.in-addr.arpa. (44)
	17:35:03.976339 IP 192.168.138.111.domain > king-linux-laptop.local.47219: 41647 NXDomain* 0/0/0 (44)
	17:35:04.077048 IP6 fe80::f24d:a2ff:fea2:a49a.mdns > ff02::fb.mdns: 0 PTR (QM)? 1.138.168.192.in-addr.arpa. (44)
	17:35:04.077098 IP king-linux-laptop.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)? 1.138.168.192.in-addr.arpa. (44)
	17:35:04.077219 IP king-linux-laptop.local.mdns > 224.0.0.251.mdns: 0*- [0q] 1/0/0 (Cache flush) PTR king-linux-laptop.local. (75)
	17:35:04.077585 IP king-linux-laptop.local.33028 > 192.168.138.111.domain: 38045+ PTR? 125.225.85.209.in-addr.arpa. (45)
	17:35:04.082829 IP 192.168.138.111.domain > king-linux-laptop.local.33028: 38045 1/0/0 PTR iy-in-f125.1e100.net. (79)
	17:35:04.083029 IP king-linux-laptop.local.59656 > 192.168.138.111.domain: 50842+ PTR? 111.138.168.192.in-addr.arpa. (46)
	17:35:04.089568 IP 192.168.138.111.domain > king-linux-laptop.local.59656: 50842 NXDomain* 0/0/0 (46)
	17:35:04.190244 IP6 fe80::f24d:a2ff:fea2:a49a.mdns > ff02::fb.mdns: 0 PTR (QM)? 111.138.168.192.in-addr.arpa. (46)
	17:35:04.190291 IP king-linux-laptop.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)? 111.138.168.192.in-addr.arpa. (46)
	17:35:04.208209 IP jabber-01-01-snc2.facebook.com.xmpp-client > king-linux-laptop.local.60206: Flags [P.], seq 1:91, ack 133, win 43, options [nop,nop,TS val 2232565133 ecr 2908209], length 90
	17:35:04.208247 IP king-linux-laptop.local.60206 > jabber-01-01-snc2.facebook.com.xmpp-client: Flags [.], ack 91, win 501, options [nop,nop,TS val 2908234 ecr 2232565133], length 0
	17:35:04.212238 IP iy-in-f125.1e100.net.xmpp-client > king-linux-laptop.local.36054: Flags [P.], seq 1:102, ack 197, win 1002, options [nop,nop,TS val 1231120692 ecr 2908209], length 101
	17:35:04.212263 IP king-linux-laptop.local.36054 > iy-in-f125.1e100.net.xmpp-client: Flags [.], ack 102, win 593, options [nop,nop,TS val 2908234 ecr 1231120692], length 0
	17:35:04.315850 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	17:35:05.190857 IP6 fe80::f24d:a2ff:fea2:a49a.mdns > ff02::fb.mdns: 0 PTR (QM)? 111.138.168.192.in-addr.arpa. (46)
	17:35:05.190898 IP king-linux-laptop.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)? 111.138.168.192.in-addr.arpa. (46)
	17:35:06.316801 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	17:35:07.193395 IP6 fe80::f24d:a2ff:fea2:a49a.mdns > ff02::fb.mdns: 0 PTR (QM)? 111.138.168.192.in-addr.arpa. (46)
	17:35:07.193435 IP king-linux-laptop.local.mdns > 224.0.0.251.mdns: 0 PTR (QM)? 111.138.168.192.in-addr.arpa. (46)
	17:35:07.544607 IP king-linux-laptop.local.42689 > 2.20.248.74.www: Flags [.], ack 1880124163, win 501, options [nop,nop,TS val 2908568 ecr 2932076029], length 0

	27 packets captured
	62 packets received by filter
	16 packets dropped by kernel




*Capture the packets and write into a file*

.. code-block:: bash


	king@sysadminlabs:~# tcpdump -w cap.pcap -i eth1
	tcpdump: listening on eth1, link-type EN10MB (Ethernet), capture size 65535 bytes
	^C61 packets captured
	61 packets received by filter
	0 packets dropped by kernel

	king@sysadminlabs:~# ls
	cap.pcap



*Read from the file cap.pcap (-tttt  Print a timestamp in default format proceeded by date on each dump line.)*

.. code-block:: bash

	king@sysadminlabs:~# tcpdump -tttt -r cap.pcap 
	reading from file cap.pcap, link-type EN10MB (Ethernet)
	2011-05-16 17:43:10.255642 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	2011-05-16 17:43:11.916286 IP iy-in-f125.1e100.net.xmpp-client > king-linux-laptop.local.36054: Flags [P.], seq 2976058469:2976059002, ack 1160778740, win 1002, options [nop,nop,TS val 1231608419 ecr 2956247], length 533
	2011-05-16 17:43:11.916336 IP king-linux-laptop.local.36054 > iy-in-f125.1e100.net.xmpp-client: Flags [.], ack 533, win 593, options [nop,nop,TS val 2957005 ecr 1231608419], length 0
	2011-05-16 17:43:12.256589 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	2011-05-16 17:43:14.255127 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	2011-05-16 17:43:16.254909 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43


*Capture packets without name resolution for the ip:*

.. code-block:: bash

	king@sysadminlabs:~# tcpdump -n -i eth1
	tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
	listening on eth1, link-type EN10MB (Ethernet), capture size 65535 bytes
	17:45:07.756694 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 00:18:8b:8d:69:fa, length 300
	17:45:08.241043 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	17:45:10.240829 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	17:45:10.756400 IP 0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 00:18:8b:8d:69:fa, length 300
	17:45:12.250862 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	17:45:14.240244 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	17:45:14.824654 IP 192.168.138.1.46616 > 74.125.71.125.5222: Flags [.], ack 3506069563, win 501, options [nop,nop,TS val 2969296 ecr 1946186464], length 0
	17:45:14.916370 IP 74.125.71.125.5222 > 192.168.138.1.46616: Flags [.], ack 1, win 827, options [nop,nop,TS val 1946231586 ecr 2942232], length 0
	17:45:16.240055 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	^C
	9 packets captured
	9 packets received by filter
	0 packets dropped by kernel


*Capture packets with proper readable timestamp using tcpdump -tttt*

.. code-block:: bash

	king@sysadminlabs:~# tcpdump -n -tttt -i eth1
	tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
	listening on eth1, link-type EN10MB (Ethernet), capture size 65535 bytes
	2011-05-16 17:47:38.222467 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	2011-05-16 17:47:40.222205 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	2011-05-16 17:47:42.223150 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	2011-05-16 17:47:42.564453 IP 50.17.148.162.22 > 192.168.138.1.42324: Flags [P.], seq 2051012584:2051012652, ack 300558931, win 409, options [nop,nop,TS val 451555611 ecr 2978036], length 68
	2011-05-16 17:47:42.564755 IP 192.168.138.1.42324 > 50.17.148.162.22: Flags [P.], seq 1:37, ack 68, win 501, options [nop,nop,TS val 2984070 ecr 451555611], length 36
	2011-05-16 17:47:42.836338 IP 50.17.148.162.22 > 192.168.138.1.42324: Flags [.], ack 37, win 409, options [nop,nop,TS val 451555638 ecr 2984070], length 0
	2011-05-16 17:47:44.221679 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	^C
	7 packets captured
	7 packets received by filter
	0 packets dropped by kernel
	king@sysadminlabs:~# 


*Capture packets longer than N bytes*

.. code-block:: bash

	king@sysadminlabs:~# tcpdump -nv -tttt -i eth1 greater 1024
	tcpdump: listening on eth1, link-type EN10MB (Ethernet), capture size 65535 bytes
	2011-05-16 17:57:49.552293 IP (tos 0x0, ttl 64, id 8536, offset 0, flags [DF], proto TCP (6), length 1196)
	    192.168.138.1.40237 > 192.168.138.30.22: Flags [P.], cksum 0x9a0f (incorrect -> 0xdc5f), seq 2234864883:2234866027, ack 1926333335, win 128, options [nop,nop,TS val 3044768 ecr 2474884], length 1144
	^C
	1 packets captured
	1 packets received by filter
	0 packets dropped by kernel
	king@sysadminlabs:~# 


*Capture packets less than N bytes*

.. code-block:: bash

	king@sysadminlabs:~# tcpdump -nv -tttt -i eth1 less 1024
	tcpdump: listening on eth1, link-type EN10MB (Ethernet), capture size 65535 bytes
	2011-05-16 17:57:49.552293 IP (tos 0x0, ttl 64, id 8536, offset 0, flags [DF], proto TCP (6), length 1196)
	    192.168.138.1.40237 > 192.168.138.30.22: Flags [P.], cksum 0x9a0f (incorrect -> 0xdc5f), seq 2234864883:2234866027, ack 1926333335, win 128, options [nop,nop,TS val 3044768 ecr 2474884], length 1144
	^C
	1 packets captured
	1 packets received by filter
	0 packets dropped by kernel


*Receive only the packets of a specific protocol type*


	king@sysadminlabs:~# tcpdump -i eth1 tcp
	tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
	listening on eth1, link-type EN10MB (Ethernet), capture size 65535 bytes
	18:02:34.379786 IP kwaimuk.canonical.com.https > king-linux-laptop.local.57752: Flags [P.], seq 2302358726:2302358832, ack 641857996, win 71, options [nop,nop,TS val 59757211 ecr 3071876], length 106
	18:02:34.379833 IP king-linux-laptop.local.57752 > kwaimuk.canonical.com.https: Flags [.], ack 106, win 159, options [nop,nop,TS val 3073251 ecr 59757211], length 0
	18:02:34.385492 IP king-linux-laptop.local.57752 > kwaimuk.canonical.com.https: Flags [P.], seq 1:75, ack 106, win 159, options [nop,nop,TS val 3073252 ecr 59757211], length 74
	18:02:34.669210 IP king-linux-laptop.local.60206 > jabber-01-01-snc2.facebook.com.xmpp-client: Flags [P.], seq 841655226:841655375, ack 4090476425, win 501, options [nop,nop,TS val 3073280 ecr 2234185928], length 149
	18:02:34.669280 IP king-linux-laptop.local.36054 > iy-in-f125.1e100.net.xmpp-client: Flags [P.], seq 1160787877:1160788138, ack 2976101170, win 593, options [nop,nop,TS val 3073280 ecr 1232741452], length 261
	18:02:34.727717 IP kwaimuk.canonical.com.https > king-linux-laptop.local.57752: Flags [.], ack 75, win 71, options [nop,nop,TS val 59757245 ecr 3073252], length 0
	18:02:34.912613 IP jabber-01-01-snc2.facebook.com.xmpp-client > king-linux-laptop.local.60206: Flags [P.], seq 1:91, ack 149, win 43, options [nop,nop,TS val 2234215952 ecr 3073280], length 90
	18:02:34.912661 IP king-linux-laptop.local.60206 > jabber-01-01-snc2.facebook.com.xmpp-client: Flags [.], ack 91, win 501, options [nop,nop,TS val 3073304 ecr 2234215952], length 0
	18:02:34.917668 IP iy-in-f125.1e100.net.xmpp-client > king-linux-laptop.local.36054: Flags [P.], seq 1:102, ack 261, win 1002, options [nop,nop,TS val 1232771476 ecr 3073280], length 101
	18:02:34.917698 IP king-linux-laptop.local.36054 > iy-in-f125.1e100.net.xmpp-client: Flags [.], ack 102, win 593, options [nop,nop,TS val 3073305 ecr 1232771476], length 0
	^C
	10 packets captured
	10 packets received by filter
	0 packets dropped by kernel


*Capture packets based on port number*

.. code-block:: bash

	king@sysadminlabs:~# tcpdump -i eth1 port 22
	tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
	listening on eth1, link-type EN10MB (Ethernet), capture size 65535 bytes
	18:04:34.080702 IP king-linux-laptop.local.50478 > 192.168.138.150.ssh: Flags [S], seq 4278587504, win 14600, options [mss 1460,sackOK,TS val 3085221 ecr 0,nop,wscale 7], length 0
	18:04:34.080851 IP 192.168.138.150.ssh > king-linux-laptop.local.50478: Flags [S.], seq 4209762694, ack 4278587505, win 5792, options [mss 1460,sackOK,TS val 122986538 ecr 3085221,nop,wscale 7], length 0
	18:04:34.080891 IP king-linux-laptop.local.50478 > 192.168.138.150.ssh: Flags [.], ack 1, win 115, options [nop,nop,TS val 3085221 ecr 122986538], length 0
	18:04:34.085328 IP 192.168.138.150.ssh > king-linux-laptop.local.50478: Flags [P.], seq 1:40, ack 1, win 46, options [nop,nop,TS val 122986538 ecr 3085221], length 39
	18:04:34.085364 IP king-linux-laptop.local.50478 > 192.168.138.150.ssh: Flags [.], ack 40, win 115, options [nop,nop,TS val 3085222 ecr 122986538], length 0
	18:04:34.085456 IP king-linux-laptop.local.50478 > 192.168.138.150.ssh: Flags [P.], seq 1:40, ack 40, win 115, options [nop,nop,TS val 3085222 ecr 122986538], length 39
	18:04:34.085585 IP 192.168.138.150.ssh > king-linux-laptop.local.50478: Flags [.], ack 40, win 46, options [nop,nop,TS val 122986538 ecr 3085222], length 0
	18:04:34.085785 IP king-linux-laptop.local.50478 > 192.168.138.150.ssh: Flags [P.], seq 40:1184, ack 40, win 115, options [nop,nop,TS val 3085222 ecr 122986538], length 1144
	18:04:34.086155 IP 192.168.138.150.ssh > king-linux-laptop.local.50478: Flags [.], ack 1184, win 68, options [nop,nop,TS val 122986539 ecr 3085222], length 0
	18:04:34.087776 IP 192.168.138.150.ssh > king-linux-laptop.local.50478: Flags [P.], seq 40:824, ack 1184, win 68, options [nop,nop,TS val 122986539 ecr 3085222], length 784
	18:04:34.087879 IP king-linux-laptop.local.50478 > 192.168.138.150.ssh: Flags [P.], seq 1184:1208, ack 824, win 127, options [nop,nop,TS val 3085222 ecr 122986539], length 24
	18:04:34.089357 IP 192.168.138.150.ssh > king-linux-laptop.local.50478: Flags [P.], seq 824:976, ack 1208, win 68, options [nop,nop,TS val 122986539 ecr 3085222], length 152
	18:04:34.090538 IP king-linux-laptop.local.50478 > 192.168.138.150.ssh: Flags [P.], seq 1208:1352, ack 976, win 139, options [nop,nop,TS val 3085222 ecr 122986539], length 144
	18:04:34.095109 IP 192.168.138.150.ssh > king-linux-laptop.local.50478: Flags [P.], seq 976:1696, ack 1352, win 86, options [nop,nop,TS val 122986539 ecr 3085222], length 720
	18:04:34.096976 IP king-linux-laptop.local.50478 > 192.168.138.150.ssh: Flags [P.], seq 1352:1368, ack 1696, win 151, options [nop,nop,TS val 3085223 ecr 122986539], length 16
	18:04:34.136156 IP 192.168.138.150.ssh > king-linux-laptop.local.50478: Flags [.], ack 1368, win 86, options [nop,nop,TS val 122986544 ecr 3085223], length 0
	18:04:34.136193 IP king-linux-laptop.local.50478 > 192.168.138.150.ssh: Flags [P.], seq 1368:1416, ack 1696, win 151, options [nop,nop,TS val 3085227 ecr 122986544], length 48
	18:04:34.136355 IP 192.168.138.150.ssh > king-linux-laptop.local.50478: Flags [.], ack 1416, win 86, options [nop,nop,TS val 122986544 ecr 3085227], length 0
	18:04:34.136370 IP 192.168.138.150.ssh > king-linux-laptop.local.50478: Flags [P.], seq 1696:1744, ack 1416, win 86, options [nop,nop,TS val 122986544 ecr 3085227], length 48
	18:04:34.136470 IP king-linux-laptop.local.50478 > 192.168.138.150.ssh: Flags [P.], seq 1416:1480, ack 1744, win 151, options [nop,nop,TS val 3085227 ecr 122986544], length 64
	18:04:34.144556 IP 192.168.138.150.ssh > king-linux-laptop.local.50478: Flags [P.], seq 1744:1808, ack 1480, win 86, options [nop,nop,TS val 122986544 ecr 3085227], length 64
	18:04:34.184646 IP king-linux-laptop.local.50478 > 192.168.138.150.ssh: Flags [.], ack 1808, win 151, options [nop,nop,TS val 3085232 ecr 122986544], length 0
	18:04:40.595054 IP king-linux-laptop.local.50478 > 192.168.138.150.ssh: Flags [F.], seq 1480, ack 1808, win 151, options [nop,nop,TS val 3085873 ecr 122986544], length 0
	18:04:40.596200 IP 192.168.138.150.ssh > king-linux-laptop.local.50478: Flags [F.], seq 1808, ack 1481, win 86, options [nop,nop,TS val 122987189 ecr 3085873], length 0
	18:04:40.596240 IP king-linux-laptop.local.50478 > 192.168.138.150.ssh: Flags [.], ack 1809, win 151, options [nop,nop,TS val 3085873 ecr 122987189], length 0
	^C
	25 packets captured
	25 packets received by filter
	0 packets dropped by kernel


*Capture packets for particular destination IP and Port*

.. code-block:: bash

	king@sysadminlabs:~# tcpdump -i eth1 dst google.com and  port 80
	tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
	listening on eth1, link-type EN10MB (Ethernet), capture size 65535 bytes
	18:08:26.654154 IP king-linux-laptop.local.40208 > 74.125.236.51.www: Flags [P.], seq 3533224422:3533225413, ack 396957030, win 501, options [nop,nop,TS val 3108478 ecr 2739501970], length 991
	18:08:26.740558 IP king-linux-laptop.local.40208 > 74.125.236.51.www: Flags [.], ack 2777, win 501, options [nop,nop,TS val 3108487 ecr 2739507360], length 0
	18:08:26.742759 IP king-linux-laptop.local.40208 > 74.125.236.51.www: Flags [.], ack 5135, win 501, options [nop,nop,TS val 3108487 ecr 2739507360], length 0
	18:08:26.743261 IP king-linux-laptop.local.40208 > 74.125.236.51.www: Flags [.], ack 8545, win 501, options [nop,nop,TS val 3108487 ecr 2739507360], length 0
	18:08:26.764382 IP king-linux-laptop.local.40208 > 74.125.236.51.www: Flags [P.], seq 991:2001, ack 8545, win 501, options [nop,nop,TS val 3108489 ecr 2739507360], length 1010
	18:08:26.764465 IP king-linux-laptop.local.40207 > 74.125.236.51.www: Flags [P.], seq 3538262057:3538263075, ack 399013650, win 440, options [nop,nop,TS val 3108489 ecr 2739501768], length 1018
	18:08:26.765714 IP king-linux-laptop.local.40209 > 74.125.236.51.www: Flags [P.], seq 3539152683:3539153963, ack 403462933, win 115, options [nop,nop,TS val 3108490 ecr 2739501228], length 1280
	18:08:26.789552 IP king-linux-laptop.local.40209 > 74.125.236.51.www: Flags [.], ack 137, win 123, options [nop,nop,TS val 3108492 ecr 2739507411], length 0
	18:08:26.803641 IP king-linux-laptop.local.40209 > 74.125.236.51.www: Flags [P.], seq 1280:2302, ack 137, win 123, options [nop,nop,TS val 3108493 ecr 2739507411], length 1022
	18:08:26.815529 IP king-linux-laptop.local.40210 > 74.125.236.51.www: Flags [P.], seq 3527772583:3527773625, ack 400537406, win 115, options [nop,nop,TS val 3108495 ecr 2739501229], length 1042
	18:08:26.860657 IP king-linux-laptop.local.40207 > 74.125.236.51.www: Flags [.], ack 147, win 462, options [nop,nop,TS val 3108499 ecr 2739507477], length 0
	18:08:26.894607 IP king-linux-laptop.local.40208 > 74.125.236.51.www: Flags [.], ack 8691, win 501, options [nop,nop,TS val 3108503 ecr 2739507477], length 0
	18:08:26.895592 IP king-linux-laptop.local.40209 > 74.125.236.51.www: Flags [P.], seq 2302:3499, ack 249, win 123, options [nop,nop,TS val 3108503 ecr 2739507501], length 1197
	18:08:27.044627 IP king-linux-laptop.local.40209 > 74.125.236.51.www: Flags [.], ack 464, win 131, options [nop,nop,TS val 3108518 ecr 2739507628], length 0
	18:08:27.059349 IP king-linux-laptop.local.40210 > 74.125.236.51.www: Flags [.], ack 147, win 123, options [nop,nop,TS val 3108519 ecr 2739507681], length 0
	^C
	15 packets captured
	21 packets received by filter
	0 packets dropped by kernel


*tcpdump Filter Packets – Capture all the packets other than arp and rarp*

.. code-block:: bash

	king@sysadminlabs:~# tcpdump -i eth1 not arp and not rarp
	tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
	listening on eth1, link-type EN10MB (Ethernet), capture size 65535 bytes
	18:10:52.049696 STP 802.1w, Rapid STP, Flags [Forward, Agreement], bridge-id 8000.00:12:79:1b:36:00.8023, length 43
	^C18:10:52.227962 IP 192.168.0.5.netbios-dgm > 192.168.0.127.netbios-dgm: NBT UDP PACKET(138)

	2 packets captured
	63 packets received by filter
	31 packets dropped by kernel

	 
