# pkill
========

look  up or signal processes based on name and other attributes


**Common Usage :**  ::


    $  pkill <process-name>


**Examples :**


.. code-block:: bash

        king@sysadminlabs:~$ ps -ef | grep opera
        king     24654     1 26 03:33 ?        00:00:03 /usr/lib/opera/opera
        king     24673  9777  0 03:34 pts/3    00:00:00 grep --color=auto opera

        king@sysadminlabs:~$ pkill oper

        king@sysadminlabs:~$ ps -ef | grep oper
        king     24685  9777  0 03:34 pts/3    00:00:00 grep --color=auto oper

        king@sysadminlabs:~$


