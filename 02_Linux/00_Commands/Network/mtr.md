# mtr
=======

combines the functionality of the traceroute and ping programs in a single network diagnostic tool.


**Common Usage :**  ::
  
  # mtr --report [destination_host]

**Examples :**

.. code-block:: bash

  king@sysadminlabs:~# mtr --report google.com
  HOST: king-linux-laptop           Loss%   Snt   Last   Avg  Best  Wrst StDev
    1.|-- 192.168.138.111            0.0%    10    1.1   1.1   1.0   1.1   0.0
    2.|-- ABTS-AP-Dynamic-001.128.1  0.0%    10   18.2  18.4  17.7  19.8   0.7
    3.|-- ABTS-AP-Static-254.240.16  0.0%    10   18.1  17.8  17.2  18.1   0.3
    4.|-- 125.16.7.125               0.0%    10   17.5  17.6  17.2  18.2   0.4
    5.|-- 125.21.167.70              0.0%    10   37.2  36.7  36.3  37.2   0.3
    6.|-- 72.14.216.229              0.0%    10   36.8  59.9  36.3 130.6  30.2
    7.|-- 66.249.94.168              0.0%    10   48.1  48.3  47.9  49.0   0.3
    8.|-- 209.85.249.235             0.0%    10   37.3  37.7  36.7  39.9   1.0
    9.|-- 74.125.236.84              0.0%    10   48.6  48.4  47.9  49.0   0.4


*The command issued to generate the report is "mtr --report google.com". This uses the report option which sends 10 packets to the host google.com and generates the output. Without the --report option, mtr will run continuously in an interactive environment. The interactive mode reflects current round trip times to each host. In most cases, the --report mode provides sufficient data in a useful format.*


*If you want to omit the rDNS lookups you can use the --no-dns option, which would produce output similar to the following:*

.. code-block:: bash

  king@sysadminlabs:~# mtr --no-dns --report google.com
  HOST: king-linux-laptop           Loss%   Snt   Last   Avg  Best  Wrst StDev
    1.|-- 192.168.138.111            0.0%    10    1.3   1.2   1.1   2.2   0.3
    2.|-- 122.169.128.1              0.0%    10   77.3  26.5  17.9  77.3  18.3
    3.|-- 122.169.240.254            0.0%    10   19.3  19.2  17.7  27.2   2.9
    4.|-- 125.16.7.125               0.0%    10   17.4  18.1  17.2  21.6   1.3
    5.|-- 125.21.167.70              0.0%    10   36.8  36.9  36.4  37.6   0.3
    6.|-- 72.14.216.229              0.0%    10  115.2  78.3  36.9 134.9  43.7
    7.|-- 66.249.94.168              0.0%    10   48.1  48.0  47.7  48.5   0.2
    8.|-- 209.85.249.235             0.0%    10   37.2  37.1  36.7  37.6   0.2
    9.|-- 74.125.236.84              0.0%    10   48.1  48.5  48.1  49.5   0.4

