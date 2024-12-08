# kill
======

send a signal to a process


**Common Usage :**  ::


    $  kill [signal or option] PID(s)

    $  kill -9 PID1 PID2 PID 3

.. note::
    The default signal (when none is specified) is SIGTERM

**Examples :**



.. code-block:: bash

        king@sysadminlabs:~$ kill -l
         1) SIGHUP   2) SIGINT   3) SIGQUIT  4) SIGILL   5) SIGTRAP
         6) SIGABRT  7) SIGBUS   8) SIGFPE   9) SIGKILL 10) SIGUSR1
        11) SIGSEGV 12) SIGUSR2 13) SIGPIPE 14) SIGALRM 15) SIGTERM
        16) SIGSTKFLT   17) SIGCHLD 18) SIGCONT 19) SIGSTOP 20) SIGTSTP
        21) SIGTTIN 22) SIGTTOU 23) SIGURG  24) SIGXCPU 25) SIGXFSZ
        26) SIGVTALRM   27) SIGPROF 28) SIGWINCH    29) SIGIO   30) SIGPWR
        31) SIGSYS  34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
        38) SIGRTMIN+4  39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
        43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
        48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
        53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
        58) SIGRTMAX-6  59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
        63) SIGRTMAX-1  64) SIGRTMAX



.. code-block:: bash

        king@sysadminlabs:~$ ps -ef | grep opera
        king     17497     1 34 02:49 ?        00:00:03 /usr/lib/opera/opera
        king     17512  9777  0 02:50 pts/3    00:00:00 grep --color=auto opera

        king@sysadminlabs:~$ sudo kill -9 17497

        king@sysadminlabs:~$ ps -ef | grep opera
        king     17516  9777  0 02:50 pts/3    00:00:00 grep --color=auto opera

        king@sysadminlabs:~$



.. note::

    -1 or -HUP - This argument makes kill send the "Hang Up" signal to processes. Most daemons are programmed to re-read their configuration when they receive such a signal.

    -2 or -SIGINT - This is the same as stating some program and pressing CTRL+C during execution. Most programs will stop, you could loose data.

    -9 or -KILL - The kernel will let go of the process without informing the process of it. An unclean kill like this could result in data loss.

    -15 or -TERM - Tell the process to stop whatever it's doing, and end itself. When you don't specify any signal, this signal is used. It should be fairly safe to perform, but better start with a "-1" or "-HUP".
