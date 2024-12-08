# head


Print  the  first 10 lines of each FILE to standard output.


**Common Usage :**  ::

		$ head <filename>


**Examples :**

.. code-block:: bash

    king@sysadminlabs:~$ head history.txt
    1  ifconfig
    2  clear
    3  python -V
    4  clear
    5  sudo vi .config/plank/dock1/settings
    6  vi .config/plank/dock1/settings
    7  sudo apt-get update
    8  clear
    9  cd /lib/plymouth/themes/
   10  ls


.. code-block:: bash

    king@sysadminlabs:~$ head -n 5 history.txt
    1  ifconfig
    2  clear
    3  python -V
    4  clear
    5  sudo vi .config/plank/dock1/settings




