# man

format and display the on-line manual pages


**Common Usage :** ::

	$ man iptables


**Examples :**

.. code-block:: bash

	king@sysadminlabs$ man iptables

	IPTABLES(8)                     iptables 1.4.4                     IPTABLES(8)

	NAME
	       iptables - administration tool for IPv4 packet filtering and NAT

	SYNOPSIS
	       iptables [-t table] {-A|-D} chain rule-specification

	       iptables [-t table] -I chain [rulenum] rule-specification

	       iptables [-t table] -R chain rulenum rule-specification

	       iptables [-t table] -D chain rulenum

	       iptables [-t table] -S [chain [rulenum]]

	       iptables [-t table] {-F|-L|-Z} [chain] [options...]

	       iptables [-t table] -N chain

	       iptables [-t table] -X [chain]

	       iptables [-t table] -P chain target