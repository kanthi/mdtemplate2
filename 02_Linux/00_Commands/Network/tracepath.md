# tracepath
===========

tracepath,  tracepath6  - traces path to a network host discovering MTU  along this path

It traces path to destination discovering MTU along this path.  It uses UDP  port  port or some random port.  It is similar to traceroute, only
does not not require superuser privileges and has no fancy options. tracepath6 is good replacement for traceroute6 and classic  example  of
application  of  Linux  error  queues.  The situation with tracepath is worse, because commercial IP routers do not return  enough  information
in  icmp  error  messages.  Probably, it will change, when they will be updated.  For now it uses Van Jacobson’s trick, sweeping a range of UDP
ports to maintain trace history.


**Common Usage :**  ::

	# tracepath <domainname>

**Examples :**
 
.. code-block:: bash


	king@sysadminlabs:~# tracepath google.com
	 1:  king-linux-laptop.local                               0.137ms pmtu 1500
	 1:  192.168.138.111                                       3.910ms asymm  2 
	 1:  192.168.138.111                                       1.688ms asymm  2 
	 2:  no reply
	 3:  no reply
	 4:  no reply
	 5:  no reply
	 6:  no reply
	 7:  no reply
	 8:  no reply
	 9:  no reply
	10:  no reply
	11:  no reply
	12:  no reply
	13:  no reply
	14:  no reply
	15:  no reply
	16:  no reply
	17:  no reply
	18:  no reply
	19:  no reply
	20:  no reply
	21:  no reply
	22:  no reply
	23:  no reply
	24:  no reply
	25:  no reply
	26:  no reply
	27:  no reply
	28:  no reply
	29:  no reply
	30:  no reply
	31:  no reply
	     Too many hops: pmtu 1500
	     Resume: pmtu 1500 


Note:

You should kill the program with a CTRL-C when asterisks ("*") begin to appear, as the final stage of the trace-route is failing. This means that the server in the last stage failed to respond.
