# lsmod
=========

prints the contents of the /proc/modules file. It shows which loadable kernel modules are currently loaded.

**Common Usage :** ::

	$ lsmod

**Examples :**

.. code-block:: bash

	king@sysadminlabs:~# lsmod
	Module                  Size  Used by
	usb_storage            53538  0 
	uas                    17996  0 
	snd_hda_codec_hdmi     28103  1 
	snd_hda_codec_idt      71137  1 
	rfcomm                 47694  8 
	binfmt_misc            17565  1 
	sco                    18131  2 
	bnep                   18308  2 
	l2cap                  53570  16 rfcomm,bnep
	wl                   2568244  0 
	lib80211               14991  1 wl
	arc4                   12529  2 
	snd_hda_intel          33211  2 
	snd_hda_codec         103804  3 snd_hda_codec_hdmi,snd_hda_codec_idt,snd_hda_intel
	snd_hwdep              13604  1 snd_hda_codec
	snd_pcm                96625  3 snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec
	snd_seq_midi           13324  0 
	snd_rawmidi            30486  1 snd_seq_midi
	snd_seq_midi_event     14899  1 snd_seq_midi
	brcm80211             748941  0 
	snd_seq                61621  2 snd_seq_midi,snd_seq_midi_event
	i915                  514985  7 
	snd_timer              29602  2 snd_pcm,snd_seq
	snd_seq_device         14462  3 snd_seq_midi,snd_rawmidi,snd_seq
	ppdev                  17113  0 
	dell_wmi               12681  0 
	mac80211              294370  1 brcm80211
	sparse_keymap          13898  1 dell_wmi
	pcmcia                 49166  0 
	dell_laptop            13827  0 
	dcdbas                 14438  1 dell_laptop
	psmouse                73535  0 
	cfg80211              178528  2 brcm80211,mac80211
	snd                    67382  14 snd_hda_codec_hdmi,snd_hda_codec_idt,snd_hda_intel,snd_hda_codec,snd_hwdep,snd_pcm,snd_rawmidi,snd_seq,snd_timer,snd_seq_device
	btusb                  18600  2 
	drm_kms_helper         42136  1 i915
	uvcvideo               72195  0 
	drm                   227495  3 i915,drm_kms_helper
	intel_ips              18097  0 
	bluetooth              72448  9 rfcomm,sco,bnep,l2cap,btusb
	serio_raw              13166  0 
	videodev               82052  1 uvcvideo
	v4l2_compat_ioctl32    17078  1 videodev
	parport_pc             36959  0 
	soundcore              12680  1 snd
	yenta_socket           27846  0 
	snd_page_alloc         18529  2 snd_hda_intel,snd_pcm
	i2c_algo_bit           13400  1 i915
	pcmcia_rsrc            18372  1 yenta_socket
	pcmcia_core            22569  3 pcmcia,yenta_socket,pcmcia_rsrc
	video                  19438  1 i915
	lp                     17825  0 
	parport                46458  3 ppdev,parport_pc,lp
	tg3                   141750  0 
	firewire_ohci          40370  0 
	sdhci_pci              13989  0 
	firewire_core          62646  1 firewire_ohci
	sdhci                  27387  1 sdhci_pci
	crc_itu_t              12707  1 firewire_core

