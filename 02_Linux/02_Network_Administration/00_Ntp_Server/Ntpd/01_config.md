# Configuration

## Understanding the ntpd Configuration File

The daemon, `ntpd`, reads the configuration file at system start or when the service is restarted. The default location for the file is `/etc/ntp.conf` and you can view the file by entering the following command:

```
~]$ less /etc/ntp.conf
```

The configuration commands are explained briefly later in this chapter, see [Configuring_NTP_Using_ntpd.adoc#s1-Configure_NTP](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/servers/Configuring_NTP_Using_ntpd/#), and more verbosely in the `ntp.conf(5)` man page.

Here follows a brief explanation of the contents of the default configuration file:

- The driftfile entry

  A path to the drift file is specified, the default entry on Fedora is:

```
driftfile /var/lib/ntp/drift
```

If you change this be certain that the directory is writable by `ntpd`. The file contains one value used to adjust the system clock frequency after every system or service start. See [Configuring_NTP_Using_ntpd.adoc#s1-Understanding_the_Drift_File](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/servers/Configuring_NTP_Using_ntpd/#) for more information.

- The access control entries

  The following line sets the default access control restriction:

```
restrict default nomodify notrap nopeer noquery
```

- The `nomodify` options prevents any changes to the configuration.
- The `notrap` option prevents `ntpdc` control message protocol traps.
- The `nopeer` option prevents a peer association being formed.
- The `noquery` option prevents `ntpq` and `ntpdc` queries, but not time queries, from being answered.

|      | The `ntpq` and `ntpdc` queries can be used in amplification attacks, therefore do not remove the `noquery` option from the restrict default command on publicly accessible systems.See *[CVE-2013-5211](https://access.redhat.com/security/cve/CVE-2013-5211)* for more details. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

Addresses within the range `127.0.0.0/8` are sometimes required by various processes or applications. As the "restrict default" line above prevents access to everything not explicitly allowed, access to the standard loopback address for `IPv4` and `IPv6` is permitted by means of the following lines:

```
# the administrative functions.
restrict 127.0.0.1
restrict ::1
```

Addresses can be added underneath if specifically required by another application.

Hosts on the local network are not permitted because of the "restrict default" line above. To change this, for example to allow hosts from the `192.0.2.0/24` network to query the time and statistics but nothing more, a line in the following format is required:

```
restrict 192.0.2.0 mask 255.255.255.0 nomodify notrap nopeer
```

To allow unrestricted access from a specific host, for example `192.0.2.250/32`, a line in the following format is required:

```
restrict 192.0.2.250
```

A mask of `255.255.255.255` is applied if none is specified.

The restrict commands are explained in the `ntp_acc(5)` man page.

- The public servers entry

  By default, the `ntp.conf` file contains four public server entries:

```
server 0.fedora.pool.ntp.org iburst
server 1.fedora.pool.ntp.org iburst
server 2.fedora.pool.ntp.org iburst
server 3.fedora.pool.ntp.org iburst
```

- The broadcast multicast servers entry

  By default, the `ntp.conf` file contains some commented out examples. These are largely self explanatory. See [Configuring_NTP_Using_ntpd.adoc#s1-Configure_NTP](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/servers/Configuring_NTP_Using_ntpd/#) for the explanation of the specific commands. If required, add your commands just below the examples.

|      | When the `DHCP` client program, **dhclient**, receives a list of `NTP` servers from the `DHCP` server, it adds them to `ntp.conf` and restarts the service. To disable that feature, add PEERNTP=no to `/etc/sysconfig/network`. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

## Understanding the ntpd Sysconfig File

The file will be read by the `ntpd` init script on service start. The default contents is as follows:

```
# Command line options for ntpd
OPTIONS="-g"
```

The `-g` option enables `ntpd` to ignore the offset limit of 1000s and attempt to synchronize the time even if the offset is larger than 1000s, but only on system start. Without that option **ntpd** will exit if the time offset is greater than 1000s. It will also exit after system start if the service is restarted and the offset is greater than 1000s even with the `-g` option.

## Disabling chrony

In order to use `ntpd` the default user space daemon, `chronyd`, must be stopped and disabled. Issue the following command as `root`:

```
~]# systemctl stop chronyd
```

To prevent it restarting at system start, issue the following command as `root`:

```
~]# systemctl disable chronyd
```

To check the status of `chronyd`, issue the following command:

```
~]$ systemctl status chronyd
```

## Checking if the NTP Daemon is Installed

To check if `ntpd` is installed, enter the following command as `root`:

```
~]# dnf install ntp
```

`NTP` is implemented by means of the daemon or service `ntpd`, which is contained within the **ntp** package.

## Installing the NTP Daemon (ntpd)

To install `ntpd`, enter the following command as `root`:

```
~]# dnf install ntp
```

To enable `ntpd` at system start, enter the following command as `root`:

```
~]# systemctl enable ntpd
```

## Checking the Status of NTP

To check if `ntpd` is running and configured to run at system start, issue the following command:

```
~]$ systemctl status ntpd
```

To obtain a brief status report from `ntpd`, issue the following command:

```
~]$ ntpstat
unsynchronised
  time server re-starting
   polling server every 64 s
~]$ ntpstat
synchronised to NTP server (10.5.26.10) at stratum 2
   time correct to within 52 ms
   polling server every 1024 s
```

## Configure the Firewall to Allow Incoming NTP Packets

The `NTP` traffic consists of `UDP` packets on port `123` and needs to be permitted through network and host-based firewalls in order for `NTP` to function.

Check if the firewall is configured to allow incoming `NTP` traffic for clients using the graphical **Firewall Configuration** tool.

To start the graphical **firewall-config** tool, press the Super key to enter the Activities Overview, type firewall and then press Enter. The `Firewall Configuration` window opens. You will be prompted for your user password.

To start the graphical firewall configuration tool using the command line, enter the following command as `root` user:

```
~]# firewall-config
```

The `Firewall Configuration` window opens. Note, this command can be run as normal user but you will then be prompted for the `root` password from time to time.

Look for the word "Connected" in the lower left corner. This indicates that the **firewall-config** tool is connected to the user space daemon, `firewalld`.

### Change the Firewall Settings

To immediately change the current firewall settings, ensure the drop-down selection menu labeled `Configuration` is set to `Runtime`. Alternatively, to edit the settings to be applied at the next system start, or firewall reload, select `Permanent` from the drop-down list.

|      | When making changes to the firewall settings in `Runtime` mode, your selection takes immediate effect when you set or clear the check box associated with the service. You should keep this in mind when working on a system that may be in use by other users.When making changes to the firewall settings in `Permanent` mode, your selection will only take effect when you reload the firewall or the system restarts. To reload the firewall, select the Options menu and select `Reload Firewall`. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

### Open Ports in the Firewall for NTP Packets

To permit traffic through the firewall to a certain port, start the **firewall-config** tool and select the network zone whose settings you want to change. Select the `Ports` tab and then click the **Add** button. The `Port and Protocol` window opens.

Enter the port number `123` and select `udp` from the drop-down list.

## Configure ntpdate Servers

The purpose of the `ntpdate` service is to set the clock during system boot. This was used previously to ensure that the services started after `ntpdate` would have the correct time and not observe a jump in the clock. The use of `ntpdate` and the list of step-tickers is considered deprecated and so Fedora uses the `-g` option to the ntpd command and not `ntpdate` by default.

The `ntpdate` service in Fedora is mostly useful only when used alone without `ntpd`. With **systemd**, which starts services in parallel, enabling the `ntpdate` service will not ensure that other services started after it will have correct time unless they specify an ordering dependency on `time-sync.target`, which is provided by the `ntpdate` service. The `ntp-wait` service (in the **ntp-perl** subpackage) provides the `time-sync` target for the `ntpd` service. In order to ensure a service starts with correct time, add `After=time-sync.target` to the service and enable one of the services which provide the target (`ntpdate` or **sntp**, or **ntp-wait** if `ntpd` is enabled). Some services on Fedora have the dependency included by default ( for example, `dhcpd`, `dhcpd6`, and `crond`).

To check if the `ntpdate` service is enabled to run at system start, issue the following command:

```
~]$ systemctl status ntpdate
```

To enable the service to run at system start, issue the following command as `root`:

```
~]# systemctl enable ntpdate
```

In Fedora the default `/etc/ntp/step-tickers` file contains `0.fedora.pool.ntp.org`. To configure additional `ntpdate` servers, using a text editor running as `root`, edit `/etc/ntp/step-tickers`. The number of servers listed is not very important as `ntpdate` will only use this to obtain the date information once when the system is starting. If you have an internal time server then use that host name for the first line. An additional host on the second line as a backup is sensible. The selection of backup servers and whether the second host is internal or external depends on your risk assessment. For example, what is the chance of any problem affecting the first server also affecting the second server? Would connectivity to an external server be more likely to be available than connectivity to internal servers in the event of a network failure disrupting access to the first server?

## Configure NTP

To change the default configuration of the `NTP` service, use a text editor running as `root` user to edit the `/etc/ntp.conf` file. This file is installed together with `ntpd` and is configured to use time servers from the Fedora pool by default. The man page `ntp.conf(5)` describes the command options that can be used in the configuration file apart from the access and rate limiting commands which are explained in the `ntp_acc(5)` man page.

### Configure Access Control to an NTP Service

To restrict or control access to the `NTP` service running on a system, make use of the restrict command in the `ntp.conf` file. See the commented out example:

```
# Hosts on local network are less restricted.
#restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap
```

The restrict command takes the following form:

```
restrict option
```

where *option* is one or more of:

- `ignore` — All packets will be ignored, including `ntpq` and `ntpdc` queries.
- `kod` — a "Kiss-o'-death" packet is to be sent to reduce unwanted queries.
- `limited` — do not respond to time service requests if the packet violates the rate limit default values or those specified by the discard command. `ntpq` and `ntpdc` queries are not affected. For more information on the discard command and the default values, see [Configuring_NTP_Using_ntpd.adoc#s2_Configure_Rate_Limiting_Access_to_an_NTP_Service](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/servers/Configuring_NTP_Using_ntpd/#).
- `lowpriotrap` — traps set by matching hosts to be low priority.
- `nomodify` — prevents any changes to the configuration.
- `noquery` — prevents `ntpq` and `ntpdc` queries, but not time queries, from being answered.
- `nopeer` — prevents a peer association being formed.
- `noserve` — deny all packets except `ntpq` and `ntpdc` queries.
- `notrap` — prevents `ntpdc` control message protocol traps.
- `notrust` — deny packets that are not cryptographically authenticated.
- `ntpport` — modify the match algorithm to only apply the restriction if the source port is the standard `NTP` `UDP` port `123`.
- `version` — deny packets that do not match the current `NTP` version.

To configure rate limit access to not respond at all to a query, the respective restrict command has to have the `limited` option. If `ntpd` should reply with a `KoD` packet, the restrict command needs to have both `limited` and `kod` options.

The `ntpq` and `ntpdc` queries can be used in amplification attacks (see *[CVE-2013-5211](https://access.redhat.com/security/cve/CVE-2013-5211)* for more details), do not remove the `noquery` option from the restrict default command on publicly accessible systems.

### Configure Rate Limiting Access to an NTP Service

To enable rate limiting access to the `NTP` service running on a system, add the `limited` option to the restrict command as explained in [Configuring_NTP_Using_ntpd.adoc#s2-Configure_Access_Control_to_an_NTP_service](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/servers/Configuring_NTP_Using_ntpd/#). If you do not want to use the default discard parameters, then also use the discard command as explained here.

The discard command takes the following form:

```
discard average value minimum value monitor value
```

- `average` — specifies the minimum average packet spacing to be permitted, it accepts an argument in *log2* seconds. The default value is 3 (*23* equates to 8 seconds).
- `minimum` — specifies the minimum packet spacing to be permitted, it accepts an argument in *log2* seconds. The default value is 1 (*21* equates to 2 seconds).
- `monitor` — specifies the discard probability for packets once the permitted rate limits have been exceeded. The default value is 3000 seconds. This option is intended for servers that receive 1000 or more requests per second.

Examples of the discard command are as follows:

```
discard average 4
discard average 4 minimum 2
```

### Adding a Peer Address

To add the address of a peer, that is to say, the address of a server running an `NTP` service of the same stratum, make use of the peer command in the `ntp.conf` file.

The peer command takes the following form:

```
peer address
```

where *address* is an `IP` unicast address or a `DNS` resolvable name. The address must only be that of a system known to be a member of the same stratum. Peers should have at least one time source that is different to each other. Peers are normally systems under the same administrative control.

### Adding a Server Address

To add the address of a server, that is to say, the address of a server running an `NTP` service of a higher stratum, make use of the server command in the `ntp.conf` file.

The server command takes the following form:

```
server address
```

where *address* is an `IP` unicast address or a `DNS` resolvable name. The address of a remote reference server or local reference clock from which packets are to be received.

### Adding a Broadcast or Multicast Server Address

To add a broadcast or multicast address for sending, that is to say, the address to broadcast or multicast `NTP` packets to, make use of the broadcast command in the `ntp.conf` file.

The broadcast and multicast modes require authentication by default. See [Configuring_NTP_Using_ntpd.adoc#s1-Authentication_Options_for_NTP](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/servers/Configuring_NTP_Using_ntpd/#).

The broadcast command takes the following form:

```
broadcast address
```

where *address* is an `IP` broadcast or multicast address to which packets are sent.

This command configures a system to act as an `NTP` broadcast server. The address used must be a broadcast or a multicast address. Broadcast address implies the `IPv4` address `255.255.255.255`. By default, routers do not pass broadcast messages. The multicast address can be an `IPv4` Class D address, or an `IPv6` address. The IANA has assigned `IPv4` multicast address `224.0.1.1` and `IPv6` address `FF05::101` (site local) to `NTP`. Administratively scoped `IPv4` multicast addresses can also be used, as described in *[RFC 2365 Administratively Scoped IP Multicast](https://www.rfc-editor.org/info/rfc2365)*.

### Adding a Manycast Client Address

To add a manycast client address, that is to say, to configure a multicast address to be used for `NTP` server discovery, make use of the manycastclient command in the `ntp.conf` file.

The manycastclient command takes the following form:

```
manycastclient address
```

where *address* is an `IP` multicast address from which packets are to be received. The client will send a request to the address and select the best servers from the responses and ignore other servers. `NTP` communication then uses unicast associations, as if the discovered `NTP` servers were listed in `ntp.conf`.

This command configures a system to act as an `NTP` client. Systems can be both client and server at the same time.

### Adding a Broadcast Client Address

To add a broadcast client address, that is to say, to configure a broadcast address to be monitored for broadcast `NTP` packets, make use of the broadcastclient command in the `ntp.conf` file.

The broadcastclient command takes the following form:

```
broadcastclient
```

Enables the receiving of broadcast messages. Requires authentication by default. See [Configuring_NTP_Using_ntpd.adoc#s1-Authentication_Options_for_NTP](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/servers/Configuring_NTP_Using_ntpd/#).

This command configures a system to act as an `NTP` client. Systems can be both client and server at the same time.

### Adding a Manycast Server Address

To add a manycast server address, that is to say, to configure an address to allow the clients to discover the server by multicasting `NTP` packets, make use of the manycastserver command in the `ntp.conf` file.

The manycastserver command takes the following form:

```
manycastserver address
```

Enables the sending of multicast messages. Where *address* is the address to multicast to. This should be used together with authentication to prevent service disruption.

This command configures a system to act as an `NTP` server. Systems can be both client and server at the same time.

### Adding a Multicast Client Address

To add a multicast client address, that is to say, to configure a multicast address to be monitored for multicast `NTP` packets, make use of the multicastclient command in the `ntp.conf` file.

The multicastclient command takes the following form:

```
multicastclient address
```

Enables the receiving of multicast messages. Where *address* is the address to subscribe to. This should be used together with authentication to prevent service disruption.

This command configures a system to act as an `NTP` client. Systems can be both client and server at the same time.

### Configuring the Burst Option

Using the burst option against a public server is considered abuse. Do not use this option with public `NTP` servers. Use it only for applications within your own organization.

To increase the average quality of time offset statistics, add the following option to the end of a server command:

```
burst
```

At every poll interval, when the server responds, the system will send a burst of up to eight packets instead of the usual one packet. For use with the server command to improve the average quality of the time-offset calculations.

### Configuring the iburst Option

To improve the time taken for initial synchronization, add the following option to the end of a server command:

```
iburst
```

At every poll interval, send a burst of eight packets instead of one. When the server is not responding, packets are sent 16s apart. When the server responds, packets are sent every 2s. For use with the server command to reduce the time taken for initial synchronization. This is now a default option in the configuration file.

### Configuring Symmetric Authentication Using a Key

To configure symmetric authentication using a key, add the following option to the end of a server or peer command:

```
key number
```

where *number* is in the range `1` to `65534` inclusive. This option enables the use of a *message authentication code* (**MAC**) in packets. This option is for use with the peer, server, broadcast, and manycastclient commands.

The option can be used in the `/etc/ntp.conf` file as follows:

```
server 192.168.1.1 key 10
broadcast 192.168.1.255 key 20
manycastclient 239.255.254.254 key 30
```

See also [Configuring_NTP_Using_ntpd.adoc#s1-Authentication_Options_for_NTP](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/servers/Configuring_NTP_Using_ntpd/#).

### Configuring the Poll Interval

To change the default poll interval, add the following options to the end of a server or peer command:

```
minpoll value and maxpoll value
```

Options to change the default poll interval, where the interval in seconds will be calculated by raising 2 to the power of *value*, in other words, the interval is expressed in *log2* seconds. The default `minpoll` value is 6, *26* equates to 64s. The default value for `maxpoll` is 10, which equates to 1024s. Allowed values are in the range 3 to 17 inclusive, which equates to 8s to 36.4h respectively. These options are for use with the peer or server. Setting a shorter `maxpoll` may improve clock accuracy.

### Configuring Server Preference

To specify that a particular server should be preferred above others of similar statistical quality, add the following option to the end of a server or peer command:

```
prefer
```

Use this server for synchronization in preference to other servers of similar statistical quality. This option is for use with the peer or server commands.

### Configuring the Time-to-Live for NTP Packets

To specify that a particular *time-to-live* (**TTL**) value should be used in place of the default, add the following option to the end of a server or peer command:

```
ttl value
```

Specify the time-to-live value to be used in packets sent by broadcast servers and multicast `NTP` servers. Specify the maximum time-to-live value to use for the "expanding ring search" by a manycast client. The default value is `127`.

### Configuring the NTP Version to Use

To specify that a particular version of `NTP` should be used in place of the default, add the following option to the end of a server or peer command:

```
version value
```

Specify the version of `NTP` set in created `NTP` packets. The value can be in the range `1` to `4`. The default is `4`.

## Configuring the Hardware Clock Update

To configure the system clock to update the hardware clock, also known as the real-time clock (RTC), once after executing **ntpdate**, add the following line to `/etc/sysconfig/ntpdate`:

```
SYNC_HWCLOCK=yes
```

To update the hardware clock from the system clock, issue the following command as `root`:

```
~]# hwclock --systohc
```

When the system clock is being synchronized by `ntpd` or `chronyd`, the kernel will in turn update the RTC every 11 minutes automatically.

## Configuring Clock Sources

To list the available clock sources on your system, issue the following commands:

```
~]$ cd /sys/devices/system/clocksource/clocksource0/
clocksource0]$ cat available_clocksource
kvm-clock tsc hpet acpi_pm
clocksource0]$ cat current_clocksource
kvm-clock
```

In the above example, the kernel is using **kvm-clock**. This was selected at boot time as this is a virtual machine.

To override the default clock source, append the clocksource directive to the GRUB_CMDLINE_LINUX line in the `/etc/default/grub` file and rebuild the `grub.cfg` file. For example:

```
GRUB_CMDLINE_LINUX="rd.lvm.lv=rhel/root crashkernel=auto  rd.lvm.lv=rhel/swap vconsole.font=latarcyrheb-sun16 vconsole.keymap=us rhgb quiet clocksource=tsc"
```

The available clock source is architecture dependent.

Rebuild the `grub.cfg` file as follows:

- On BIOS-based machines, issue the following command as `root`:

```
~]# grub2-mkconfig -o /boot/grub2/grub.cfg
```

- On UEFI-based machines, issue the following command as `root`:

```
~]# grub2-mkconfig -o /boot/efi/EFI/redhat/grub.cfg
```

## Additional Resources

The following sources of information provide additional resources regarding `NTP` and `ntpd`.

### Installed Documentation

- `ntpd(8)` man page — Describes `ntpd` in detail, including the command line options.
- `ntp.conf(5)` man page — Contains information on how to configure associations with servers and peers.
- `ntpq(8)` man page — Describes the `NTP` query utility for monitoring and querying an `NTP` server.
- `ntpdc(8)` man page — Describes the `ntpd` utility for querying and changing the state of `ntpd`.
- `ntp_auth(5)` man page — Describes authentication options, commands, and key management for `ntpd`.
- `ntp_keygen(8)` man page — Describes generating public and private keys for `ntpd`.
- `ntp_acc(5)` man page — Describes access control options using the restrict command.
- `ntp_mon(5)` man page — Describes monitoring options for the gathering of statistics.
- `ntp_clock(5)` man page — Describes commands for configuring reference clocks.
- `ntp_misc(5)` man page — Describes miscellaneous options.
- `ntp_decode(5)` man page — Lists the status words, event messages and error codes used for `ntpd` reporting and monitoring.
- `ntpstat(8)` man page — Describes a utility for reporting the synchronization state of the `NTP` daemon running on the local machine.
- `ntptime(8)` man page — Describes a utility for reading and setting kernel time variables.
- `tickadj(8)` man page — Describes a utility for reading, and optionally setting, the length of the tick.

### Useful Websites

- http://doc.ntp.org/

  The NTP Documentation Archive

- https://www.eecis.udel.edu/~mills/ntp.html

  Network Time Synchronization Research Project.

- https://www.eecis.udel.edu/~mills/ntp/html/manyopt.html

  Information on Automatic Server Discovery in `NTPv4`.