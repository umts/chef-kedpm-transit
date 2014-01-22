Description
===========
This cookbook is a wrapper cookbook for our Transit-specific
modifications to (our own) [kedpm cookbook][kpm-cb].

Recipes
======
* `password-dir` - Makes a folder to house the shared password file.
* `sysadmins` - Sets all sysadmin users to use said shared password file.
* `rsnapshot` - Adds the directory to those backed up by [rsnapshot][rs-cb]
* `default` - Used to composite the above recipes, also includes the
  kedpm recipe itself

Attributes
==========
* `node['kedpm']['shared-dir']` - The directory in which we will keep
  our shared password db file.  The default is `/usr/local/share/passwords/`

[![Build Status](https://secure.travis-ci.org/umts/chef-kedpm-transit.png)](http://travis-ci.org/umts/chef-kedpm-transit)

[kpm-cb]: https://github.com/umts/chef-kedpm
[rs-cb]: https://github.com/umts/rsnapshot
