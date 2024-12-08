# Configuration

## Understanding chrony and Its Configuration

### Understanding chronyd

The **chrony** daemon, `chronyd`, running in user space, makes adjustments to the system clock which is running in the kernel. It does this by consulting external time sources, using the `NTP` protocol, when ever network access allows it to do so. When external references are not available, `chronyd` will use the last calculated drift stored in the drift file. It can also be commanded manually to make corrections, by **chronyc**.

### Understanding chronyc

The **chrony** daemon, `chronyd`, can be controlled by the command line utility **chronyc**. This utility provides a command prompt which allows entering of a number of commands to make changes to `chronyd`. The default configuration is for `chronyd` to only accept commands from a local instance of **chronyc**, but **chronyc** can be used to alter the configuration so that `chronyd` will allow external control. **chronyc** can be run remotely after first configuring `chronyd` to accept remote connections. The `IP` addresses allowed to connect to `chronyd` should be tightly controlled.

### Understanding the chrony Configuration Commands

The default configuration file for `chronyd` is `/etc/chrony.conf`. The `-f` option can be used to specify an alternate configuration file path. See the `chronyd` man page for further options. For a complete list of the directives that can be used see *https://chrony.tuxfamily.org/manual.html#Configuration-file*. Below is a selection of configuration options:

- Comments

  Comments should be preceded by #, %, ; or !

- allow

  Optionally specify a host, subnet, or network from which to allow `NTP` connections to a machine acting as `NTP` server. The default is not to allow connections. Examples:[subs="quotes"]

```
allow server1.example.com
```

Use this form to specify a particular host, by its host name, to be allowed access.

1. [subs="quotes"]

```
allow 192.0.2.0/24
```

Use this form to specify a particular network to be allowed access.

1. [subs="quotes"]

```
allow 2001:db8::/32
```

Use this form to specify an `IPv6` address to be allowed access.

- cmdallow

  This is similar to the allow directive (see section allow), except that it allows control access (rather than `NTP` client access) to a particular subnet or host. (By "control access" is meant that **chronyc** can be run on those hosts and successfully connect to `chronyd` on this computer.) The syntax is identical. There is also a cmddeny all directive with similar behavior to the cmdallow all directive.

- dumpdir

  Path to the directory to save the measurement history across restarts of `chronyd` (assuming no changes are made to the system clock behavior whilst it is not running). If this capability is to be used (via the dumponexit command in the configuration file, or the dump command in **chronyc**), the dumpdir command should be used to define the directory where the measurement histories are saved.

- dumponexit

  If this command is present, it indicates that `chronyd` should save the measurement history for each of its time sources recorded whenever the program exits. (See the dumpdir command above).

- local

  The local keyword is used to allow `chronyd` to appear synchronized to real time from the viewpoint of clients polling it, even if it has no current synchronization source. This option is normally used on the "master" computer in an isolated network, where several computers are required to synchronize to one another, and the "master" is kept in line with real time by manual input.

An example of the command is:

```
local stratum 10
```

A large value of 10 indicates that the clock is so many hops away from a reference clock that its time is unreliable. If the computer ever has access to another computer which is ultimately synchronized to a reference clock, it will almost certainly be at a stratum less than 10. Therefore, the choice of a high value like 10 for the local command prevents the machine’s own time from ever being confused with real time, were it ever to leak out to clients that have visibility of real servers.

- log

  The log command indicates that certain information is to be logged. It accepts the following options:measurementsThis option logs the raw `NTP` measurements and related information to a file called `measurements.log`.statisticsThis option logs information about the regression processing to a file called `statistics.log`.trackingThis option logs changes to the estimate of the system’s gain or loss rate, and any slews made, to a file called `tracking.log`.rtcThis option logs information about the system’s real-time clock.refclocksThis option logs the raw and filtered reference clock measurements to a file called `refclocks.log`.tempcompThis option logs the temperature measurements and system rate compensations to a file called `tempcomp.log`.

The log files are written to the directory specified by the logdir command.

An example of the command is:

```
log measurements statistics tracking
```

- logdir

  This directive allows the directory where log files are written to be specified.

An example of the use of this directive is:

```
logdir /var/log/chrony
```

