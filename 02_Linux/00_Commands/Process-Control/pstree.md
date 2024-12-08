# pstree
==========

display a tree of precesses

*pstree visually merges identical branches by putting them in square brackets and prefixing them with the repetition count.*

**Common Usage :**

	$ pstree

	$ pstree -p

**Examples :**


.. code-block:: bash

        king@sysadminlabs:~$ pstree
        init─┬─/usr/bin/deluge─┬─xdg-open
             │                 └─8*[{/usr/bin/deluge}]
             ├─GoogleTalkPlugi───5*[{GoogleTalkPlugi}]
             ├─NetworkManager─┬─dhclient
             │                ├─dnsmasq
             │                └─2*[{NetworkManager}]
             ├─accounts-daemon───{accounts-daemon}
             ├─acpid
             ├─at-spi-bus-laun───2*[{at-spi-bus-laun}]
             ├─atd
             ├─atop
             ├─avahi-daemon───avahi-daemon
             ├─bamfdaemon───2*[{bamfdaemon}]
             ├─bluetoothd
             ├─colord───2*[{colord}]
             ├─conky───4*[{conky}]
             ├─console-kit-dae───64*[{console-kit-dae}]
             ├─contractor───{contractor}
             ├─cron
             ├─cupsd
             ├─3*[dbus-daemon]
             ├─2*[dbus-launch]
             ├─dconf-service───2*[{dconf-service}]
             ├─dnsmasq
             ├─docker───5*[{docker}]
             ├─dropbox───22*[{dropbox}]
             ├─e-addressbook-f───2*[{e-addressbook-f}]
             ├─empathy───2*[{empathy}]
             ├─gconfd-2
             ├─geoclue-master
             ├─6*[getty]
             ├─gnome-keyring-d───9*[{gnome-keyring-d}]
             ├─gnome-screensav───2*[{gnome-screensav}]
             ├─goa-daemon───{goa-daemon}
             ├─gsd-printer───{gsd-printer}
             ├─gvfs-afc-volume───{gvfs-afc-volume}
             ├─2*[gvfs-fuse-daemo───3*[{gvfs-fuse-daemo}]]
             ├─gvfs-gdu-volume
             ├─gvfs-gphoto2-vo
             ├─2*[gvfsd]
             ├─gvfsd-http───2*[{gvfsd-http}]
             ├─gvfsd-metadata
             ├─gvfsd-trash
             ├─indicator-appli───{indicator-appli}
             ├─indicator-datet───2*[{indicator-datet}]
             ├─indicator-messa───{indicator-messa}
             ├─indicator-sessi───2*[{indicator-sessi}]
             ├─indicator-sound───2*[{indicator-sound}]
             ├─irqbalance
             ├─lightdm─┬─Xorg
             │         ├─lightdm─┬─gnome-session─┬─applet.py───2*[{applet.py}]
             │         │         │               ├─bluetooth-apple───2*[{bluetooth-app+
             │         │         │               ├─caffeine───2*[{caffeine}]
             │         │         │               ├─cerbere─┬─plank───2*[{plank}]
             │         │         │               │         ├─slingshot-launc───2*[{sli+
             │         │         │               │         ├─wingpanel-slim───2*[{wing+
             │         │         │               │         └─3*[{cerbere}]
             │         │         │               ├─chrome─┬─chrome
             │         │         │               │        ├─2*[chrome───3*[{chrome}]]
             │         │         │               │        ├─chrome─┬─chrome
             │         │         │               │        │        └─2*[{chrome}]
             │         │         │               │        ├─chrome-sandbox───chrome─┬─+
             │         │         │               │        │                         └─+
             │         │         │               │        └─34*[{chrome}]
             │         │         │               ├─gala───3*[{gala}]
             │         │         │               ├─gnome-screensav───2*[{gnome-screens+
             │         │         │               ├─gnome-settings-─┬─syndaemon
             │         │         │               │                 └─5*[{gnome-setting+
             │         │         │               ├─nm-applet───2*[{nm-applet}]
             │         │         │               ├─polkit-gnome-au───2*[{polkit-gnome-+
             │         │         │               ├─python───2*[{python}]
             │         │         │               ├─ssh-agent
             │         │         │               ├─telepathy-indic───2*[{telepathy-ind+
             │         │         │               ├─update-notifier───3*[{update-notifi+
             │         │         │               ├─variety───69*[{variety}]
             │         │         │               └─3*[{gnome-session}]
             │         │         └─{lightdm}
             │         └─2*[{lightdm}]
             ├─marlin-daemon───{marlin-daemon}
             ├─mission-control───2*[{mission-control}]
             ├─modem-manager
             ├─2*[notify-osd───2*[{notify-osd}]]
             ├─ntpd
             ├─pantheon-termin─┬─gnome-pty-helpe
             │                 ├─zsh───man───less
             │                 ├─zsh───bash───pstree
             │                 ├─zsh
             │                 └─3*[{pantheon-termin}]
             ├─polkitd───{polkitd}
             ├─preload
             ├─pulseaudio─┬─gconf-helper
             │            └─2*[{pulseaudio}]
             ├─python─┬─redshift
             │        └─3*[{python}]
             ├─rsyslogd───3*[{rsyslogd}]
             ├─rtkit-daemon───2*[{rtkit-daemon}]
             ├─sshd
             ├─sublime_text─┬─plugin_host───5*[{plugin_host}]
             │              └─7*[{sublime_text}]
             ├─teamviewerd───5*[{teamviewerd}]
             ├─telepathy-gabbl───2*[{telepathy-gabbl}]
             ├─telepathy-logge───2*[{telepathy-logge}]
             ├─tor
             ├─ubuntu-geoip-pr───2*[{ubuntu-geoip-pr}]
             ├─udevd───2*[udevd]
             ├─udisks-daemon─┬─udisks-daemon
             │               └─2*[{udisks-daemon}]
             ├─upowerd───2*[{upowerd}]
             ├─upstart-socket-
             ├─upstart-udev-br
             ├─vmware-authdlau
             ├─vmware-usbarbit
             ├─vmware-vmblock-───2*[{vmware-vmblock-}]
             ├─vnstatd
             ├─whoopsie───{whoopsie}
             ├─wpa_supplicant
             ├─xfconfd
             ├─zeitgeist-daemo───{zeitgeist-daemo}
             ├─zeitgeist-datah───{zeitgeist-datah}
             └─zeitgeist-fts─┬─cat
                             └─{zeitgeist-fts}
        king@sysadminlabs:~$


