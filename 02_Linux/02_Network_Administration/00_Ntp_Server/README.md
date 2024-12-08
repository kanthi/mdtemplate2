# NTP Service

Accurate time keeping is important for a number of reasons in IT. In networking for example, accurate time stamps in packets and logs are required. In Linux systems, the `NTP` protocol is implemented by a daemon running in user space.

The user space daemon updates the system clock running in the kernel. The system clock can keep time by using various clock sources. Usually, the *Time Stamp Counter* (**TSC**) is used. The TSC is a CPU register which counts the number of cycles since it was last reset. It is very fast, has a high resolution, and there are no interrupts.

There is a choice between the daemons `ntpd` and `chronyd`, which are available from the repositories in the **ntp** and **chrony** packages respectively. This section describes the use of the **chrony** suite of utilities to update the system clock on systems that do not fit into the conventional permanently networked, always on, dedicated server category.

### Introduction to the chrony Suite

**Chrony** consists of `chronyd`, a daemon that runs in user space, and **chronyc**, a command line program for making adjustments to `chronyd`. Systems which are not permanently connected, or not permanently powered up, take a relatively long time to adjust their system clocks with `ntpd`. This is because many small corrections are made based on observations of the clocks drift and offset. Temperature changes, which may be significant when powering up a system, affect the stability of hardware clocks. Although adjustments begin within a few milliseconds of booting a system, acceptable accuracy may take anything from ten seconds from a warm restart to a number of hours depending on your requirements, operating environment and hardware. **chrony** is a different implementation of the `NTP` protocol than `ntpd`, it can adjust the system clock more rapidly.

#### Differences Between ntpd and chronyd

One of the main differences between `ntpd` and `chronyd` is in the algorithms used to control the computer’s clock. Things `chronyd` can do better than `ntpd` are:

- `chronyd` can work well when external time references are only intermittently accessible, whereas `ntpd` needs regular polling of time reference to work well.
- `chronyd` can perform well even when the network is congested for longer periods of time.
- `chronyd` can usually synchronize the clock faster and with better time accuracy.
- `chronyd` quickly adapts to sudden changes in the rate of the clock, for example, due to changes in the temperature of the crystal oscillator, whereas `ntpd` may need a long time to settle down again.
- In the default configuration, `chronyd` never steps the time after the clock has been synchronized at system start, in order not to upset other running programs. `ntpd` can be configured to never step the time too, but it has to use a different means of adjusting the clock, which has some disadvantages.
- `chronyd` can adjust the rate of the clock on a Linux system in a larger range, which allows it to operate even on machines with a broken or unstable clock. For example, on some virtual machines.

Things `chronyd` can do that `ntpd` cannot do:

- `chronyd` provides support for isolated networks where the only method of time correction is manual entry. For example, by the administrator looking at a clock. `chronyd` can examine the errors corrected at different updates to estimate the rate at which the computer gains or loses time, and use this estimate to trim the computer clock subsequently.
- `chronyd` provides support to work out the rate of gain or loss of the real-time clock, the hardware clock, that maintains the time when the computer is turned off. It can use this data when the system boots to set the system time using an adjusted value of the time taken from the real-time clock. This is, at time of writing, only available in Linux.

Things `ntpd` can do that `chronyd` cannot do:

- `ntpd` fully supports `NTP` version 4 (*RFC 5905*), including broadcast, multicast, manycast clients and servers, and the orphan mode. It also supports extra authentication schemes based on public-key cryptography (*RFC 5906*). `chronyd` uses `NTP` version 3 (*RFC 1305*), which is compatible with version 4.
- `ntpd` includes drivers for many reference clocks whereas `chronyd` relies on other programs, for example **gpsd**, to access the data from the reference clocks.

#### Choosing Between NTP Daemons

- **Chrony** should be considered for all systems which are frequently suspended or otherwise intermittently disconnected and reconnected to a network. Mobile and virtual systems for example.
- The `NTP` daemon (`ntpd`) should be considered for systems which are normally kept permanently on. Systems which are required to use broadcast or multicast `IP`, or to perform authentication of packets with the `Autokey` protocol, should consider using `ntpd`. **Chrony** only supports symmetric key authentication using a message authentication code (MAC) with MD5, SHA1 or stronger hash functions, whereas `ntpd` also supports the `Autokey` authentication protocol which can make use of the PKI system. `Autokey` is described in *RFC 5906*.

**Ntpd:** A common daemon, ntpd used to be included on most Unix-like operating systems. It has been a stable solution for many years and may be running on your computer right now.

**Chrony:** A fairly new daemon, chrony has interesting features and the potential to provide more precise time synchronization using NTP. Chrony also offers its own extended control protocol and theoretically could bring precision down to nanoseconds. From a resource consumption perspective, we found ntpd and chrony to be fairly similar, though chrony seems to consume slightly less RAM (~1 MiB difference). 



> **_NOTE:_** Interesting read about how Facebook Engineering used chrony to build there ntp services [Facebook Engineering's NTP Service](https://engineering.fb.com/production-engineering/ntp-service/)	

