Description
===========
This cookbook is a wrapper cookbook for our Transit-specific
modifications to (our own) [kedpm cookbook][kpm-cb].  It does the
following:

* Make a folder to house the shared password file.
* Sets all sysadmin users to use said shared password file.
* Adds the directory to those backed up by [rsnapshot][rs-cb]

Attributes
==========
* `node['kedpm']['shared-dir']` - The directory in which we will keep
  our shared password db file.  The default is `/usr/local/share/passwords/`

[kpm-cb]: https://github.com/umts/chef-kedpm
[rs-cb]: https://github.com/umts/rsnapshot
