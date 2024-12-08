# traceroute
=============

traceroute - print the route packets trace to network host. A computer network diagnostic tool for displaying the route (path) and measuring transit delays of packets across an Internet Protocol (IP) network.


Traceroute sends a sequence of Internet Control Message Protocol (ICMP) packets addressed to a destination host. Determining the intermediate routers traversed involves adjusting the time-to-live (TTL) aka hop limit Internet Protocol parameter. Frequently starting with a value like 128 (Windows) or 64 (Linux), routers decrement this and discard a packet when the TTL value has reached zero, returning the ICMP error message ICMP Time Exceeded.

Traceroute works by increasing the TTL value of each successive set of packets sent. The first set of packets sent have a hop limit value of 1, expecting that they are not forwarded by the first router. The next set have a hop limit value of 2, so that the second router will send the error reply. This continues until the destination host receives the packets and returns an ICMP Echo Reply message.

Traceroute uses the returned ICMP messages to produce a list of routers that the packets have traversed. The timestamp values returned for each router along the path are the delay (aka latency) values, typically measured in milliseconds for each packet.

The originating host expects a reply within a specified number of seconds. If a packet is not acknowledged within the expected timeout, an asterisk is displayed.

On Unix-like operating systems, the traceroute utility by default uses User Datagram Protocol (UDP) datagrams with destination port numbers from 33434 to 33534. 


Traceroute is essentially the same as Tracepath except that by default, it will only give the TTL value.


Traceroute  tracks the route packets taken from an IP network on their way to a given host. It utilizes the IP  protocol's  time  to  live  (TTL)  field  and  attempts  to  elicit  an  ICMP TIME_EXCEEDED response from each gateway along the path to the host.
       
A disadvantage of traceroute is that the path of the packets sent may change during the tracing exercise. Also, the number of packets that are generated are two times the number of each hop. The time it takes to duplicate each hop with each successive packet can take an excessive amount of time and packets to complete.



**Common Usage :**  ::

	# traceroute <ip or domainname>

**Examples :**

.. code-block:: bash

	king@sysadminlabs:~# traceroute google.com
	traceroute to google.com (74.125.236.84), 30 hops max, 60 byte packets
	 1  192.168.138.111 (192.168.138.111)  2.361 ms  4.570 ms  4.745 ms
	 2  ABTS-AP-Dynamic-001.128.169.122.airtelbroadband.in (122.169.128.1)  18.704 ms  19.120 ms  20.520 ms
	 3  ABTS-AP-Static-254.240.169.122.airtelbroadband.in (122.169.240.254)  21.996 ms  22.797 ms  24.266 ms
	 4  125.16.7.125 (125.16.7.125)  25.731 ms  26.529 ms  27.690 ms
	 5  125.21.167.70 (125.21.167.70)  52.650 ms  53.515 ms  54.622 ms
	 6  72.14.216.229 (72.14.216.229)  55.834 ms  40.892 ms  42.106 ms
	 7  66.249.94.168 (66.249.94.168)  53.712 ms  56.008 ms  56.590 ms
	 8  209.85.249.235 (209.85.249.235)  46.762 ms  47.569 ms  49.843 ms
	 9  74.125.236.84 (74.125.236.84)  61.498 ms  62.914 ms  63.494 ms



*In this example, the -w (wait x seconds) in this case three seconds, the -q (only 1 query instead of 3, note only 1 column for time), and the -m (maximum hop count, so if we were to use traceroute on an IP address for long routes  we might require more than 16 hops).*

.. code-block:: bash

	king@sysadminlabs:~#  traceroute -w 3 -q 1 -m 16 example.com
	traceroute to example.com (192.0.32.10), 16 hops max, 60 byte packets
	 1  192.168.138.111 (192.168.138.111)  2.815 ms
	 2  ABTS-AP-Dynamic-001.128.169.122.airtelbroadband.in (122.169.128.1)  34.666 ms
	 3  ABTS-AP-Static-241.240.169.122.airtelbroadband.in (122.169.240.241)  19.379 ms
	 4  125.16.7.125 (125.16.7.125)  20.314 ms
	 5  AES-Static-122.36.144.59.airtel.in (59.144.36.122)  250.325 ms
	 6  icann.org.any2ix.coresite.com (206.223.143.5)  253.619 ms
	 7  www.example.com (192.0.32.10)  254.480 ms


Note:

By default traceroute uses UDP packets sent to each intermediate device and increments the time-to-live (ttl) of the packet until the UDP reply comes back as a port unreachable.

There are a few flags to note: !H, !N, or !P (host, network or protocol unreachable), !S (source route failed), !F (fragmentation needed), !X (communication administratively prohibited), !V (host precedence violation), !C (precedence cutoff in effect), or ! (ICMP unreachable code ).

Traceroute can now use ICMP, TCP, TCP connection attempt, UDP, and raw packets at the IP layer if you are brave. This is to help alleviate the issue of a firewall getting in the way. A firewall may permit port 80 (http), so you could force traceroute to use TCP at port 80 for your traceroute request.


