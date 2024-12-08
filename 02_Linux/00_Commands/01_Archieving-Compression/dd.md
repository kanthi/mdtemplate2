# dd



Copy a file, converting and formatting according to the operands. 


**Common Usage :**  ::

		dd if=<source> of=<target> bs=<byte size> ("USUALLY" some power of 2, and usually not less than 512 bytes (ie, 512, 1024, 2048, 4096, 8192, 16384, but can be any reasonable whole integer value.) skip= seek= conv=<conversion>


.. code-block:: bash

		$ dd if=/dev/xxx of=/dev/xxx
		



**Examples :**


*Creating iso from cdrom*

.. code-block:: bash
	
		#dd if=/dev/cdrom-media of=cdrom.iso
		
*Use to erase a physical drive*

.. code-block:: bash

		#dd if=/dev/zero of=/dev/sda
		
*Duplicate one patition at another or one harddisk to another*

.. code-block:: bash
		
		dd if=/dev/sda1 of=/dev/sdb1



.. note:: Further examples will be added 