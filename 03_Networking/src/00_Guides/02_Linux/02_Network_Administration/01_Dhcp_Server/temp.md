# temp



A DHCP Server dynamically assigns unique IP addresses, default gateways and other network parameters to client devices in a network. Since not all customers are simultaneously on the Internet, a client host dynamically obtains an address for a short period of time and releases it for use by some other client.

![img](https://miro.medium.com/max/60/1*Cmg6P9pyftAU9qr5vyDW9Q.jpeg?q=20)

![img](https://miro.medium.com/max/1024/1*Cmg6P9pyftAU9qr5vyDW9Q.jpeg)

# DHCP Components

**DHCP client**: a host using DHCP to obtain an IP address and other configuration information

**DHCP server**: a host that returns IP addresses and other configuration information

**BOOTP relay agents**: host or router that passes DHCP messages between DHCP clients and DHCP servers.

![img](https://miro.medium.com/max/60/1*Mc60RkwMi-MPf9XiBWIDTw.png?q=20)

![img](https://miro.medium.com/max/586/1*Mc60RkwMi-MPf9XiBWIDTw.png)

# DHCP process

\1. Client startup TCP/IP operations. Broadcasts a request for address information.

\2. The DHCP server receives the request, assigns a new address for a specific time period (called a lease period) and sends it to the client together with the other required configuration information.

\3. This information is acknowledged by the client and used to set up its configuration.

The DHCP server will not reallocate the address during the lease period and will attempt to return the same address every time the client requests an address.

DHCPDISCOVER is broadcast because the client does not know the IP address of DHCP server; BOOTP relay agents may relay it to other DHCP servers

One or more DHCP servers respond with DHCPOFFER.

If the client receives no DHCP offer before it times out, it retransmits DHCPDISCOVER. The client may wait for multiple replies and then choose one offer. It broadcasts DHCPREQUEST with ‘server identifier’ option included identifying the server whose offer it has accepted and ‘requested IP address’ option. Client SHOULD probe address with an ARP; if the client detects that the address is already in use, it issues DHCPDECLINE.

Servers other than the one selected in the DHCPREQUEST will release their offered addresses, while the selected server will note the binding. If the selected server cannot meet the needs of the DHCPREQ. it sends a DHCPNAK. If the client does not receive a DHCPACK or DHCPNAK before timeout it resends DHCPREQ.

# Install and configure DHCP Sever in Fedora

Step 1: Install the DHCP server package by running the commands below

sudo yum install dhcp

![img](https://miro.medium.com/max/60/1*p-CH82YzQfqY1xoWigIizg.jpeg?q=20)

![img](https://miro.medium.com/max/711/1*p-CH82YzQfqY1xoWigIizg.jpeg)

The installation of the DHCP package creates an empty configuration file under **/etc/dhcp/dhcpd.conf**. The Sample configuration file is located under **/usr/share/doc/dhcp-server/dhcpd.conf.example**. Therefore, you can optionally check this sample configuration to guide you on how to set up your DHCP configuration file or you can copy the sample configuration file to **/etc/dhcp/dhcpd.conf.** overwriting the existing one and make necessary changes that best suits your network.

Step2 :

sudo \cp /usr/share/doc/dhcp-server/dhcpd.conf.example /etc/dhcp/dhcpd.conf

![img](https://miro.medium.com/max/60/1*UjSdciYQAXt8XNWSFJuIYw.jpeg?q=20)

![img](https://miro.medium.com/max/709/1*UjSdciYQAXt8XNWSFJuIYw.jpeg)

Step3: Open the configuration file for editing and make adjustments as follows,

sudo vim /etc/dhcp/dhcpd.conf

Set the domain name (sysadmin.mit.com).

Set the DNS server’s hostname or IP address (dns.sysadmin.mit.com).

Define the default as well as the max lease time. or leave it to defaults.

Make your DHCP server the official DHCP server for the local network by uncommenting the line shown below.

```
# If this DHCP server is the official DHCP server for the local
# network, the authoritative directive should be uncommented.
#authoritative;  < uncomment this line
authoritative;
```

![img](https://miro.medium.com/max/60/1*UtHH8-4_DcKsWVIl1Vbn-g.jpeg?q=20)

![img](https://miro.medium.com/max/712/1*UtHH8-4_DcKsWVIl1Vbn-g.jpeg)

Step4: Subnet Declaration

In order for the DHCP server to understand the network topology, you need to define DHCP subnet. For example, to configure the DHCP for the **192.168.10.0/24** LAN network, the declaration is defined as shown below;

Note that you can only serve DHCP requests for a subnet for which there is an interface configured in that subnet on the host machine.

```
subnet 192.168.10.0 netmask 255.255.255.0 {
  range 192.168.10.100 192.168.10.120;
  option domain-name-servers Mainserver.sysadmin.mit.com;
  option domain-name "sysadmin.mit.com";
  option routers 192.168.10.1;
  option broadcast-address 192.168.10.255;
  option time-offset              -18000;     # Eastern Standard Time
```

![img](https://miro.medium.com/max/60/1*aeRhfAvJQxXyDlMPy66X7Q.jpeg?q=20)

![img](https://miro.medium.com/max/648/1*aeRhfAvJQxXyDlMPy66X7Q.jpeg)

Step5: Save the file

Step6: systemctl restart network.service

Step7: systemctl start dhcpd

Step8: shutdown fedora pc

Step9: turn on fedora pc

step10: Set the Static ip Address

Check which interface(s) you want to set as static by **ifconfig command.**

Next, edit the config file for the required interface.

```
vi /etc/sysconfig/network-scripts/ifcfg-enp0s3
```

Edit the config file by changing the BOOTPROTO from “dhcp” to “static”. Also adding IPADDR, NETMASK, BROADCAST and NETWORK variables and make sure ONBOOT is set to yes.

save the file.

Apply the Settings by restarting the network service to apply the settings.

```
systemctl restart network.service
systemctl start dhcpd
```

# **Dhcp client Configuration (using ubuntu)**

In order to configure your Ubuntu distribution to be a DHCP client, you need to modify the **/etc/network/interfaces** file. You will need to add the following line to the file:

*iface INTERFACE inet dhcp*

![img](https://miro.medium.com/max/60/1*RDrexAcecMfsaaktEdpiMQ.jpeg?q=20)

![img](https://miro.medium.com/max/640/1*RDrexAcecMfsaaktEdpiMQ.jpeg)

For example, to configure the **eth0** interface as a DHCP client, we would add the following configuration:

![img](https://miro.medium.com/max/60/1*Pjowg3TwOhy4EQDx2HxbZA.jpeg?q=20)

![img](https://miro.medium.com/max/639/1*Pjowg3TwOhy4EQDx2HxbZA.jpeg)

To check whether the IP is in the given range which is from 192.168.10.100 to 192.168.10.120, use **ifconfig** command.

![img](https://miro.medium.com/max/60/1*oZW88vB2I0mHttzzdHNeww.jpeg?q=20)

![img](https://miro.medium.com/max/638/1*oZW88vB2I0mHttzzdHNeww.jpeg)

Since the ip address is 192.168.10.100 it is in the range we assigned.