# chmod
=========

changes the file mode bits of each given file according to mode, which can  be
either  a symbolic representation of changes to make, or an octal number representing the bit pattern for the new mode bits.

Read Following links:

http://en.wikipedia.org/wiki/Filesystem_permissions


**Common Usage :**  ::

		$ chmod <permission_options> <filename>


**Examples :**

.. code-block:: bash

        king@sysadminlabs$ ls -lrt changemod.txt
        -rw-rw-r-- 1 king king 0 Oct 13 18:23 changemod.txt

        king@sysadminlabs$ chmod 777 changemod.txt  (or)  chmod ugo+rwx changemod.txt

        king@sysadminlabs$ ls -lrt changemod.txt
        -rwxrwxrwx 1 king king 0 Oct 13 18:23 changemod.txt





.. code-block:: bash


.. code-block:: bash


.. code-block:: bash


.. code-block:: bash


.. code-block:: bash


.. code-block:: bash


.. code-block:: bash