- makestep

  Normally `chronyd` will cause the system to gradually correct any time offset, by slowing down or speeding up the clock as required. In certain situations, the system clock may be so far adrift that this slewing process would take a very long time to correct the system clock. This directive forces `chronyd` to step system clock if the adjustment is larger than a threshold value, but only if there were no more clock updates since `chronyd` was started than a specified limit (a negative value can be used to disable the limit). This is particularly useful when using reference clocks, because the initstepslew directive only works with `NTP` sources.

An example of the use of this directive is:

```
makestep 1000 10
```

This would step the system clock if the adjustment is larger than 1000 seconds, but only in the first ten clock updates.

- maxchange

  This directive sets the maximum allowed offset corrected on a clock update. The check is performed only after the specified number of updates to allow a large initial adjustment of the system clock. When an offset larger than the specified maximum occurs, it will be ignored for the specified number of times and then `chronyd` will give up and exit (a negative value can be used to never exit). In both cases a message is sent to syslog.

An example of the use of this directive is:

```
maxchange 1000 1 2
```

After the first clock update, `chronyd` will check the offset on every clock update, it will ignore two adjustments larger than 1000 seconds and exit on another one.

- maxupdateskew

  One of `chronyd`'s tasks is to work out how fast or slow the computer’s clock runs relative to its reference sources. In addition, it computes an estimate of the error bounds around the estimated value.

If the range of error is too large, it indicates that the measurements have not settled down yet, and that the estimated gain or loss rate is not very reliable.

The maxupdateskew parameter is the threshold for determining whether an estimate is too unreliable to be used. By default, the threshold is 1000 ppm.

The format of the syntax is:

```
maxupdateskew skew-in-ppm
```

Typical values for *skew-in-ppm* might be 100 for a dial-up connection to servers over a telephone line, and 5 or 10 for a computer on a LAN.

It should be noted that this is not the only means of protection against using unreliable estimates. At all times, `chronyd` keeps track of both the estimated gain or loss rate, and the error bound on the estimate. When a new estimate is generated following another measurement from one of the sources, a weighted combination algorithm is used to update the master estimate. So if `chronyd` has an existing highly-reliable master estimate and a new estimate is generated which has large error bounds, the existing master estimate will dominate in the new master estimate.

- noclientlog

  This directive, which takes no arguments, specifies that client accesses are not to be logged. Normally they are logged, allowing statistics to be reported using the clients command in **chronyc**.

- reselectdist

  When `chronyd` selects synchronization source from available sources, it will prefer the one with minimum synchronization distance. However, to avoid frequent reselecting when there are sources with similar distance, a fixed distance is added to the distance for sources that are currently not selected. This can be set with the `reselectdist` option. By default, the distance is 100 microseconds.

The format of the syntax is:

```
reselectdist dist-in-seconds
```

- stratumweight

  The stratumweight directive sets how much distance should be added per stratum to the synchronization distance when `chronyd` selects the synchronization source from available sources.

The format of the syntax is:

```
stratumweight dist-in-seconds
```

By default, *dist-in-seconds* is 1 second. This means that sources with lower stratum are usually preferred to sources with higher stratum even when their distance is significantly worse. Setting stratumweight to 0 makes `chronyd` ignore stratum when selecting the source.

- rtcfile

  The rtcfile directive defines the name of the file in which `chronyd` can save parameters associated with tracking the accuracy of the system’s real-time clock (RTC).

The format of the syntax is:

```
rtcfile /var/lib/chrony/rtc
```

`chronyd` saves information in this file when it exits and when the writertc command is issued in **chronyc**. The information saved is the RTC’s error at some epoch, that epoch (in seconds since January 1 1970), and the rate at which the RTC gains or loses time. Not all real-time clocks are supported as their code is system-specific. Note that if this directive is used then the real-time clock should not be manually adjusted as this would interfere with **chrony**'s need to measure the rate at which the real-time clock drifts if it was adjusted at random intervals.

- rtcsync

  The rtcsync directive is present in the `/etc/chrony.conf` file by default. This will inform the kernel the system clock is kept synchronized and the kernel will update the real-time clock every 11 minutes.

### Security with chronyc

As access to **chronyc** allows changing `chronyd` just as editing the configuration files would, access to **chronyc** should be limited. Passwords can be specified in the key file, written in ASCII or HEX, to restrict the use of **chronyc**. One of the entries is used to restrict the use of operational commands and is referred to as the command key. In the default configuration, a random command key is generated automatically on start. It should not be necessary to specify or alter it manually.

