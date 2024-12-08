# ping
==========

ping - send ICMP ECHO_REQUEST to network hosts. 


**Common Usage :**  ::

	# ping <ipaddress>

	# ping localhost

	# ping

**Examples :**

.. code-block:: bash

	king@sysadminlabs:~# ping -a 192.168.138.111
	PING 192.168.138.111 (192.168.138.111) 56(84) bytes of data.
	64 bytes from 192.168.138.111: icmp_req=1 ttl=150 time=0.485 ms
	64 bytes from 192.168.138.111: icmp_req=2 ttl=150 time=0.433 ms
	64 bytes from 192.168.138.111: icmp_req=3 ttl=150 time=0.499 ms
	64 bytes from 192.168.138.111: icmp_req=4 ttl=150 time=0.471 ms
	64 bytes from 192.168.138.111: icmp_req=5 ttl=150 time=0.461 ms
	64 bytes from 192.168.138.111: icmp_req=6 ttl=150 time=0.389 ms
	64 bytes from 192.168.138.111: icmp_req=7 ttl=150 time=0.448 ms
	64 bytes from 192.168.138.111: icmp_req=8 ttl=150 time=0.493 ms
	64 bytes from 192.168.138.111: icmp_req=9 ttl=150 time=0.463 ms
	^C
	--- 192.168.138.111 ping statistics ---
	9 packets transmitted, 9 received, 0% packet loss, time 7998ms
	rtt min/avg/max/mdev = 0.389/0.460/0.499/0.035 ms





shortest round trip time was 0.389 milliseconds
average round trip time was 0.460 milliseconds
maximum round trip time was 0.499 milliseconds
Standard deviation of the round-trip time was 0.035 milliseconds

NOTE: Round-trip delay time (rtt) - round-trip delay time (RTD) or round-trip time (RTT) is the length of time it takes for a signal to be sent plus the length of time it takes for an acknowledgment of that signal to be received.


Increase Ping Time Interval

.. code-block:: bash


	king@sysadminlabs:~# ping -i 5 192.168.138.111
	PING 192.168.138.111 (192.168.138.111) 56(84) bytes of data.
	64 bytes from 192.168.138.111: icmp_req=1 ttl=150 time=0.437 ms
	64 bytes from 192.168.138.111: icmp_req=2 ttl=150 time=0.409 ms
	64 bytes from 192.168.138.111: icmp_req=3 ttl=150 time=0.430 ms
	64 bytes from 192.168.138.111: icmp_req=4 ttl=150 time=0.432 ms
	64 bytes from 192.168.138.111: icmp_req=5 ttl=150 time=0.435 ms
	64 bytes from 192.168.138.111: icmp_req=6 ttl=150 time=0.430 ms
	^C
	--- 192.168.138.111 ping statistics ---
	6 packets transmitted, 6 received, 0% packet loss, time 24998ms
	rtt min/avg/max/mdev = 0.409/0.428/0.437/0.028 ms
	king@sysadminlabs:~# 



*Check whether the local network interface is up and running*

	king@sysadminlabs:~# ping 0
	PING 0 (127.0.0.1) 56(84) bytes of data.
	64 bytes from 127.0.0.1: icmp_req=1 ttl=64 time=0.070 ms
	64 bytes from 127.0.0.1: icmp_req=2 ttl=64 time=0.052 ms
	^C
	--- 0 ping statistics ---
	2 packets transmitted, 2 received, 0% packet loss, time 999ms
	rtt min/avg/max/mdev = 0.052/0.061/0.070/0.009 ms
	king@sysadminlabs:~# ping localhost
	PING localhost (127.0.0.1) 56(84) bytes of data.
	64 bytes from localhost (127.0.0.1): icmp_req=1 ttl=64 time=0.065 ms
	64 bytes from localhost (127.0.0.1): icmp_req=2 ttl=64 time=0.049 ms
	^C
	--- localhost ping statistics ---
	2 packets transmitted, 2 received, 0% packet loss, time 999ms
	rtt min/avg/max/mdev = 0.049/0.057/0.065/0.008 ms
	king@sysadminlabs:~# ping 127.0.0.1
	PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
	64 bytes from 127.0.0.1: icmp_req=1 ttl=64 time=0.069 ms
	64 bytes from 127.0.0.1: icmp_req=2 ttl=64 time=0.052 ms
	64 bytes from 127.0.0.1: icmp_req=3 ttl=64 time=0.057 ms
	^C
	--- 127.0.0.1 ping statistics ---
	3 packets transmitted, 3 received, 0% packet loss, time 1998ms
	rtt min/avg/max/mdev = 0.052/0.059/0.069/0.009 ms



*Send N packets and stop*

.. code-block:: bash

	king@sysadminlabs:~# ping -c 5 192.168.138.111
	PING 192.168.138.111 (192.168.138.111) 56(84) bytes of data.
	64 bytes from 192.168.138.111: icmp_req=1 ttl=150 time=0.447 ms
	64 bytes from 192.168.138.111: icmp_req=2 ttl=150 time=0.439 ms
	64 bytes from 192.168.138.111: icmp_req=3 ttl=150 time=0.447 ms
	64 bytes from 192.168.138.111: icmp_req=4 ttl=150 time=0.439 ms
	64 bytes from 192.168.138.111: icmp_req=5 ttl=150 time=0.437 ms

	--- 192.168.138.111 ping statistics ---
	5 packets transmitted, 5 received, 0% packet loss, time 3998ms
	rtt min/avg/max/mdev = 0.437/0.441/0.447/0.026 ms


*Ping tool Version*

.. code-block:: bash

	king@sysadminlabs:~# ping -V
	ping utility, iputils-sss20100418

