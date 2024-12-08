# Install



### Disable Chrony

Chrony is another versatile implementation of the NTP that can be used as a replacement of the the default user space NTP daemon and is installed by default on Fedora 30.

```
rpm -qa | grep chrony
chrony-3.4-2.fc30.x86_64
```

Both Chrony Daemon (chronyd) and NTPd cannot run at the same time and hence stop and disable Chrony Daemon so as to use NTPd.

```
systemctl stop chronyd
systemctl disable chronyd
```

### nstall NTP Daemon (ntpd)

NTP daemon is provided by the ntp package which is available by default on Fedora 30 repos.

```
dnf install ntp
```