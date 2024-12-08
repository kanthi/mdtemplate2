# du
estimate file/folder space usage

**Common Usage :**  ::

		$ du -sh *


**Examples :**

.. code-block:: bash

        king@sysadminlabs:~$ du -sh *
        27M conky-manager
        144M    Documents
        5.1G    Downloads
        3.7G    Dropbox
        25M Goworkplace
        4.0K    Music
        28K PacketTracer6
        12M Pictures
        4.0K    Public
        4.0K    Templates
        4.0K    Videos
        6.3G    VirtualBox VMs
        88K workspace


.. code-block:: bash

        king@sysadminlabs:/tmp$ du -cbha --time
        126 2013-10-11 13:18    ./1381477720.sh
        126 2013-10-11 13:18    ./1381477715.sh
        121 2013-10-11 13:18    ./1381477700.sh
        126 2013-10-11 13:18    ./1381477710.sh
        127 2013-10-11 13:17    ./1381477676.sh
        126 2013-10-11 13:18    ./1381477711.sh
        14M 2013-10-11 13:39    ./midori-king/opera_12.16.1860_amd64.deb
        14M 2013-10-11 13:39    ./midori-king
        143 2013-10-11 13:17    ./1381477664.sh
        126 2013-10-11 13:18    ./1381477721.sh
        127 2013-10-11 13:18    ./1381477709.sh
        120 2013-10-11 13:17    ./1381477648.sh
        126 2013-10-11 13:18    ./1381477681.sh
        126 2013-10-11 13:18    ./1381477718.sh
        126 2013-10-11 13:18    ./1381477714.sh
        139 2013-10-11 13:18    ./1381477738.sh


.. code-block:: bash

        king@sysadminlabs:/tmp$ du -c
        13616   ./midori-king
        4   ./.X11-unix
        4   ./keyring-x7juXE
        4   ./.com.google.Chrome.R7yWPs
        4   ./.ICE-unix
        4   ./ssh-cLShtykl3254
        13648   .
        13648   total

.. code-block:: bash

        king@sysadminlabs:/tmp$ du /var/log
        4   /var/log/news
        20  /var/log/lightdm
        364 /var/log/apt
        228 /var/log/upstart
        du: cannot read directory `/var/log/speech-dispatcher': Permission denied
        4   /var/log/speech-dispatcher
        4   /var/log/ntpstats
        4   /var/log/dist-upgrade
        192 /var/log/ConsoleKit
        4   /var/log/samba
        64  /var/log/tor
        4   /var/log/unattended-upgrades
        12  /var/log/fsck
        28  /var/log/cups
        4   /var/log/hp
        1048    /var/log/installer
        10108   /var/log


.. code-block:: bash

    king@sysadminlabs:/tmp$ du -sh /home
    18G /home
    king@sysadminlabs:/tmp$



