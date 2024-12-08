# Ntp-NTS



Many computers use the Network Time Protocol (NTP) to synchronize their system clocks over the internet. NTP is one of the few unsecured internet protocols still in common use. An attacker that can observe network traffic between a client and server can feed the client with bogus data and, depending on the client’s implementation and configuration, force it to set its system clock to any time and date. Some programs and services might not work if the client’s system clock is not accurate. For example, a web browser will not work correctly if the web servers’ certificates appear to be expired according to the client’s system clock. Use Network Time Security (NTS) to secure NTP.



Fedora 33[1](https://fedoramagazine.org/secure-ntp-with-nts/#footnote1) is the first Fedora release to support NTS. NTS is a new authentication mechanism for NTP. It enables clients to verify that the packets they receive from the server have not been modified while in transit. The only thing an attacker can do when NTS is enabled is drop or delay packets. See [RFC8915](https://tools.ietf.org/html/rfc8915) for further details about NTS.

NTP can be secured well with symmetric keys. Unfortunately, the server has to have a different key for each client and the keys have to be securely distributed. That might be practical with a private server on a local network, but it does not scale to a public server with millions of clients.

NTS includes a Key Establishment (NTS-KE) protocol that automatically creates the encryption keys used between the server and its clients. It uses Transport Layer Security (TLS) on TCP port 4460. It is designed to scale to very large numbers of clients with a minimal impact on accuracy. The server does not need to keep any client-specific state. It provides clients with cookies, which are encrypted and contain the keys needed to authenticate the NTP packets. Privacy is one of the goals of NTS. The client gets a new cookie with each server response, so it doesn’t have to reuse cookies. This prevents passive observers from tracking clients migrating between networks.

The default NTP client in Fedora is *chrony*. Chrony added NTS support in version 4.0. The default configuration hasn’t changed. Chrony still uses public servers from the [pool.ntp.org](https://www.pool.ntp.org/) project and NTS is not enabled by default.

Currently, there are very few public NTP servers that support NTS. The two major providers are Cloudflare and Netnod. The [Cloudflare servers](https://developers.cloudflare.com/time-services/nts/usage) are in various places around the world. They use anycast addresses that should allow most clients to reach a close server. The [Netnod servers](https://www.netnod.se/time-and-frequency/how-to-use-nts) are located in Sweden. In the future we will probably see more public NTP servers with NTS support.

A general recommendation for configuring NTP clients for best reliability is to have at least three working servers. For best accuracy, it is recommended to select close servers to minimize network latency and asymmetry caused by asymmetric network routing. If you are not concerned about fine-grained accuracy, you can ignore this recommendation and use any NTS servers you trust, no matter where they are located.

If you do want high accuracy, but you don’t have a close NTS server, you can mix distant NTS servers with closer non-NTS servers. However, such a configuration is less secure than a configuration using NTS servers only. The attackers still cannot force the client to accept arbitrary time, but they do have a greater control over the client’s clock and its estimate of accuracy, which may be unacceptable in some environments.

## Enable client NTS in the installer

When installing Fedora 33, you can enable NTS in the *Time & Date* dialog in the *Network Time* configuration. Enter the name of the server and check the NTS support before clicking the **+** (Add) button. You can add one or more servers or pools with NTS. To remove the default pool of servers (*2.fedora.pool.ntp.org*), uncheck the corresponding mark in the *Use* column.

![img](https://fedoramagazine.org/wp-content/uploads/2020/10/anaconda-nts.png)Network Time configuration in Fedora installer

## Enable client NTS in the configuration file

If you upgraded from a previous Fedora release, or you didn’t enable NTS in the installer, you can enable NTS directly in */etc/chrony.conf*. Specify the server with the *nts* option in addition to the recommended *iburst* option. For example:

```
server time.cloudflare.com iburst nts
server nts.sth1.ntp.se iburst nts
server nts.sth2.ntp.se iburst nts
```

You should also allow the client to save the NTS keys and cookies to disk, so it doesn’t have to repeat the NTS-KE session on each start. Add the following line to *chrony.conf*, if it is not already present:

```
ntsdumpdir /var/lib/chrony
```

If you don’t want NTP servers provided by DHCP to be mixed with the servers you have specified, remove or comment out the following line in *chrony.conf*:

```
sourcedir /run/chrony-dhcp
```

After you have finished editing *chrony.conf*, save your changes and restart the *chronyd* service:

```
systemctl restart chronyd
```

## Check client status

Run the following command under the root user to check whether the NTS key establishment was successful:

```
# chronyc -N authdata
Name/IP address             Mode KeyID Type KLen Last Atmp  NAK Cook CLen
=========================================================================
time.cloudflare.com          NTS     1   15  256  33m    0    0    8  100
nts.sth1.ntp.se              NTS     1   15  256  33m    0    0    8  100
nts.sth2.ntp.se              NTS     1   15  256  33m    0    0    8  100
```

The *KeyID*, *Type*, and *KLen* columns should have non-zero values. If they are zero, check the system log for error messages from *chronyd*. One possible cause of failure is a firewall is blocking the client’s connection to the server’s TCP port ( port 4460).

Another possible cause of failure is a certificate that is failing to verify because the client’s clock is wrong. This is a chicken-or-the-egg type problem with NTS. You may need to manually correct the date or temporarily disable NTS in order to get NTS working. If your computer has a real-time clock, as almost all computers do, and it’s backed up by a good battery, this operation should be needed only once.

If the computer doesn’t have a real-time clock or battery, as is common with some small ARM computers like the Raspberry Pi, you can add the *-s* option to */etc/sysconfig/chronyd* to restore time saved on the last shutdown or reboot. The clock will be behind the true time, but if the computer wasn’t shut down for too long and the server’s certificates were not renewed too close to their expiration, it should be sufficient for the time checks to succeed. As a last resort, you can disable the time checks with the *nocerttimecheck* directive. See the *chrony.conf(5)* man page for details.

Run the following command to confirm that the client is making NTP measurements:

```
# chronyc -N sources
MS Name/IP address         Stratum Poll Reach LastRx Last sample               
===============================================================================
^* time.cloudflare.com           3   6   377    45   +355us[ +375us] +/-   11ms
^+ nts.sth1.ntp.se               1   6   377    44   +237us[ +237us] +/-   23ms
^+ nts.sth2.ntp.se               1   6   377    44   -170us[ -170us] +/-   22ms
```

The *Reach* column should have a non-zero value; ideally 377. The value 377 shown above is an octal number. It indicates that the last eight requests all had a valid response. The validation check will include NTS authentication if enabled. If the value only rarely or never gets to 377, it indicates that NTP requests or responses are getting lost in the network. Some major network operators are known to have middleboxes that block or limit rate of large NTP packets as a mitigation for amplification attacks that exploit the monitoring protocol of *ntpd*. Unfortunately, this impacts NTS-protected NTP packets, even though they don’t cause any amplification. The NTP working group is considering an alternative port for NTP as a workaround for this issue.

## Enable NTS on the server

If you have your own NTP server running *chronyd*, you can enable server NTS support to allow its clients to be synchronized securely. If the server is a client of other servers, it should use NTS or a symmetric key for its own synchronization. The clients assume the synchronization chain is secured between all servers up to the primary time servers.

Enabling server NTS is similar to enabling HTTPS on a web server. You just need a private key and certificate. The certificate could be signed by the Let’s Encrypt authority using the *certbot* tool, for example. When you have the key and certificate file (including intermediate certificates), specify them in *chrony.conf* with the following directives:

```
ntsserverkey /etc/pki/tls/private/foo.example.net.key
ntsservercert /etc/pki/tls/certs/foo.example.net.crt
```

Make sure the *ntsdumpdir* directive mentioned previously in the client configuration is present in *chrony.conf*. It allows the server to save its keys to disk, so the clients of the server don’t have to get new keys and cookies when the server is restarted.

Restart the *chronyd* service:

```
systemctl restart chronyd
```

If there are no error messages in the system log from *chronyd*, it should be accepting client connections. If the server has a firewall, it needs to allow both the UDP 123 and TCP 4460 ports for NTP and NTS-KE respectively.

You can perform a quick test from a client machine with the following command:

```
$ chronyd -Q -t 3 'server foo.example.net iburst nts maxsamples 1'
2020-10-13T12:00:52Z chronyd version 4.0 starting (+CMDMON +NTP +REFCLOCK +RTC +PRIVDROP +SCFILTER +SIGND +ASYNCDNS +NTS +SECHASH +IPV6 +DEBUG)
2020-10-13T12:00:52Z Disabled control of system clock
2020-10-13T12:00:55Z System clock wrong by -0.001032 seconds (ignored)
2020-10-13T12:00:55Z chronyd exiting
```

If you see a *System clock wrong* message, it’s working correctly.

On the server, you can use the following command to check how many NTS-KE connections and authenticated NTP packets it has handled:

```
# chronyc serverstats
NTP packets received       : 2143106240
NTP packets dropped        : 117180834
Command packets received   : 16819527
Command packets dropped    : 0
Client log records dropped : 574257223
NTS-KE connections accepted: 104
NTS-KE connections dropped : 0
Authenticated NTP packets  : 52139
```

If you see non-zero *NTS-KE connections accepted* and *Authenticated NTP packets*, it means at least some clients were able to connect to the NTS-KE port and send an authenticated NTP request.