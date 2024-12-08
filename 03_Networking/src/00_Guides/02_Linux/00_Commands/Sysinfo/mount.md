# mount
=======

mount a filesystem

mount and umount maintain a list of currently mounted filesystems in the file /etc/mtab.  
If no arguments are given to mount, this list is printed.

**Common Usage :** ::

	$ mount

**Examples :**


.. code-block:: bash

	king@sysadminlabs:~# mount
	/dev/sda7 on / type ext4 (rw,errors=remount-ro,commit=0)
	proc on /proc type proc (rw,noexec,nosuid,nodev)
	none on /sys type sysfs (rw,noexec,nosuid,nodev)
	fusectl on /sys/fs/fuse/connections type fusectl (rw)
	none on /sys/kernel/debug type debugfs (rw)
	none on /sys/kernel/security type securityfs (rw)
	none on /dev type devtmpfs (rw,mode=0755)
	none on /dev/pts type devpts (rw,noexec,nosuid,gid=5,mode=0620)
	none on /dev/shm type tmpfs (rw,nosuid,nodev)
	none on /var/run type tmpfs (rw,nosuid,mode=0755)
	none on /var/lock type tmpfs (rw,noexec,nosuid,nodev)
	/dev/sda6 on /king type ext4 (rw,commit=0)
	binfmt_misc on /proc/sys/fs/binfmt_misc type binfmt_misc (rw,noexec,nosuid,nodev)
	/dev/sda1 on /media/C8BCA0D1BCA0BAF8 type fuseblk (rw,nosuid,nodev,allow_other,blksize=4096,default_permissions)
	/dev/sda2 on /media/Data type fuseblk (rw,nosuid,nodev,allow_other,blksize=4096,default_permissions)
	gvfs-fuse-daemon on /home/king/.gvfs type fuse.gvfs-fuse-daemon (rw,nosuid,nodev,user=king)
