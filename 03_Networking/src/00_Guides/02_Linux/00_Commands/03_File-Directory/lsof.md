# lsof

list open files

**Common Usage :**  ::

		$ lsof

**Examples :**

.. code-block:: bash

        king@sysadminlabs:~$ sudo lsof | more
        lsof: WARNING: can't stat() fuse.gvfs-fuse-daemon file system /home/king/.gvfs
              Output information may be incomplete.
        COMMAND     PID            USER   FD      TYPE             DEVICE SIZE/OFF       NODE NAME
        init          1            root  cwd       DIR                8,1     4096          2 /
        init          1            root  rtd       DIR                8,1     4096          2 /
        init          1            root  txt       REG                8,1   167192     786494 /sbin/init
        init          1            root  mem       REG                8,1    52120    9437908 /lib/x86_64-linux-gn
        u/libnss_files-2.15.so
        init          1            root  mem       REG                8,1    47680    9437912 /lib/x86_64-linux-gn
        u/libnss_nis-2.15.so
        init          1            root  mem       REG                8,1    97248    9437924 /lib/x86_64-linux-gn
        u/libnsl-2.15.so
        init          1            root  mem       REG                8,1    35680    9437879 /lib/x86_64-linux-gn
        u/libnss_compat-2.15.so
        init          1            root  mem       REG                8,1  1815224    9437874 /lib/x86_64-linux-gn
        u/libc-2.15.so
        init          1            root  mem       REG                8,1    31752    9437911 /lib/x86_64-linux-gn
        u/librt-2.15.so
