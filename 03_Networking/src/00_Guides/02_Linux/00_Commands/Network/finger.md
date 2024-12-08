# finger
=========

user information lookup program

**Common Usage :**  ::

	$ finger

	$ finger <username>

**Examples :**

.. code-block:: bash

	king@sysadminlabs:~# finger
	Login     Name       Tty      Idle  Login Time   Office     Office Phone
	king      king       tty7     3:04  May 16 09:25 (:0)
	king      king      *pts/3          May 16 10:29 (:0)
	king      king       pts/4          May 16 11:08 (:0)

.. code-block:: bash


	king@sysadminlabs:~# finger king
	Login: king           			Name: king
	Directory: /home/king               	Shell: /bin/bash
	On since Mon May 16 09:25 (IST) on tty7 from :0
	    3 hours 4 minutes idle
	On since Mon May 16 10:29 (IST) on pts/3 from :0 (messages off)
	On since Mon May 16 11:08 (IST) on pts/4 from :0
	   50 seconds idle
	No mail.
	No Plan.


