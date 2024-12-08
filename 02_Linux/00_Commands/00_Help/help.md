# help

### The help command gets help for a particular command


**Common Usage :** ::


	# apropos --help


**Examples :**


.. code-block:: bash

	king@sysadminlabs:~$ apropos --help
	Usage: apropos [OPTION...] KEYWORD...

	  -d, --debug                emit debugging messages
	  -v, --verbose              print verbose warning messages
	  -e, --exact                search each keyword for exact match
	  -r, --regex                interpret each keyword as a regex
	  -w, --wildcard             the keyword(s) contain wildcards
	  -a, --and                  require all keywords to match
	  -l, --long                 do not trim output to terminal width
	  -C, --config-file=FILE     use this user configuration file
	  -L, --locale=LOCALE        define the locale for this search
	  -m, --systems=SYSTEM       use manual pages from other systems
	  -M, --manpath=PATH         set search path for manual pages to PATH
	  -s, --section=SECTION      search only this section
	  -?, --help                 give this help list
	      --usage                give a short usage message
	  -V, --version              print program version

	Mandatory or optional arguments to long options are also mandatory or optional
	for any corresponding short options.

	The --regex option is enabled by default.

	Report bugs to cjwatson@debian.org.