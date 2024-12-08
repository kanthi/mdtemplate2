# temp



### RPi, Clone the Raspberry boot disk

[![img](https://4.bp.blogspot.com/-iOz0-gETdpo/WhRXKf5YuuI/AAAAAAAACwA/MtvxEGDy5YYS_OpHfwnrpHv9mOH_vE20gCLcBGAs/s1600/SD_reader.jpg)](https://4.bp.blogspot.com/-iOz0-gETdpo/WhRXKf5YuuI/AAAAAAAACwA/MtvxEGDy5YYS_OpHfwnrpHv9mOH_vE20gCLcBGAs/s1600/SD_reader.jpg)

Updated 2020-11-12 !

A very nice way to fix a backup is to make a copy, bootable, of the actual SD card You are using on the RPi. This will be done when the RPi is up and running !

This application can also be used to [make a bootable SSD or USB drive !!](https://pysselilivet.blogspot.com/2020/10/raspberry-pi-1-2-3-4-usb-ssd-boot.html)


You clone from the command line so You don't need the standard GUI, Pixel, and the SD card copy function.

It is also possible to set up a cronjob, explained later, which for example makes a clone every night at 1 o'clock.

You just need a USB SD card reader, with a SD Card, and then You plug the SD Card reader into a free USB port on the RPi.

Log on to the RPi and at a command line type

lsblk -f

Which checks if the SD Card is "accepted" and also which name it's assigned to. Could be "sda", "sdb" ......

Then download the scripts from [Github](https://github.com/billw2/rpi-clone) where You also can find additional info about the scripts. For example the scripts handles that You are cloning from/to SD Cards with different sizes.

**Install with GIT**

If You haven't used GitHub before You have to download an additional software with

sudo apt-get install git

and then download the actual scripts

git clone https://github.com/billw2/rpi-clone.git

**Install without GIT**

wget https://github.com/billw2/rpi-clone/archive/master.zip

Unzip and rename 

unzip master.zip && mv rpi-clone-master rpi-clone

**Common commands**

Copy the scripts to the folder used for scripts with superuser (root) privileges.

sudo cp rpi-clone/rpi-clone* /usr/local/sbin

Clean up, deleting the working folders

rm -rf rpi-clone master.zip

**
**

**Manual clone** 

Execute the clone script with 

sudo bash rpi-clone sda -f

(The USB could be assigned another name than "sda", so use the name You got earlier)

and something like this will appear



Booted disk: mmcblk0 15.9GB         Destination disk: sda 15.9GB
\---------------------------------------------------------------------------
Part    Size   FS   Label      Part  Size   FS   Label
1 /boot  43.5MB  fat32  --        1    43.5MB  fat32  --
2 root   15.9GB  ext4  cpy_stretch   2    15.9GB  ext4  --
\---------------------------------------------------------------------------
== Initialize: IMAGE mmcblk0 partition table to sda - forced by option ==
1 /boot        (21.5MB used)  : IMAGE   to sda1  FSCK
2 root         (2.0GB used)  : RESIZE(15.9GB) MKFS SYNC to sda2
\---------------------------------------------------------------------------
Run setup script    : no
Verbose mode      : no
-----------------------:
** WARNING **      : All destination disk sda data will be overwritten!
            :  The partition structure will be imaged from mmcblk0.
-----------------------:
Initialize and clone to the destination disk sda?  (yes/no):


Answer with yes and type a label for the destination SD card



Optional destination  ext type file system label (16 chars max): XX
Initializing
 Imaging past the start of /boot partition 2.
 => dd if=/dev/mmcblk0 of=/dev/sda bs=1M count=50 ...
 Resizing last partition to end of disk ...
  Resize success.
 Changing destination Disk ID ...
 Delaying so partprobe can update /dev entries ...
 => fsck -p /dev/sda1 ...
 => mkfs -t ext4 -L XX /dev/sda2 ...
Syncing file systems (can take a long time)
Syncing mounted partitions:
 Mounting /dev/sda2 on /mnt/clone
 => rsync // /mnt/clone with-root-excludes ...
 Mounting /dev/sda1 on /mnt/clone/boot
 => rsync /boot/ /mnt/clone/boot  ...
Editing /mnt/clone/boot/cmdline.txt PARTUUID to use dee316b8
Editing /mnt/clone/etc/fstab PARTUUID to use dee316b8
===============================
Done with clone to /dev/sda
  Start - 12:06:06   End - 12:12:36   Elapsed Time - 6:30
Cloned partitions are mounted on /mnt/clone for inspection or customizing.
Hit Enter when ready to unmount the /dev/sda partitions ...
 unmounting /mnt/clone/boot
 unmounting /mnt/clone
===============================



In this case I cloned from/to 16 Gb SD Card with approx 2 Gb of data.

**Automated clone**

To add an automated setup, from a command line, type

crontab -e

If it's the first cronjob You are adding, something like this will appear



no crontab for pi - using an empty one
Select an editor.  To change later, run 'select-editor'.
 \1. /bin/ed
 \2. /bin/nano     <---- easiest
 \3. /usr/bin/vim.tiny
Choose 1-3 [2]: 
crontab: installing new crontab


where You select the editor You want to use.

On the last line add 

0 1 * * * sudo bash rpi-clone sda -q

and exit. This means that a new clone will be made every night at 1 o'clock