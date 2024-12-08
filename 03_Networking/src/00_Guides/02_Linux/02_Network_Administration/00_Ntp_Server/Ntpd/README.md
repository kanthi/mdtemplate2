# Ntpd



## Introduction to NTP

The *Network Time Protocol* (**NTP**) enables the accurate dissemination of time and date information in order to keep the time clocks on networked computer systems synchronized to a common reference over the network or the Internet. Many standards bodies around the world have atomic clocks which may be made available as a reference. The satellites that make up the Global Position System contain more than one atomic clock, making their time signals potentially very accurate. Their signals can be deliberately degraded for military reasons. An ideal situation would be where each site has a server, with its own reference clock attached, to act as a site-wide time server. Many devices which obtain the time and date via low frequency radio transmissions or the Global Position System (GPS) exist. However for most situations, a range of publicly accessible time servers connected to the Internet at geographically dispersed locations can be used. These `NTP` servers provide "*Coordinated Universal Time*" (**UTC**). Information about these time servers can found at *www.pool.ntp.org*.

Accurate time keeping is important for a number of reasons in IT. In networking for example, accurate time stamps in packets and logs are required. Logs are used to investigate service and security issues and so time stamps made on different systems must be made by synchronized clocks to be of real value. As systems and networks become increasingly faster, there is a corresponding need for clocks with greater accuracy and resolution. In some countries there are legal obligations to keep accurately synchronized clocks. Please see *www.ntp.org* for more information. In Linux systems, `NTP` is implemented by a daemon running in user space. The default `NTP` user space daemon in Fedora Rawhide is `chronyd`. It must be disabled if you want to use the `ntpd` daemon. See [Configuring NTP Using the chrony Suite](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/servers/Configuring_NTP_Using_the_chrony_Suite/#ch-Configuring_NTP_Using_the_chrony_Suite) for information on **chrony**.

The user space daemon updates the system clock, which is a software clock running in the kernel. Linux uses a software clock as its system clock for better resolution than the typical embedded hardware clock referred to as the "*Real Time Clock*" **(RTC)**. See the `rtc(4)` and `hwclock(8)` man pages for information on hardware clocks. The system clock can keep time by using various clock sources. Usually, the *Time Stamp Counter* (**TSC**) is used. The TSC is a CPU register which counts the number of cycles since it was last reset. It is very fast, has a high resolution, and there are no interrupts. On system start, the system clock reads the time and date from the RTC. The time kept by the RTC will drift away from actual time by up to 5 minutes per month due to temperature variations. Hence the need for the system clock to be constantly synchronized with external time references. When the system clock is being synchronized by `ntpd`, the kernel will in turn update the RTC every 11 minutes automatically.

## NTP Strata

`NTP` servers are classified according to their synchronization distance from the atomic clocks which are the source of the time signals. The servers are thought of as being arranged in layers, or strata, from 1 at the top down to 15. Hence the word stratum is used when referring to a specific layer. Atomic clocks are referred to as Stratum 0 as this is the source, but no Stratum 0 packet is sent on the Internet, all stratum 0 atomic clocks are attached to a server which is referred to as stratum 1. These servers send out packets marked as Stratum 1. A server which is synchronized by means of packets marked stratum `n` belongs to the next, lower, stratum and will mark its packets as stratum `n+1`. Servers of the same stratum can exchange packets with each other but are still designated as belonging to just the one stratum, the stratum one below the best reference they are synchronized to. The designation Stratum 16 is used to indicate that the server is not currently synchronized to a reliable time source.

Note that by default `NTP` clients act as servers for those systems in the stratum below them.

Here is a summary of the `NTP` Strata:

- Stratum 0

  Atomic Clocks and their signals broadcast over Radio and GPSGPS (Global Positioning System)Mobile Phone SystemsLow Frequency Radio Broadcasts+ WWVB (Colorado, USA.), JJY-40 and JJY-60 (Japan), DCF77 (Germany), and MSF (United Kingdom)These signals can be received by dedicated devices and are usually connected by RS-232 to a system used as an organizational or site-wide time server.

- Stratum 1

  Computer with radio clock, GPS clock, or atomic clock attached

- Stratum 2

  Reads from stratum 1; Serves to lower strata

- Stratum 3

  Reads from stratum 2; Serves to lower strata

- Stratum *n+1*

  Reads from stratum *n*; Serves to lower strata

- Stratum 15

  Reads from stratum 14; This is the lowest stratum.

This process continues down to Stratum 15 which is the lowest valid stratum. The label Stratum 16 is used to indicated an unsynchronized state.

## Understanding NTP

The version of `NTP` used by Fedora is as described in *[RFC 1305 Network Time Protocol (Version 3) Specification, Implementation and Analysis](https://www.rfc-editor.org/info/rfc1305)* and *[RFC 5905 Network Time Protocol Version 4: Protocol and Algorithms Specification](https://www.rfc-editor.org/info/rfc5905)*

This implementation of `NTP` enables sub-second accuracy to be achieved. Over the Internet, accuracy to 10s of milliseconds is normal. On a Local Area Network (LAN), 1 ms accuracy is possible under ideal conditions. This is because clock drift is now accounted and corrected for, which was not done in earlier, simpler, time protocol systems. A resolution of 233 picoseconds is provided by using 64-bit time stamps. The first 32-bits of the time stamp is used for seconds, the last 32-bits are used for fractions of seconds.

`NTP` represents the time as a count of the number of seconds since 00:00 (midnight) 1 January, 1900 GMT. As 32-bits is used to count the seconds, this means the time will "roll over" in 2036. However `NTP` works on the difference between time stamps so this does not present the same level of problem as other implementations of time protocols have done. If a hardware clock that is within 68 years of the correct time is available at boot time then `NTP` will correctly interpret the current date. The `NTP4` specification provides for an "Era Number" and an "Era Offset" which can be used to make software more robust when dealing with time lengths of more than 68 years. Note, please do not confuse this with the Unix Year 2038 problem.

The `NTP` protocol provides additional information to improve accuracy. Four time stamps are used to allow the calculation of round-trip time and server response time. In order for a system in its role as `NTP` client to synchronize with a reference time server, a packet is sent with an "originate time stamp". When the packet arrives, the time server adds a "receive time stamp". After processing the request for time and date information and just before returning the packet, it adds a "transmit time stamp". When the returning packet arrives at the `NTP` client, a "receive time stamp" is generated. The client can now calculate the total round trip time and by subtracting the processing time derive the actual traveling time. By assuming the outgoing and return trips take equal time, the single-trip delay in receiving the `NTP` data is calculated. The full `NTP` algorithm is much more complex than presented here.

When a packet containing time information is received it is not immediately responded to, but is first subject to validation checks and then processed together with several other time samples to arrive at an estimate of the time. This is then compared to the system clock to determine the time offset, the difference between the system clock’s time and what `ntpd` has determined the time should be. The system clock is adjusted slowly, at most at a rate of 0.5ms per second, to reduce this offset by changing the frequency of the counter being used. It will take at least 2000 seconds to adjust the clock by 1 second using this method. This slow change is referred to as slewing and cannot go backwards. If the time offset of the clock is more than 128ms (the default setting), `ntpd` can "step" the clock forwards or backwards. If the time offset at system start is greater than 1000 seconds then the user, or an installation script, should make a manual adjustment. See [Configuring the Date and Time](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/basic-system-configuration/Configuring_the_Date_and_Time/#ch-Configuring_the_Date_and_Time). With the `-g` option to the ntpd command (used by default), any offset at system start will be corrected, but during normal operation only offsets of up to 1000 seconds will be corrected.

Some software may fail or produce an error if the time is changed backwards. For systems that are sensitive to step changes in the time, the threshold can be changed to 600s instead of 128ms using the `-x` option (unrelated to the `-g` option). Using the `-x` option to increase the stepping limit from 0.128s to 600s has a drawback because a different method of controlling the clock has to be used. It disables the kernel clock discipline and may have a negative impact on the clock accuracy. The `-x` option can be added to the `/etc/sysconfig/ntpd` configuration file.

## Understanding the Drift File

The drift file is used to store the frequency offset between the system clock running at its nominal frequency and the frequency required to remain in synchronization with UTC. If present, the value contained in the drift file is read at system start and used to correct the clock source. Use of the drift file reduces the time required to achieve a stable and accurate time. The value is calculated, and the drift file replaced, once per hour by `ntpd`. The drift file is replaced, rather than just updated, and for this reason the drift file must be in a directory for which the `ntpd` has write permissions.

## UTC, Timezones, and DST

As `NTP` is entirely in UTC (Universal Time, Coordinated), Timezones and DST (Daylight Saving Time) are applied locally by the system. The file `/etc/localtime` is a copy of, or symlink to, a zone information file from `/usr/share/zoneinfo`. The RTC may be in localtime or in UTC, as specified by the 3rd line of `/etc/adjtime`, which will be one of LOCAL or UTC to indicate how the RTC clock has been set. Users can easily change this setting using the checkbox `System Clock Uses UTC` in the **Date and Time** graphical configuration tool. See [Configuring the Date and Time](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/basic-system-configuration/Configuring_the_Date_and_Time/#ch-Configuring_the_Date_and_Time) for information on how to use that tool. Running the RTC in UTC is recommended to avoid various problems when daylight saving time is changed.

The operation of `ntpd` is explained in more detail in the man page `ntpd(8)`. The resources section lists useful sources of information. See [Configuring_NTP_Using_ntpd.adoc#s1-ntpd_additional-resources](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/servers/Configuring_NTP_Using_ntpd/#).

## Authentication Options for NTP

`NTPv4` added support for the Autokey Security Architecture, which is based on public asymmetric cryptography while retaining support for symmetric key cryptography. The Autokey Security Architecture is described in *[RFC 5906 Network Time Protocol Version 4: Autokey Specification](https://www.rfc-editor.org/info/rfc5906)*. The man page `ntp_auth(5)` describes the authentication options and commands for `ntpd`.

An attacker on the network can attempt to disrupt a service by sending `NTP` packets with incorrect time information. On systems using the public pool of `NTP` servers, this risk is mitigated by having more than three `NTP` servers in the list of public `NTP` servers in `/etc/ntp.conf`. If only one time source is compromised or spoofed, `ntpd` will ignore that source. You should conduct a risk assessment and consider the impact of incorrect time on your applications and organization. If you have internal time sources you should consider steps to protect the network over which the `NTP` packets are distributed. If you conduct a risk assessment and conclude that the risk is acceptable, and the impact to your applications minimal, then you can choose not to use authentication.

The broadcast and multicast modes require authentication by default. If you have decided to trust the network then you can disable authentication by using disable auth directive in the `ntp.conf` file. Alternatively, authentication needs to be configured by using SHA1 or MD5 symmetric keys, or by public (asymmetric) key cryptography using the Autokey scheme. The Autokey scheme for asymmetric cryptography is explained in the `ntp_auth(8)` man page and the generation of keys is explained in `ntp-keygen(8`). To implement symmetric key cryptography, see [Configuring_NTP_Using_ntpd.adoc#s2_Configuring_Symmetric_Authentication_Using_a_Key](https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/servers/Configuring_NTP_Using_ntpd/#) for an explanation of the `key` option.

## Managing the Time on Virtual Machines

Virtual machines cannot access a real hardware clock and a virtual clock is not stable enough as the stability is dependent on the host systems work load. For this reason, para-virtualized clocks should be provided by the virtualization application in use (for more information see *[Libvirt Managed Timers](https://docs.fedoraproject.org/en-US/Fedora/18/html/Virtualization_Administration_Guide/sect-Virtualization-Tips_and_tricks-Libvirt_Managed_Timers.html)* in the *Virtualization Administration Guide*). On Fedora with **KVM** the default clock source is `kvm-clock`. See the *[KVM guest timing management](https://docs.fedoraproject.org/en-US/Fedora/13/html/Virtualization_Guide/chap-Virtualization-KVM_guest_timing_management.html)* chapter of the *Virtualization Host Configuration and Guest Installation Guide*.

## Understanding Leap Seconds

Greenwich Mean Time (GMT) was derived by measuring the solar day, which is dependent on the Earth’s rotation. When atomic clocks were first made, the potential for more accurate definitions of time became possible. In 1958, International Atomic Time (TAI) was introduced based on the more accurate and very stable atomic clocks. A more accurate astronomical time, Universal Time 1 (UT1), was also introduced to replace GMT. The atomic clocks are in fact far more stable than the rotation of the Earth and so the two times began to drift apart. For this reason UTC was introduced as a practical measure. It is kept within one second of UT1 but to avoid making many small trivial adjustments it was decided to introduce the concept of a *leap second* in order to reconcile the difference in a manageable way. The difference between UT1 and UTC is monitored until they drift apart by more than half a second. Then only is it deemed necessary to introduce a one second adjustment, forward or backward. Due to the erratic nature of the Earth’s rotational speed, the need for an adjustment cannot be predicted far into the future. The decision as to when to make an adjustment is made by the *[International Earth Rotation and Reference Systems Service (IERS)](https://www.iers.org/)*. However, these announcements are important only to administrators of Stratum 1 servers because `NTP` transmits information about pending leap seconds and applies them automatically.