Other entries in the key file can be used as `NTP` keys to authenticate packets received from remote `NTP` servers or peers. The two sides need to share a key with identical ID, hash type and password in their key file. This requires manually creating the keys and copying them over a secure medium, such as `SSH`. If the key ID was, for example, 10 then the systems that act as clients must have a line in their configuration files in the following format:

```
server w.x.y.z key 10
peer w.x.y.z key 10
```

The location of the key file is specified in the `/etc/chrony.conf` file. The default entry in the configuration file is:

```
keyfile /etc/chrony.keys
```

The command key number is specified in `/etc/chrony.conf` using the commandkey directive, it is the key `chronyd` will use for authentication of user commands. The directive in the configuration file takes the following form:

```
commandkey 1
```

An example of the format of the default entry in the key file, `/etc/chrony.keys`, for the command key is:

```
1 SHA1 HEX:A6CFC50C9C93AB6E5A19754C246242FC5471BCDF
```

Where `1` is the key ID, SHA1 is the hash function to use, `HEX` is the format of the key, and `A6CFC50C9C93AB6E5A19754C246242FC5471BCDF` is the key randomly generated when **chronyd** was started for the first time. The key can be given in hexidecimal or ASCII format (the default).

A manual entry in the key file, used to authenticate packets from certain `NTP` servers or peers, can be as simple as the following:

```
20 foobar
```

Where `20` is the key ID and `foobar` is the secret authentication key. The default hash is MD5, and ASCII is the default format for the key.

By default, `chronyd` is configured to listen for commands only from `localhost` (`127.0.0.1` and `::1`) on port `323`. To access `chronyd` remotely with **chronyc**, any bindcmdaddress directives in the `/etc/chrony.conf` file should be removed to enable listening on all interfaces and the cmdallow directive should be used to allow commands from the remote `IP` address, network, or subnet. In addition, port `323` has to be opened in the firewall in order to connect from a remote system. Note that the allow directive is for `NTP` access whereas the cmdallow directive is to enable the receiving of remote commands. It is possible to make these changes temporarily using **chronyc** running locally. Edit the configuration file to make persistent changes.

The communication between **chronyc** and **chronyd** is done over `UDP`, so it needs to be authorized before issuing operational commands. To authorize, use the authhash and password commands as follows:

```
chronyc> authhash SHA1
chronyc> password HEX:A6CFC50C9C93AB6E5A19754C246242FC5471BCDF
200 OK
```

If **chronyc** is used to configure the local **chronyd**, the `-a` option will run the authhash and password commands automatically.

Only the following commands can be used without providing a password:

- activity
- authhash
- dns
- exit
- help
- password
- quit
- rtcdata
- sources
- sourcestats
- tracking
- waitsync





## Using chrony

### Installing chrony

The **chrony** suite is installed by default on some versions of Fedora. If required, to ensure that it is, run the following command as `root`:

```
~]# dnf install chrony
```

The default location for the **chrony** daemon is `/usr/sbin/chronyd`. The command line utility will be installed to `/usr/bin/chronyc`.

### Checking the Status of chronyd

To check the status of `chronyd`, issue the following command:

```
~]$ systemctl status chronyd
chronyd.service - NTP client/server
   Loaded: loaded (/usr/lib/systemd/system/chronyd.service; enabled)
   Active: active (running) since Wed 2013-06-12 22:23:16 CEST; 11h ago
```

### Starting chronyd

To start `chronyd`, issue the following command as `root`:

```
~]# systemctl start chronyd
```

To ensure `chronyd` starts automatically at system start, issue the following command as `root`:

```
~]# systemctl enable chronyd
```

### Stopping chronyd

To stop `chronyd`, issue the following command as `root`:

```
~]# systemctl stop chronyd
```

To prevent `chronyd` from starting automatically at system start, issue the following command as `root`:

```
~]# systemctl disable chronyd
```

### Checking if chrony is Synchronized

To check if **chrony** is synchronized, make use of the tracking, sources, and sourcestats commands.

#### Checking chrony Tracking

To check **chrony** tracking, issue the following command:

```
~]$ chronyc tracking
Reference ID    : 1.2.3.4 (a.b.c)
Stratum         : 3
Ref time (UTC)  : Fri Feb  3 15:00:29 2012
System time     : 0.000001501 seconds slow of NTP time
Last offset     : -0.000001632 seconds
RMS offset      : 0.000002360 seconds
Frequency       : 331.898 ppm fast
Residual freq   : 0.004 ppm
Skew            : 0.154 ppm
Root delay      : 0.373169 seconds
Root dispersion : 0.024780 seconds
Update interval : 64.2 seconds
Leap status     : Normal
```

