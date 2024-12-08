# Firewalld

Firewalld provides a dynamically managed firewall with support for network/firewall zones that define the trust level of network connections or interfaces. It has support for IPv4, IPv6 firewall settings, ethernet bridges and IP sets. There is a separation of runtime and permanent configuration options. It also provides an interface for services or applications to add firewall rules directly.

## Benefits of using firewalld

Changes can be done immediately in the runtime environment. No restart of the service or daemon is needed.

With the firewalld D-Bus interface it is simple for services, applications and also users to adapt firewall settings. The interface is complete and is used for the firewall configuration tools firewall-cmd, firewall-config and firewall-applet.

The separation of the runtime and permanent configuration makes it possible to do evaulation and tests in runtime. The runtime configuration is only valid up to the next service reload and restart or to a system reboot. Then the permanent configuration will be loaded again. With the runtime environment it is possible to use runtime for settings that should only be active for a limited amount of time. If the runtime configuration has been used for evaluation, and it is complete and working, then it is possible to save this configuration to the permanent environment.

## Features

- Complete D-Bus API
- IPv4, IPv6, bridge and ipset support
- IPv4 and IPv6 NAT support
- Firewall zones
- Predefined list of zones, services and icmptypes
- Simple service, port, protocol, source port, masquerading, port forwarding, icmp filter, rich rule, interface and source address handlig in zones
- Simple service definition with ports, protocols, source ports, modules (netfilter helpers) and destination address handling
- Rich Language for more flexible and complex rules in zones
- Timed firewall rules in zones
- Simple log of denied packets
- Direct interface
- Lockdown: Whitelisting of applications that may modify the firewall
- Automatic loading of Linux kernel modules
- Integration with Puppet
- Command line clints for online and offline configuration
- Graphical configuration tool using gtk3
- Applet using Qt4

## Who is using it?

firewalld is used in the following Linux distributions as the default firewall management tool:

- RHEL 7 and newer
- CentOS 7 and newer
- Fedora 18 and newer
- SUSE 15 and newer
- OpenSUSE 15 and newer
- Available for several other distributions

Applications and libraries which support firewalld as a firewall management tool include:

