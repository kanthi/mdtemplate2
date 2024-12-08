# alias

 alias command in linux system is used to create shortname for frequently used long commands.

**Common Usage :**  ::

		$ alias <aliasname>='command-to-be-aliased'

		
**Examples :**

*my default ls command is ls -lrt , alias for the same can be as follow*

.. code-block:: bash
		
		king@sysadminlabs:~$ alias myls='ls -lrt'
		king@sysadminlabs:~$ ls -lrt
		total 0
		king@sysadminlabs:~$ touch text1.txt text2.txt
		king@sysadminlabs:~$ ls -lrt
		total 0
		-rw-rw-r-- 1 king king 0 Jun 20 04:12 text2.txt
		-rw-rw-r-- 1 king king 0 Jun 20 04:12 text1.txt
		king@sysadminlabs:~$ myls
		total 0
		-rw-rw-r-- 1 king king 0 Jun 20 04:12 text2.txt
		-rw-rw-r-- 1 king king 0 Jun 20 04:12 text1.txt
		king@sysadminlabs:~$

*Another example is if you want to restart network frequently you can create alias as follows*

.. code-block:: bash

		king@sysadminlabs:~$ sudo /etc/init.d/networking restart
		 * Running /etc/init.d/networking restart is deprecated because it may not enable again some interfaces
		 * Reconfiguring network interfaces...                                          ssh stop/waiting
		ssh start/running, process 4109
		                                                                         [ OK ]
		
		king@sysadminlabs:~$ renet
		 * Running /etc/init.d/networking restart is deprecated because it may not enable again some interfaces
		 * Reconfiguring network interfaces...                                          ssh stop/waiting
		ssh start/running, process 4370
		                                                                         [ OK ]
		king@sysadminlabs:~$
		
*alias command if used without arguments; displays a list of all current aliases*

.. code-block:: bash

		king@sysadminlabs:~$ alias
		alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
		alias egrep='egrep --color=auto'
		alias fgrep='fgrep --color=auto'
		alias grep='grep --color=auto'
		alias l='ls -CF'
		alias la='ls -A'
		alias ll='ls -alF'
		alias ls='ls --color=auto'
		alias myls='ls -lrt'
		alias renet='sudo /etc/init.d/networking restart'
		
*Remove alias create - for example lets remove renet alias which was created earlier*

.. code-block:: bash

		king@sysadminlabs:~$ unalias renet
		king@sysadminlabs:~$ alias
		alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
		alias egrep='egrep --color=auto'
		alias fgrep='fgrep --color=auto'
		alias grep='grep --color=auto'
		alias l='ls -CF'
		alias la='ls -A'
		alias ll='ls -alF'
		alias ls='ls --color=auto'
		alias myls='ls -lrt'
		king@sysadminlabs:~$
		