The fields are as follows:

- Reference ID

  This is the reference ID and name (or `IP` address) if available, of the server to which the computer is currently synchronized. If this is `127.127.1.1` it means the computer is not synchronized to any external source and that you have the "local" mode operating (via the local command in **chronyc**, or the local directive in the `/etc/chrony.conf` file (see section local)).

- Stratum

  The stratum indicates how many hops away from a computer with an attached reference clock we are. Such a computer is a stratum-1 computer, so the computer in the example is two hops away (that is to say, a.b.c is a stratum-2 and is synchronized from a stratum-1).

- Ref time

  This is the time (UTC) at which the last measurement from the reference source was processed.

- System time

  In normal operation, `chronyd` never steps the system clock, because any jump in the timescale can have adverse consequences for certain application programs. Instead, any error in the system clock is corrected by slightly speeding up or slowing down the system clock until the error has been removed, and then returning to the system clock’s normal speed. A consequence of this is that there will be a period when the system clock (as read by other programs using the `gettimeofday()` system call, or by the date command in the shell) will be different from `chronyd`'s estimate of the current true time (which it reports to `NTP` clients when it is operating in server mode). The value reported on this line is the difference due to this effect.

- Last offset

  This is the estimated local offset on the last clock update.

- RMS offset

  This is a long-term average of the offset value.

- Frequency

  The "frequency" is the rate by which the system’s clock would be wrong if `chronyd` was not correcting it. It is expressed in ppm (parts per million). For example, a value of 1ppm would mean that when the system’s clock thinks it has advanced 1 second, it has actually advanced by 1.000001 seconds relative to true time.

- Residual freq

  This shows the "residual frequency" for the currently selected reference source. This reflects any difference between what the measurements from the reference source indicate the frequency should be and the frequency currently being used.

The reason this is not always zero is that a smoothing procedure is applied to the frequency. Each time a measurement from the reference source is obtained and a new residual frequency computed, the estimated accuracy of this residual is compared with the estimated accuracy (see `skew` next) of the existing frequency value. A weighted average is computed for the new frequency, with weights depending on these accuracies. If the measurements from the reference source follow a consistent trend, the residual will be driven to zero over time.

- Skew

  This is the estimated error bound on the frequency.

- Root delay

  This is the total of the network path delays to the stratum-1 computer from which the computer is ultimately synchronized.

In certain extreme situations, this value can be negative. (This can arise in a symmetric peer arrangement where the computers’ frequencies are not tracking each other and the network delay is very short relative to the turn-around time at each computer.)

- Root dispersion

  This is the total dispersion accumulated through all the computers back to the stratum-1 computer from which the computer is ultimately synchronized. Dispersion is due to system clock resolution, statistical measurement variations etc.

- Leap status

  This is the leap status, which can be Normal, Insert second, Delete second or Not synchronized.

#### Checking chrony Sources

The sources command displays information about the current time sources that `chronyd` is accessing.

The optional argument -v can be specified, meaning verbose. In this case, extra caption lines are shown as a reminder of the meanings of the columns.

```
~]$ chronyc sources
	210 Number of sources = 3
MS Name/IP address         Stratum Poll Reach LastRx Last sample
===============================================================================
#* GPS0                          0   4   377    11   -479ns[ -621ns] +/-  134ns
^? a.b.c                         2   6   377    23   -923us[ -924us] +/-   43ms
^+ d.e.f                         1   6   377    21  -2629us[-2619us] +/-   86ms
```

The columns are as follows:

- M

  This indicates the mode of the source. `^` means a server, `=` means a peer and `#` indicates a locally connected reference clock.

- S

  This column indicates the state of the sources. "*" indicates the source to which `chronyd` is currently synchronized. "+" indicates acceptable sources which are combined with the selected source. "-" indicates acceptable sources which are excluded by the combining algorithm. "?" indicates sources to which connectivity has been lost or whose packets do not pass all tests. "x" indicates a clock which `chronyd` thinks is a *falseticker* (its time is inconsistent with a majority of other sources). "~" indicates a source whose time appears to have too much variability. The "?" condition is also shown at start-up, until at least 3 samples have been gathered from it.

- Name/IP address

  This shows the name or the `IP` address of the source, or reference ID for reference clocks.

