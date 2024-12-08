# atop
=========

is an interactive monitor to view the load on  a  Linux system.  It shows the occupation of the most critical hardware resources (from a performance point of view) on system level,  i.e.  cpu,  memory, disk and network.

**Common Usage :**  ::

		$ sudo atop
		

**Examples :**

.. code-block:: bash

		ATOP - sysadminlabs                      2013/10/31  21:04:25                      ------                        2h59m17s elapsed
		PRC | sys    7.61s |  user   1.16s | #proc    240 |  #trun      1 | #tslpi   244 |  #tslpu     0 | #zombie    0 |  #exit      0 |
		CPU | sys       0% |  user      0% | irq       0% |  idle    200% | wait      0% |  guest     0% | curf 2.92GHz |  curscal   ?% |
		cpu | sys       0% |  user      0% | irq       0% |  idle    100% | cpu001 w  0% |  guest     0% | curf 2.92GHz |  curscal   ?% |
		cpu | sys       0% |  user      0% | irq       0% |  idle    100% | cpu000 w  0% |  guest     0% | curf 2.92GHz |  curscal   ?% |
		CPL | avg1    0.01 |  avg5    0.02 | avg15   0.05 |               | csw   172665 |  intr  148928 |              |  numcpu     2 |
		MEM | tot   329.3M |  free   93.9M | cache 149.3M |  dirty   0.0M | buff   12.6M |  slab   34.4M |              |               |
		SWP | tot   549.0M |  free  549.0M |              |               |              |               | vmcom  76.0M |  vmlim 713.6M |
		DSK |          sda |  busy      0% | read    6554 |  write   1121 | KiB/w     47 |  MBr/s   0.01 | MBw/s   0.00 |  avio 2.66 ms |
		NET | transport    |  tcpi    1589 | tcpo    1137 |  udpi      72 | udpo      92 |  tcpao      3 | tcppo      2 |  tcprs      0 |
		NET | network      |  ipi     2556 | ipo     1257 |  ipfrw      0 | deliv   2547 |               | icmpi     22 |  icmpo      8 |
		NET | eth0      0% |  pcki   10060 | pcko    1258 |  si    0 Kbps | so    0 Kbps |  erri       0 | erro       0 |  drpo       0 |
		NET | lo      ---- |  pcki      40 | pcko      40 |  si    0 Kbps | so    0 Kbps |  erri       0 | erro       0 |  drpo       0 |
		                                          *** system and process activity since boot ***
		  PID  RUID      EUID        THR   SYSCPU    USRCPU   VGROW    RGROW   RDDSK    WRDSK  ST   EXC  S   CPUNR   CPU   CMD       1/20
		  157  root      root          1    3.84s     0.00s      0K       0K      0K       0K  N-     -  S       1    0%   kworker/1:1
		    1  root      root          1    1.45s     0.16s  26828K    2628K  94010K     864K  N-     -  S       1    0%   init
		  515  root      root          1    0.38s     0.61s  42392K    1508K  14713K       0K  N-     -  S       0    0%   systemd-udevd
		 1112  root      root          1    0.67s     0.15s  19260K     812K      0K       0K  N-     -  S       1    0%   irqbalance
		 1700  root      root          1    0.23s     0.00s      0K       0K      0K       0K  N-     -  S       1    0%   kworker/u128:1
		 1699  root      root          1    0.18s     0.00s      0K       0K      0K       0K  N-     -  S       1    0%   kworker/u128:0
		 1367  king      king          1    0.14s     0.00s  94848K    1924K      0K       0K  N-     -  S       0    0%   sshd
		  478  root      root          1    0.02s     0.09s  17320K     636K      0K       0K  N-     -  S       0    0%   upstart-udev-b
		 1368  king      king          1    0.05s     0.04s  22336K    3544K  57200K   41080K  N-     -  S       0    0%   bash
		  546  messageb  messageb      1    0.05s     0.04s  30508K    1296K      0K       0K  N-     -  S       1    0%   dbus-daemon
		   73  root      root          1    0.07s     0.00s      0K       0K      0K       0K  N-     -  S       1    0%   rcu_sched