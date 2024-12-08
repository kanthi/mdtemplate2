# configuration



## Setup DHCP Server

The installation of dhcp package creates an empty configuration file under `/etc/dhcp/dhcpd.conf`. The Sample configuration file is located under `/usr/share/doc/dhcp-server/dhcpd.conf.example`. Therefore, you can optionally check this sample configuration to guide you on how to set up your dhcp configuration file or you can copy the sample configuration file to `/etc/dhcp/dhcpd.conf` overwriting the existing one and make necessary changes that best suits your network.

```
sudo \cp /usr/share/doc/dhcp-server/dhcpd.conf.example /etc/dhcp/dhcpd.conf
```

The backslash appended to cp command is ensures non-interactive overwrite.

There are two types of statements in the configuration file:

- `Parameters` which state how to perform a task, whether to perform a task, or what network configuration options to send to the client.
- `Declarations` which describe the topology of the network, describe the clients, provide addresses for the clients, or apply a group of parameters to a group of declarations.

Open the configuration file for editing and make adjustments as follows;

```
sudo vim /etc/dhcp/dhcpd.conf
```

Set the domain name;

```
# option definitions common to all supported networks...
# option domain-name "example.org"; < Comment or edit accordingly
option domain-name "example.com";
```

Set the DNS server’s hostname or IP address;

```
# option domain-name-servers ns1.example.org, ns2.example.org;
option domain-name-servers ns1.example.com, ns2.example.com;
```

Define the default as well as the max lease time. In this case, I will go with the defaults.

```
default-lease-time 600;
max-lease-time 7200;
```

Make your DHCP server the official DHCP server for the local network by uncommenting the line shown below.

```
# If this DHCP server is the official DHCP server for the local
# network, the authoritative directive should be uncommented.
#authoritative;  < uncomment this line
authoritative;
```

### Subnet Declaration

In order for the DHCP server to understand the network topology, you need to define DHCP subnet. For example, to configure the DHCP for the **192.168.10.0/24** LAN network, the declaration is defined as shown below;

Note that you can only serve DHCP requests for a subnet for which there is an interface configured in that subnet on the host machine.

```
subnet 192.168.43.0 netmask 255.255.255.0 {
  range 192.168.43.100 192.168.43.200;
  option domain-name-servers ns1.example.com, ns2.example.com;
  option domain-name "example.com";
  option routers 192.168.43.1;
  option broadcast-address 192.168.43.255;
  option time-offset              -18000;     # Eastern Standard Time
}
```

### Host Static IP address Assignment

To assign an IP address to a client based on the MAC address of the network interface card, use the `hardware ethernet` parameter within a `host` declaration.

```
host test {
   option host-name "test.com";
   hardware ethernet 08:00:27:15:b4:72;
   fixed-address 192.168.43.155;
}
```

### Shared Network Declaration.

All subnets that share the same physical network should be declared within a `shared-network` declaration. Parameters within the `shared-network`, but outside the enclosed subnet declarations, are considered to be global parameters.

```
shared-network test {
    # global parameters for shared network
    option domain-search            "example.com";
    option domain-name-servers      ns1.example.com, ns2.example.com;
    option routers                  192.168.25.2;
    subnet 192.168.30.0 netmask 255.255.255.0 {
        #parameters for subnet 192.168.30.0/24
        range 192.168.30.1 192.168.30.254;
    }
    subnet 192.168.70.0 netmask 255.255.255.0 {
        #parameters for subnet 192.168.70.0/24
        range 192.168.70.1 192.168.70.254;
    }
}
```

### Group Declaration

The `group` declaration is used to apply global parameters to a group of declarations.

```
group {
   option routers                  192.168.10.3;
   option subnet-mask              255.255.255.0;
   option domain-search              "example.com";
   option domain-name-servers      192.168.10.1;
   option time-offset              -18000;     # Eastern Standard Time
   host server01 {
      option host-name "srv01.example.com";
      hardware ethernet 08:00:27:25:d4:72;
      fixed-address 192.168.10.27;
   }
   host server02 {
      option host-name "svr02.example.com";
      hardware ethernet 08:00:27:05:b3:52;
      fixed-address 192.168.10.30;
   }
}
```

Once you are done making your server configurations, start DHCP server and enable it to run on system boot.

```
sudo systemctl start dhcpd
sudo systemctl enable dhcpd
```

If Firewalld is running, allow DHCP service. DHCP uses 67/UDP.

```
sudofirewall-cmd --add-service=dhcp --permanent
sudo firewall-cmd --reload
```

## DHCP Client Configuration

Now that your DHCP server is ready to serve out dynamic IP addresses, you can set up the DHCP client to validate all this. In this case am going to test this using Ubuntu 18 for static IP assignment (192.168.43.155) and Fedora 29 server for dynamic IP assignment within the range 192.168.43.100 192.168.43.200 as defined above.