- Stratum

  This shows the stratum of the source, as reported in its most recently received sample. Stratum 1 indicates a computer with a locally attached reference clock. A computer that is synchronized to a stratum 1 computer is at stratum 2. A computer that is synchronized to a stratum 2 computer is at stratum 3, and so on.

- Poll

  This shows the rate at which the source is being polled, as a base-2 logarithm of the interval in seconds. Thus, a value of 6 would indicate that a measurement is being made every 64 seconds.

`chronyd` automatically varies the polling rate in response to prevailing conditions.

- Reach

  This shows the source’s reach register printed as an octal number. The register has 8 bits and is updated on every received or missed packet from the source. A value of 377 indicates that a valid reply was received for all of the last eight transmissions.

- LastRx

  This column shows how long ago the last sample was received from the source. This is normally in seconds. The letters `m`, `h`, `d` or `y` indicate minutes, hours, days or years. A value of 10 years indicates there were no samples received from this source yet.

- Last sample

  This column shows the offset between the local clock and the source at the last measurement. The number in the square brackets shows the actual measured offset. This may be suffixed by `ns` (indicating nanoseconds), `us` (indicating microseconds), `ms` (indicating milliseconds), or `s` (indicating seconds). The number to the left of the square brackets shows the original measurement, adjusted to allow for any slews applied to the local clock since. The number following the `+/-` indicator shows the margin of error in the measurement. Positive offsets indicate that the local clock is ahead of the source.

#### Checking chrony Source Statistics

The sourcestats command displays information about the drift rate and offset estimation process for each of the sources currently being examined by `chronyd`.

The optional argument `-v` can be specified, meaning verbose. In this case, extra caption lines are shown as a reminder of the meanings of the columns.

```
~]$ chronyc sourcestats
210 Number of sources = 1
Name/IP Address            NP  NR  Span  Frequency  Freq Skew  Offset  Std Dev
===============================================================================
abc.def.ghi                11   5   46m     -0.001      0.045      1us    25us
```

The columns are as follows:

- Name/IP address

  This is the name or `IP` address of the `NTP` server (or peer) or reference ID of the reference clock to which the rest of the line relates.

- NP

  This is the number of sample points currently being retained for the server. The drift rate and current offset are estimated by performing a linear regression through these points.

- NR

  This is the number of runs of residuals having the same sign following the last regression. If this number starts to become too small relative to the number of samples, it indicates that a straight line is no longer a good fit to the data. If the number of runs is too low, `chronyd` discards older samples and re-runs the regression until the number of runs becomes acceptable.

- Span

  This is the interval between the oldest and newest samples. If no unit is shown the value is in seconds. In the example, the interval is 46 minutes.

- Frequency

  This is the estimated residual frequency for the server, in parts per million. In this case, the computer’s clock is estimated to be running 1 part in *109* slow relative to the server.

- Freq Skew

  This is the estimated error bounds on Freq (again in parts per million).

- Offset

  This is the estimated offset of the source.

- Std Dev

  This is the estimated sample standard deviation.

### Manually Adjusting the System Clock

To update, or step, the system clock immediately, bypassing any adjustments in progress by slewing the clock, issue the following commands as `root`:

```
~]# chronyc
      chrony> password commandkey-password
      200 OK
      chrony> makestep
      200 OK
```

Where *commandkey-password* is the command key or password stored in the key file.

If the rtcfile directive is used, the real-time clock should not be manually adjusted. Random adjustments would interfere with **chrony**'s need to measure the rate at which the real-time clock drifts.

If **chronyc** is used to configure the local **chronyd**, the `-a` will run the authhash and password commands automatically. This means that the interactive session illustrated above can be replaced by:

```
chronyc -a makestep
```

## Setting Up chrony for Different Environments

### Setting Up chrony for a System Which is Infrequently Connected

This example is intended for systems which use dial-on-demand connections. The normal configuration should be sufficient for mobile and virtual devices which connect intermittently. First, review and confirm that the default settings in the `/etc/chrony.conf` are similar to the following:

```
driftfile /var/lib/chrony/drift
commandkey 1
keyfile /etc/chrony.keys
```

The command key ID is generated at install time and should correspond with the commandkey value in the key file, `/etc/chrony.keys`.

Using your editor running as `root`, add the addresses of four `NTP` servers as follows:

```
server 0.pool.ntp.org offline
server 1.pool.ntp.org offline
server 2.pool.ntp.org offline
server 3.pool.ntp.org offline
```

