# df

report file system disk space usage


**Common Usage :**  ::

		$ df -h


**Examples :**

.. code-block:: bash

        king@sysadminlabs:~$ df -h
        Filesystem      Size  Used Avail Use% Mounted on
        /dev/sda7        92G   25G   63G  29% /
        udev            2.0G  4.0K  2.0G   1% /dev
        tmpfs           784M  956K  783M   1% /run
        none            5.0M     0  5.0M   0% /run/lock
        none            2.0G  2.0M  2.0G   1% /run/shm
        cgroup          2.0G     0  2.0G   0% /sys/fs/cgroup
        /dev/sda6        98G   26G   67G  28% /LINUX



.. code-block:: bash

        king@sysadminlabs:~$ df -ha
        Filesystem        Size  Used Avail Use% Mounted on
        /dev/sda7          92G   25G   63G  29% /
        proc                 0     0     0    - /proc
        sysfs                0     0     0    - /sys
        none                 0     0     0    - /sys/fs/fuse/connections
        none                 0     0     0    - /sys/kernel/debug
        none                 0     0     0    - /sys/kernel/security
        udev              2.0G  4.0K  2.0G   1% /dev
        devpts               0     0     0    - /dev/pts
        tmpfs             784M  956K  783M   1% /run
        none              5.0M     0  5.0M   0% /run/lock
        none              2.0G  2.0M  2.0G   1% /run/shm
        cgroup            2.0G     0  2.0G   0% /sys/fs/cgroup
        cgroup               0     0     0    - /sys/fs/cgroup/cpuset
        cgroup               0     0     0    - /sys/fs/cgroup/cpu
        cgroup               0     0     0    - /sys/fs/cgroup/cpuacct
        cgroup               0     0     0    - /sys/fs/cgroup/memory
        cgroup               0     0     0    - /sys/fs/cgroup/devices
        cgroup               0     0     0    - /sys/fs/cgroup/freezer
        cgroup               0     0     0    - /sys/fs/cgroup/blkio
        cgroup               0     0     0    - /sys/fs/cgroup/perf_event
        cgroup               0     0     0    - /sys/fs/cgroup/hugetlb
        /dev/sda6          98G   26G   67G  28% /LINUXDATA
        gvfs-fuse-daemon     0     0     0    - /home/king/.gvfs


.. code-block:: bash

        king@sysadminlabs:~$ df -h --total
        Filesystem      Size  Used Avail Use% Mounted on
        /dev/sda7        92G   25G   63G  29% /
        udev            2.0G  4.0K  2.0G   1% /dev
        tmpfs           784M  956K  783M   1% /run
        none            5.0M     0  5.0M   0% /run/lock
        none            2.0G  2.0M  2.0G   1% /run/shm
        cgroup          2.0G     0  2.0G   0% /sys/fs/cgroup
        /dev/sda6        98G   26G   67G  28% /LINUXDATA
        total           196G   50G  136G  27%


.. code-block:: bash

        king@sysadminlabs:~$ df -hT
        Filesystem     Type      Size  Used Avail Use% Mounted on
        /dev/sda7      ext4       92G   25G   63G  29% /
        udev           devtmpfs  2.0G  4.0K  2.0G   1% /dev
        tmpfs          tmpfs     784M  956K  783M   1% /run
        none           tmpfs     5.0M     0  5.0M   0% /run/lock
        none           tmpfs     2.0G  2.0M  2.0G   1% /run/shm
        cgroup         tmpfs     2.0G     0  2.0G   0% /sys/fs/cgroup
        /dev/sda6      ext4       98G   26G   67G  28% /LINUXDATA

.. code-block:: bash


        king@sysadminlabs:~$ df -t ext4
        Filesystem     1K-blocks     Used Available Use% Mounted on
        /dev/sda7       95989516 25583100  65507296  29% /
        /dev/sda6      101941600 26609736  70130408  28% /LINUXDATA

        king@sysadminlabs:~$ df -x ext4
        Filesystem     1K-blocks  Used Available Use% Mounted on
        udev             1992628     4   1992624   1% /dev
        tmpfs             802028   956    801072   1% /run
        none                5120     0      5120   0% /run/lock
        none             2005068  2048   2003020   1% /run/shm
        cgroup           2005068     0   2005068   0% /sys/fs/cgroup

        king@sysadminlabs:~$ df -x ext3
        Filesystem     1K-blocks     Used Available Use% Mounted on
        /dev/sda7       95989516 25583100  65507296  29% /
        udev             1992628        4   1992624   1% /dev
        tmpfs             802028      956    801072   1% /run
        none                5120        0      5120   0% /run/lock
        none             2005068     2048   2003020   1% /run/shm
        cgroup           2005068        0   2005068   0% /sys/fs/cgroup
        /dev/sda6      101941600 26609736  70130408  28% /LINUXDATA


