# export

Set an environment variable

**Common Usage :**  ::


	$	export VAR=value


**Examples :**



.. code-block:: bash


	king@sysadminlabs:~$ echo $PATH
	/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
	
	king@sysadminlabs:~$ export PATH=$PATH:/tmp/path
	
	king@sysadminlabs:~$ echo $PATH
	/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/tmp/path
	





.. note::

	You need to add export statements to ~/.bash_profile or ~/.profile or /etc/profile file. 
	This will export variables permanently:




*add as follows to your .bashrc file:*

.. code-block:: bash

	echo 'export PATH=$PATH:/tmp/path' >> ~/.bashrc