- [NetworkManager](https://wiki.gnome.org/Projects/NetworkManager)
- [libvirt](http://libvirt.org/)
- [podman](https://podman.io/)
- [docker](http://docker.com/) (iptables backend only)
- [fail2ban](http://www.fail2ban.org/)



























A firewall is a method for monitoring and filtering incoming and outgoing network traffic. It works by defining a set of security rules that determine whether to allow or block specific traffic. A properly configured firewall is one of the most important aspects of overall system security.

CentOS 8 ships with a firewall daemon named [firewalld](https://firewalld.org/). It is a complete solution with a D-Bus interface that allows you to manage the system’s firewall dynamically.

In this tutorial, we will talk about how to configure and manage the firewall on CentOS 8. We’ll also explain the basic FirewallD concepts.

## Prerequisites

To configure the firewall service, you must be logged as root or [user with sudo privileges](https://linuxize.com/post/create-a-sudo-user-on-centos/).

## Basic Firewalld Concepts

firewalld uses the concepts of zones and services. Based on the zones and services you’ll configure, you can control what traffic is allowed or blocked to and from the system.

In CentOS 8, iptables is replaced by nftables as the default firewall backend for the firewalld daemon.

### Firewalld Zones

Zones are predefined sets of rules that specify the level of trust of the networks your computer is connected to. You can assign network interfaces and sources to a zone.

Below are the zones provided by FirewallD ordered according to the trust level of the zone from untrusted to trusted:

- **drop**: All incoming connections are dropped without any notification. Only outgoing connections are allowed.
- **block**: All incoming connections are rejected with an `icmp-host-prohibited` message for `IPv4` and `icmp6-adm-prohibited` for IPv6n. Only outgoing connections are allowed.
- **public**: For use in untrusted public areas. You do not trust other computers on the network, but you can allow selected incoming connections.
- **external**: For use on external networks with NAT masquerading enabled when your system acts as a gateway or router. Only selected incoming connections are allowed.
- **internal**: For use on internal networks when your system acts as a gateway or router. Other systems on the network are generally trusted. Only selected incoming connections are allowed.
- **dmz**: Used for computers located in your demilitarized zone that have limited access to the rest of your network. Only selected incoming connections are allowed.
- **work**: Used for work machines. Other computers on the network are generally trusted. Only selected incoming connections are allowed.
- **home**: Used for home machines. Other computers on the network are generally trusted. Only selected incoming connections are allowed.
- **trusted**: All network connections are accepted. Trust all of the computers in the network.

### Firewall services

Firewalld services are predefined rules that apply within a zone and define the necessary settings to allow incoming traffic for a specific service. The services allows you to easily perform several tasks in a single step.

For example, the service can contain definitions about opening ports, forwarding traffic, and more.

### Firewalld Runtime and Permanent Settings

Firewalld uses two separated configuration sets, runtime, and permanent configuration.

The runtime configuration is the actual running configuration and does not persist on reboot. When the firewalld daemon starts, it loads the permanent configuration, which becomes the runtime configuration.



By default, when making changes to the Firewalld configuration using the `firewall-cmd` utility, the changes are applied to the runtime configuration. To make the changes permanent append the `--permanent` option to the command.

To apply the changes in both configuration sets, you can use one of the following two methods:

1. Change the runtime configuration and make it permanent:

   ```
   sudo firewall-cmd <options>sudo firewall-cmd --runtime-to-permanent
   ```

2. Change the permanent configuration and reload the firewalld daemon:

   ```
   sudo firewall-cmd --permanent <options>sudo firewall-cmd --reload
   ```

## Enabling FirewallD

On CentOS 8, firewalld is installed and enabled by default. If for some reason it is not installed on your system, you can install and start the daemon by typing:



```
sudo dnf install firewalldsudo systemctl enable firewalld --now
```

You can check the status of the firewall service with:

```
sudo firewall-cmd --state
```

If the firewall is enabled, the command should print `running`. Otherwise, you will see `not running`.

## Firewalld Zones

If you haven’t changed it, the default zone is set to `public`, and all network interfaces are assigned to this zone.

The default zone is the one that is used for everything that is not explicitly assigned to another zone.

You can see the default zone by typing:

```
sudo firewall-cmd --get-default-zone
public
```

To get a list of all available zones, type:



```
sudo firewall-cmd --get-zones
block dmz drop external home internal public trusted work
```

To see the active zones and the network interfaces assigned to them:

```
sudo firewall-cmd --get-active-zones
```

The output below shows that the interfaces `eth0` and `eth1` are assigned to the `public` zone:

```output
public
  interfaces: eth0 eth1
```

You can print the zone configuration settings with:

```
sudo firewall-cmd --zone=public --list-all
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: eth0 eth1
  sources:
  services: ssh dhcpv6-client
  ports:
  protocols:
  masquerade: no
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:
```

From the output above, we can see that the public zone is active and uses the default target, which is `REJECT`. The output also shows that the zone is used by the `eth0` and `eth1` interfaces and allows DHCP client and SSH traffic.



If you want to check the configurations of all available zones type:

```
sudo firewall-cmd --list-all-zones
```

The command prints a huge list with the settings of all available zone.

### Changing the zone target

The target defines the default behavior of the zone for the incoming traffic that is not specified. It can be set to one of the following options: `default`, `ACCEPT`, `REJECT`, and `DROP`.

To set the zone’s target, specify the zone with the `--zone` option and the target with the `--set-target` option.

For example, to change the `public` zone’s target to `DROP` you would run:

```
sudo firewall-cmd --zone=public --set-target=DROP
```

### Assigning an interface to a different zone

You can create specific sets of rules for different zones and assign different interfaces to them. This is especially useful when you multiple interfaces on your machine.

To assign an interface to a different zone, specify the zone with the `--zone` option and the interface with the `--change-interface` option.

For example, the following command assigns the `eth1` interface to the `work` zone:

```
sudo firewall-cmd --zone=work --change-interface=eth1
```

Verify the changes by typing:

```
sudo firewall-cmd --get-active-zones
work
  interfaces: eth1
public
  interfaces: eth0
```

### Changing the Default Zone

To change the default zone, use the `--set-default-zone` option followed by the name of the zone you want to make default.

For example, to change the default zone to `home` you would run the following command:

```
sudo firewall-cmd --set-default-zone=home
```

Verify the changes with:

```
sudo firewall-cmd --get-default-zone
home
```

### Creating new Zones

Firewalld also allows you to create your own zones. This is handy when you want to create per-application rules.

In the following example we’ll create a new zone named `memcached`, open the port `11211` and allow access only from the `192.168.100.30` IP address:

1. Create the zone:

   ```
   sudo firewall-cmd --new-zone=memcached --permanent
   ```

2. Add the rules to the zone:

   ```
   sudo firewall-cmd --zone=memcached --add-port=11211/udp --permanentsudo firewall-cmd --zone=memcached --add-port=11211/tcp --permanentsudo firewall-cmd --zone=memcached --add-source=192.168.100.30/32 --permanent
   ```

3. Reload the firewalld daemon to activate the changes:

   ```
   sudo firewall-cmd --reload
   ```

## Firewalld Services

With firewalld you can allow traffic for specific ports and/or sources based on predefined rules called services.

To get a list of all default available services type:

```
sudo firewall-cmd --get-services
```

You can find more information about each service by opening the associated .xml file within the `/usr/lib/firewalld/services` directory. For example, the HTTP service is defined like this:

/usr/lib/firewalld/services/http.xml

```xml
<?xml version="1.0" encoding="utf-8"?>
<service>
  <short>WWW (HTTP)</short>
  <description>HTTP is the protocol used to serve Web pages. If you plan to make your Web server publicly available, enable this option. This option is not required for viewing pages locally or developing Web pages.</description>
  <port protocol="tcp" port="80"/>
</service>
```

Copy

To allow incoming HTTP traffic (port 80) for interfaces in the public zone, only for the current session (runtime configuration) type:

```
sudo firewall-cmd --zone=public --add-service=http
```

If you are modifying the default zone you can leave out the `--zone` option.

To verify that the service was added successfully use the `--list-services` option:

```
sudo firewall-cmd --zone=public --list-services
ssh dhcpv6-client http
```

To keep the port 80 open after a reboot run the same command once again with the `--permanent` option, or execute:

```
sudo firewall-cmd --runtime-to-permanent
```

Use the `--list-services` along with the `--permanent` option to verify your changes:

```
sudo firewall-cmd --permanent --zone=public --list-services
ssh dhcpv6-client http
```

The syntax for removing service is the same as when adding one. Just use `--remove-service` instead of the `--add-service` flag:

```
sudo firewall-cmd --zone=public --remove-service=http --permanent
```

The command above removes the `http` service from the public zone permanent configuration.

### Creating a new FirewallD Service

As we have already mentioned, the default services are stored in the `/usr/lib/firewalld/services` directory. The easiest way to create a new service is to copy an existing service file to the `/etc/firewalld/services` directory, which is the location for user-created services and modify the file settings.

For example, to create a service definition for the Plex Media Server, you can use the SSH service file:

```
sudo cp /usr/lib/firewalld/services/ssh.xml /etc/firewalld/services/plexmediaserver.xml
```

Open the newly created `plexmediaserver.xml` file and change the short name and description for the service within the `` and `` tags. The most important tag you need to change is the `port` tag, which defines the port number and protocol you want to open.

In the following example, we are opening ports `1900` UDP and `32400` TCP.

/etc/firewalld/services/plexmediaserver.xml

```xml
<?xml version="1.0" encoding="utf-8"?>
<service version="1.0">
<short>plexmediaserver</short>
<description>Plex is a streaming media server that brings all your video, music and photo collections together and stream them to your devices at anytime and from anywhere.</description>
<port protocol="udp" port="1900"/>
<port protocol="tcp" port="32400"/>
</service>
```

Copy

Save the file and reload the FirewallD service:

```
sudo firewall-cmd --reload
```

You can now use the `plexmediaserver` service in your zones same as any other service.

## Opening Ports and Source IPs

Firewalld also allows you to quickly enable all traffic from a trusted IP address or on a specific port without creating a service definition.

### Opening a source IP

To allow all incoming traffic from a specific IP address (or range), specify the zone with the `--zone` option and the source IP with the `--add-source` option.

For example, to allow all incoming traffic from 192.168.1.10 in the `public` zone, run:

```
sudo firewall-cmd --zone=public --add-source=192.168.1.10
```

Make the new rule persistent:

```
sudo firewall-cmd --runtime-to-permanent
```

Verify the changes using the following command:

```
sudo firewall-cmd --zone=public --list-sources
192.168.1.10
```

The syntax for removing a source IP is the same as when adding one. Just use `--remove-source` instead of the `--add-source` option:

```
sudo firewall-cmd --zone=public --remove-source=192.168.1.10
```

### Opening a source port

To allow all incoming traffic on a given port, specify the zone with the `--zone` option and the port and the protocol with the `--add-port` option.

For example, to open port `8080` in the public zone for the current session you wound run:

```
sudo firewall-cmd --zone=public --add-port=8080/tcp
```

The protocol can be either `tcp`, `udp`, `sctp`, or `dccp`.

Verify the changes:

```
sudo firewall-cmd --zone=public --list-ports
8080
```

To keep the port open after a reboot, add the rule to the permanent settings by running the same command using the `--permanent` flag or by executing:

```
sudo firewall-cmd --runtime-to-permanent
```

The syntax for removing a port is the same as when adding a port. Just use `--remove-port` instead of the `--add-port` option.

```
sudo firewall-cmd --zone=public --remove-port=8080/tcp
```

## Forwarding Ports

To forward traffic from one port to another port, first enable masquerading for the desired zone using the `--add-masquerade` option. For example, to enable masquerading for the `external` zone, type:

```
sudo firewall-cmd --zone=external --add-masquerade
```

### Forward traffic from one port to another on the IP address

In the following example we are forwarding the traffic from port `80` to port `8080` on the same server:

```
sudo firewall-cmd --zone=external --add-forward-port=port=80:proto=tcp:toport=8080
```

### Forward traffic to another IP address

In the following example we are forwarding the traffic from port `80` to port `80` on a server with IP `10.10.10.2`:

```
sudo firewall-cmd --zone=external --add-forward-port=port=80:proto=tcp:toaddr=10.10.10.2
```

### Forward traffic to another server on a different port

In the following example we are forwarding the traffic from port `80` to port `8080` on a server with IP `10.10.10.2`:

```
sudo firewall-cmd --zone=external --add-forward-port=port=80:proto=tcp:toport=8080:toaddr=10.10.10.2
```

To make the forward rule persistent, use:

```
sudo firewall-cmd --runtime-to-permanent
```

## Conclusion

You have learned how to configure and manage the firewalld service on your CentOS 8 system.