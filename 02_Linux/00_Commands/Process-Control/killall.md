# killall
=========

kills all instance of the process with the same name

**Common Usage :**  ::


    $ killall  <process-name>


**Examples :**


.. code-block:: bash


        king@sysadminlabs:~$ ps -ef | grep opera
        king     17555     1 17 02:51 ?        00:00:04 /usr/lib/opera/opera
        king     17569  9777  0 02:52 pts/3    00:00:00 grep --color=auto opera

        king@sysadminlabs:~$ killall opera

        king@sysadminlabs:~$ ps -ef | grep opera
        king     17599  9777  0 02:54 pts/3    00:00:00 grep --color=auto opera

        king@sysadminlabs:~$


.. code-block:: bash


