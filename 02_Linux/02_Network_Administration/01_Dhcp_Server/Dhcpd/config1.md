# Config 1



## Step 1: Install DHCP Server on CentOS 8 / RHEL 8

Install DHCP server package using the dnf installer.

```
sudo dnf -y install dhcp-server 
```

This will install any dependency required to run DHCP Server on CentOS 8 / RHEL 8.

## Step 2: Configure DHCP Server on CentOS 8 / RHEL 8

Edit the DHCP server configuration file on CentOS 8 / RHEL 8.

```
sudo vi /etc/dhcp/dhcpd.conf 
```

My configuration file will be populated with these parameters:

- Domain name: **example.com**
- DNS Server: **ns1.example.com**
- DHCP network: **192.168.20.0**
- DHCP Subnet mask: **255.255.255.0**
- Range of IP addresses to allocate: **192.168.20.30** – **192.168.20.200**
- Default gateway: **192.168.20.1**
- DHCP Lease Time: **600**
- DHCP Maximum Lease Time: **7200**

The DHCP server configuration file looks like this:

```
# Set DNS name and DNS server's IP address or hostname
option domain-name     "example.com";
option domain-name-servers     ns1.example.com;

# Declare DHCP Server
authoritative;

# The default DHCP lease time
default-lease-time 600;

# Set the maximum lease time
max-lease-time 7200;

# Set Network address, subnet mask and gateway

subnet 192.168.20.0 netmask 255.255.255.0 {
    # Range of IP addresses to allocate
    range dynamic-bootp 192.168.20.30 192.168.20.200;
    # Provide broadcast address
    option broadcast-address 192.168.20.255;
    # Set default gateway
    option routers 192.168.20.1;
}
```

Start and enable the dhcpd service after making the changes in the configuration file.

```
sudo systemctl enable --now dhcpd
```

If you have firewalld running, allow the service port to be accessible from your network.

```
sudo firewall-cmd --add-service=dhcp --permanent 
sudo firewall-cmd --reload
```

## Step 3: Configure DHCP Client

Install DHCP client in your Linux machine to get an IP address automatically.

```
----------- CentOS 8 / RHEL 8 / Fedora -----------
$ sudo dnf -y install dhcp-client 

----------- CentOS 7/6 -----------
$ sudo yum -y install dhcp-client
```

### Manually request for DHCP IP address

You can use dhclient command to request for an IP address manually.

```
$ sudo dhclient <interface>
E.g:
$ sudo dhclient eth0

# Confirm
$ ip ad
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 52:54:00:10:47:63 brd ff:ff:ff:ff:ff:ff
    inet 192.168.20.106/24 brd 192.168.20.255 scope global noprefixroute dynamic eth0
       valid_lft 3594sec preferred_lft 3594sec
    inet6 fe80::5054:ff:fe10:4763/64 scope link 
       valid_lft forever preferred_lft forever
```

#### Persist configurations – CentOS / RHEL / Fedora with systemd

- Edit configurations with nmcli

```
ifname="eth0"
nmcli connection modify ${ifname} ipv4.method auto
nmcli connection down ${ifname}; nmcli connection up ${ifname}
```

- Manually edit network configuration file

```
$ sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE="eth0"
BOOTPROTO="dhcp"
ONBOOT="yes"
TYPE="Ethernet"
PERSISTENT_DHCLIENT="yes"
```