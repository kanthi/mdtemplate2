# dig
====

dig (domain information groper) is a flexible tool for interrogating DNS name servers. It
       performs DNS lookups and displays the answers that are returned from the name server(s) that
       were queried. Most DNS administrators use dig to troubleshoot DNS problems because of its
       flexibility, ease of use and clarity of output. Other lookup tools tend to have less
       functionality than dig.

Unless it is told to query a specific name server, dig will try each of the servers listed in
       /etc/resolv.conf.


**Common Usage :**  ::

	$  dig <domain name> <type>

	$  dig google.com 

	$ dig google.com MX

**Examples :**


.. code-block:: bash

	king@sysadminlabs:~# dig google.com

	; <<>> DiG 9.7.3 <<>> google.com
	;; global options: +cmd
	;; Got answer:
	;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 31979
	;; flags: qr rd ra; QUERY: 1, ANSWER: 5, AUTHORITY: 0, ADDITIONAL: 0

	;; QUESTION SECTION:
	;google.com.			IN	A

	;; ANSWER SECTION:
	google.com.		140	IN	A	74.125.236.49
	google.com.		140	IN	A	74.125.236.52
	google.com.		140	IN	A	74.125.236.51
	google.com.		140	IN	A	74.125.236.48
	google.com.		140	IN	A	74.125.236.50

	;; Query time: 5 msec
	;; SERVER: 192.168.138.111#53(192.168.138.111)
	;; WHEN: Mon May 16 14:19:08 2011
	;; MSG SIZE  rcvd: 108


.. code-block:: bash

	king@sysadminlabs:~# dig google.com MX

	; <<>> DiG 9.7.3 <<>> google.com MX
	;; global options: +cmd
	;; Got answer:
	;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 46120
	;; flags: qr rd ra; QUERY: 1, ANSWER: 5, AUTHORITY: 0, ADDITIONAL: 0

	;; QUESTION SECTION:
	;google.com.			IN	MX

	;; ANSWER SECTION:
	google.com.		523	IN	MX	20 alt1.aspmx.l.google.com.
	google.com.		523	IN	MX	50 alt4.aspmx.l.google.com.
	google.com.		523	IN	MX	10 aspmx.l.google.com.
	google.com.		523	IN	MX	40 alt3.aspmx.l.google.com.
	google.com.		523	IN	MX	30 alt2.aspmx.l.google.com.

	;; Query time: 5 msec
	;; SERVER: 192.168.138.111#53(192.168.138.111)
	;; WHEN: Mon May 16 14:20:40 2011
	;; MSG SIZE  rcvd: 136



With the +trace option, dig will provide output that allows you follow each successive hierarchical step that the query takes:



*You can use dig to query arbitrary DNS servers for records that they might not have been delegated authority, as in the following example:*

.. code-block:: bash

	king@sysadminlabs:~# dig @8.8.8.8 google.com

	; <<>> DiG 9.7.3 <<>> @8.8.8.8 google.com
	; (1 server found)
	;; global options: +cmd
	;; Got answer:
	;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 28011
	;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

	;; QUESTION SECTION:
	;google.com.			IN	A

	;; ANSWER SECTION:
	google.com.		300	IN	A	209.85.231.104

	;; Query time: 95 msec
	;; SERVER: 8.8.8.8#53(8.8.8.8)
	;; WHEN: Mon May 16 14:43:20 2011
	;; MSG SIZE  rcvd: 44



*Using Dig to Retrieve Different Record Types.* 

*Specify a different type of DNS record by adding that record type (e.g. AAAA, MX, TXT, or SRV) to the dig command.*


.. code-block:: bash

	king@sysadminlabs:~# dig mx @8.8.8.8 google.com

	; <<>> DiG 9.7.3 <<>> mx @8.8.8.8 google.com
	; (1 server found)
	;; global options: +cmd
	;; Got answer:
	;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 18850
	;; flags: qr rd ra; QUERY: 1, ANSWER: 5, AUTHORITY: 0, ADDITIONAL: 0

	;; QUESTION SECTION:
	;google.com.			IN	MX

	;; ANSWER SECTION:
	google.com.		600	IN	MX	40 alt3.aspmx.l.google.com.
	google.com.		600	IN	MX	30 alt2.aspmx.l.google.com.
	google.com.		600	IN	MX	50 alt4.aspmx.l.google.com.
	google.com.		600	IN	MX	20 alt1.aspmx.l.google.com.
	google.com.		600	IN	MX	10 aspmx.l.google.com.

	;; Query time: 90 msec
	;; SERVER: 8.8.8.8#53(8.8.8.8)
	;; WHEN: Mon May 16 14:45:12 2011
	;; MSG SIZE  rcvd: 136


.. code-block:: bash

	king@sysadminlabs:~# dig ns @8.8.8.8 google.com

	; <<>> DiG 9.7.3 <<>> ns @8.8.8.8 google.com
	; (1 server found)
	;; global options: +cmd
	;; Got answer:
	;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 34006
	;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 0

	;; QUESTION SECTION:
	;google.com.			IN	NS

	;; ANSWER SECTION:
	google.com.		86399	IN	NS	ns2.google.com.
	google.com.		86399	IN	NS	ns1.google.com.
	google.com.		86399	IN	NS	ns3.google.com.
	google.com.		86399	IN	NS	ns4.google.com.

	;; Query time: 123 msec
	;; SERVER: 8.8.8.8#53(8.8.8.8)
	;; WHEN: Mon May 16 14:45:19 2011
	;; MSG SIZE  rcvd: 100

.. code-block:: bash

	king@sysadminlabs:~# dig A @8.8.8.8 google.com

	; <<>> DiG 9.7.3 <<>> A @8.8.8.8 google.com
	; (1 server found)
	;; global options: +cmd
	;; Got answer:
	;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 49455
	;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

	;; QUESTION SECTION:
	;google.com.			IN	A

	;; ANSWER SECTION:
	google.com.		175	IN	A	209.85.231.104

	;; Query time: 92 msec
	;; SERVER: 8.8.8.8#53(8.8.8.8)
	;; WHEN: Mon May 16 14:45:26 2011
	;; MSG SIZE  rcvd: 44




*Using the +short modifier after the dig command abbreviates the output of dig*


.. code-block:: bash

	king@sysadminlabs:~# dig +short google.com
	74.125.236.50
	74.125.236.51
	74.125.236.48
	74.125.236.52
	74.125.236.49
	king@sysadminlabs:~# dig +short mx  google.com
	20 alt1.aspmx.l.google.com.
	50 alt4.aspmx.l.google.com.
	40 alt3.aspmx.l.google.com.
	10 aspmx.l.google.com.
	30 alt2.aspmx.l.google.com.
	king@sysadminlabs:~# dig +short ns  google.com
	ns2.google.com.
	ns1.google.com.
	ns3.google.com.
	ns4.google.com.

