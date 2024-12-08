# nslookup
===========

nslookup - is a network administration command-line tool for querying the Domain Name System (DNS) to obtain domain name or IP address mapping or for any other specific DNS record.name - short description

Nslookup has two modes:

    1.   interactive and non-interactive. Interactive mode allows the user to query name servers for information about various hosts and domains or to print a list of hosts in a domain.

    2.   Non-interactive mode is used to print just the name and requested information for a host or domain.


**Common Usage :**  ::

	# nslookup <domainname>


**Examples :**

.. code-block:: bash


	king@sysadminlabs:~# nslookup google.com
	Server:		192.168.138.111
	Address:	192.168.138.111#53

	Non-authoritative answer:
	Name:	google.com
	Address: 74.125.236.49
	Name:	google.com
	Address: 74.125.236.48
	Name:	google.com
	Address: 74.125.236.50
	Name:	google.com
	Address: 74.125.236.51
	Name:	google.com
	Address: 74.125.236.52



*The user executes the program without any arguments and issues parameters and queries at the program prompt ('>'):*

.. code-block:: bash

	king@sysadminlabs:~# nslookup
	> 
	> 
	> google.com
	Server:		192.168.138.111
	Address:	192.168.138.111#53

	Non-authoritative answer:
	Name:	google.com
	Address: 74.125.236.52
	Name:	google.com
	Address: 74.125.236.49
	Name:	google.com
	Address: 74.125.236.48
	Name:	google.com
	Address: 74.125.236.50
	Name:	google.com
	Address: 74.125.236.51
	> 
	> 
	> 
	> example.com
	Server:		192.168.138.111
	Address:	192.168.138.111#53

	Non-authoritative answer:
	Name:	example.com
	Address: 192.0.32.10



*In Interactive mode we have more options. I have typed set type=MX which tells nslookup to inform about Mail eXchange servers, instead of the A records.*

*You can use set type=NS or with any other of the valid records in DNS, such as CNAME, A, NS, MX, etc.*

.. code-block:: bash


	king@sysadminlabs:~# nslookup 
	> set type=mx
	> gmail.com
	Server:		192.168.138.111
	Address:	192.168.138.111#53

	Non-authoritative answer:
	gmail.com	mail exchanger = 40 alt4.gmail-smtp-in.l.google.com.
	gmail.com	mail exchanger = 30 alt3.gmail-smtp-in.l.google.com.
	gmail.com	mail exchanger = 20 alt2.gmail-smtp-in.l.google.com.
	gmail.com	mail exchanger = 5 gmail-smtp-in.l.google.com.
	gmail.com	mail exchanger = 10 alt1.gmail-smtp-in.l.google.com.

	Authoritative answers can be found from:
	>    
	> 
	> 
	> set type=NS
	> gmail.com
	Server:		192.168.138.111
	Address:	192.168.138.111#53

	Non-authoritative answer:
	gmail.com	nameserver = ns2.google.com.
	gmail.com	nameserver = ns1.google.com.
	gmail.com	nameserver = ns3.google.com.
	gmail.com	nameserver = ns4.google.com.

	Authoritative answers can be found from:
	> 



