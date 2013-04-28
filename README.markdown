sudo
====


Overview
--------

The sudo module manages the sudo package on the system, and the various roles for different users.


Module Description
-------------------

The sudo module allow Puppet to manage the sudo package on the system, and the install new sudo roles easily with the sudo::add_role resource definition.

Setup
-----

**What sudo affects:**

* sudoers file(/etc/sudoers)
* sudoers directory(/etc/sudoers.d)
	
### Beginning with sudo

To setup sudo on a server

    class { 'sudo': 
      config => 'sudoers'
    }

To add a role for a user

    sudo::add_role { 'sudo_role_example.com':
      user => 'example.com',
      role => 'ALL=(ALL) ALL'
    }

Usage
------

**Parameters within `sudo`**

####`config`

This parameter specifies the main sudoers file(/etc/sudoers). If specified, the file must reside within the caller module's templates directory.

If not specified, the default configuration file is acceptable in most situations.


**Parameters within `sudo::add_role`**

####`ensure`

This parameter specifies whether this user's role is enabled or not.

Valid arguments are 'present' or 'absent'.
Defaults to present.

####`user`

This parameter is used to specify the the owner of the role.

####`role`

This parameter is used to set the role for the user.
Example: ALL=(ALL) NOPASSWD:ALL


Limitations
------------

This module has been built and tested using Puppet 2.6.x, 2.7, and 3.x.

The module has been tested on:

* CentOS 5.9
* CentOS 6.4
* Debian 6.0 
* Ubuntu 12.04

Testing on other platforms has been light and cannot be guaranteed. 

Development
------------

Bug Reports
-----------

Release Notes
--------------

**0.0.1**

First initial release.