The `offline` option can be useful in preventing systems from trying to activate connections. The **chrony** daemon will wait for **chronyc** to inform it that the system is connected to the network or Internet.

### Setting Up chrony for a System in an Isolated Network

For a network that is never connected to the Internet, one computer is selected to be the master timeserver. The other computers are either direct clients of the master, or clients of clients. On the master, the drift file must be manually set with the average rate of drift of the system clock. If the master is rebooted it will obtain the time from surrounding systems and take an average to set its system clock. Thereafter it resumes applying adjustments based on the drift file. The drift file will be updated automatically when the settime command is used.

On the system selected to be the master, using a text editor running as `root`, edit the `/etc/chrony.conf` as follows:

```
driftfile /var/lib/chrony/drift
commandkey 1
keyfile /etc/chrony.keys
initstepslew 10 client1 client3 client6
local stratum 8
manual
allow 192.0.2.0
```

Where `192.0.2.0` is the network or subnet address from which the clients are allowed to connect.

On the systems selected to be direct clients of the master, using a text editor running as `root`, edit the `/etc/chrony.conf` as follows:

```
server master
driftfile /var/lib/chrony/drift
logdir /var/log/chrony
log measurements statistics tracking
keyfile /etc/chrony.keys
commandkey 24
local stratum 10
initstepslew 20 master
allow 192.0.2.123
```

Where `192.0.2.123` is the address of the master, and `master` is the host name of the master. Clients with this configuration will resynchronize the master if it restarts.

On the client systems which are not to be direct clients of the master, the `/etc/chrony.conf` file should be the same except that the `local` and `allow` directives should be omitted.

## Using chronyc

### Using chronyc to Control chronyd

To make changes to the local instance of `chronyd` using the command line utility **chronyc** in interactive mode, enter the following command as `root`:

```
~]# chronyc -a
```

**chronyc** must run as `root` if some of the restricted commands are to be used. The `-a` option is for automatic authentication using the local keys when configuring `chronyd` on the local system. See [Configuring_NTP_Using_the_chrony_Suite.adoc#sect-Security_with_chronyc](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/servers/Configuring_NTP_Using_the_chrony_Suite/#) for more information.

The **chronyc** command prompt will be displayed as follows:

```
chronyc>
```

You can type help to list all of the commands.

The utility can also be invoked in non-interactive command mode if called together with a command as follows:

```
chronyc command
```

|      | Changes made using **chronyc** are not permanent, they will be lost after a `chronyd` restart. For permanent changes, modify `/etc/chrony.conf`. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

### Using chronyc for Remote Administration

To configure **chrony** to connect to a remote instance of `chronyd`, issue a command in the following format:

```
~]$ chronyc -h hostname
```

Where *hostname* is the host name to connect to. The default is to connect to the local daemon.

To configure **chrony** to connect to a remote instance of `chronyd` on a non-default port, issue a command in the following format:

```
~]$ chronyc -h hostname -p port
```

Where *port* is the port in use for controlling and monitoring by the remote instance of `chronyd`.

Note that commands issued at the **chronyc** command prompt are not persistent. Only commands in the configuration file are persistent.

The first command must be the password command at the **chronyc** command prompt as follows:

```
chronyc> password password
200 OK
```

The password should not have any spaces.

If the password is not an MD5 hash, the hashed password must be preceded by the authhash command as follows:

```
chronyc> authhash SHA1
chronyc> password HEX:A6CFC50C9C93AB6E5A19754C246242FC5471BCDF
200 OK
```

The password or hash associated with the command key for a remote system is best obtained by `SSH`. An `SSH` connection should be established to the remote machine and the ID of the command key from `/etc/chrony.conf` and the command key in `/etc/chrony.keys` memorized or stored securely for the duration of the session.

## Additional Resources

The following sources of information provide additional resources regarding **chrony**.

### Installed Documentation

- `chrony(1)` man page — Introduces the **chrony** daemon and the command-line interface tool.
- `chronyc(1)` man page — Describes the **chronyc** command-line interface tool including commands and command options.
- `chronyd(1)` man page — Describes the **chronyd** daemon including commands and command options.
- `chrony.conf(5)` man page — Describes the **chrony** configuration file.
- `/usr/share/doc/chrony/chrony.txt` — User guide for the **chrony** suite.

### Online Documentation

- https://chrony.tuxfamily.org/manual.html

  The online user guide for **chrony**.