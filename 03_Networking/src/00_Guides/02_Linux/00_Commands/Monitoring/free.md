# free
=========

Display amount of free and used memory in the system

**Common Usage :**  ::

		$ free -mh
		

**Examples :**

.. code-block:: bash

		ing@sysadminlabs:~$ free -m
		             total       used       free     shared    buffers     cached
		Mem:           329        234         95          0         12        149
		-/+ buffers/cache:         72        257
		Swap:          548          0        548
		king@sysadminlabs:~$ free -mh
		             total       used       free     shared    buffers     cached
		Mem:          329M       234M        95M         0B        12M       149M
		-/+ buffers/cache:        72M       257M
		Swap:         548M         0B       548M
		king@sysadminlabs:~$ free -h
		             total       used       free     shared    buffers     cached
		Mem:          329M       234M        95M         0B        12M       149M
		-/+ buffers/cache:        72M       257M
		Swap:         548M         0B       548M
		king@sysadminlabs:~$ free -hg
		             total       used       free     shared    buffers     cached
		Mem:          329M       233M        95M         0B        12M       149M
		-/+ buffers/cache:        72M       257M
		Swap:         548M         0B       548M
		
		
.. code-block:: bash

		king@sysadminlabs:~$ free -t
		             total       used       free     shared    buffers     cached
		Mem:        337164     239636      97528          0      12924     152912
		-/+ buffers/cache:      73800     263364
		Swap:       562172          0     562172
		Total:      899336     239636     659700
		
