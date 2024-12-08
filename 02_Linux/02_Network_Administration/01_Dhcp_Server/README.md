# DHCP

**DHCP (Dynamic Host Configuration Protocol)** is a network protocol used for assigning an IP address to network clients dynamically from pre-defined IP pool. It is useful for LAN network, but not generally used for production servers. DHCP works on the concept of a ‘lease’ ( amount ) of time that a given IP address will be valid for a network computer. The lease time can vary depending on how long a user is likely to require the Internet connection or DHCP configuration.

## IP Assignment Process of DHCP Server

1. When a client computer starts, If it is configured to use DHCP Server to get IP address.
2. Client Computer sends a **DISCOVER** broadcast request on network.
3. DHCP server received this request and sends an **OFFER** packet back to client.
4. After getting offer packet, client sends a **REQUEST** packet to DHCP server to assign his an IP.
5. DHCP Server assigned the IP to client computer and sends a **ACK** packet to client.



![DHCP](./img/dhcp.png)



## More About DHCP Protocol

- DHCP is a connection less protocol.
- DHCP uses destination UDP port 67 for sending data to the server, and UDP port 68 for data to the client.
- DHCP process is often abbreviated as **DORA** (Discovery, Offer, Request, Acknowledgement).
- DHCP servers and clients initially communicates via UDP broadcasts on the same subnet.
- DHCP Helper or DHCP Relay Agent may be used if servers and client are on different subnet.
- Clients communicate directly via UDP unicast, requesting renewal of an existing lease.