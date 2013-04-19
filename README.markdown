sudo
====


Overview
--------

The sudo module 


Module Description
-------------------

The Apache sudo module allows Puppet to install sudo and update the bashrc file to include sudo in the path. 

Setup
-----

**What sudo affects:**

* installation directory for sudo
* bashrc file of the user or /etc/bashrc if parameter pathfile is not set 
* ToDo - some more info about keeping apache sudo in its own folder so that on ensure => absent, someone' /usr/local does not disappear
	
### Beginning with Apache sudo

To setup Apache sudo on a server

    sudo::setup { "example.com-sudo":
      ensure        => 'present',
      source        => 'apache-sudo-1.9.0-bin.tar.gz',
      deploymentdir => '/home/example.com/apps/apache-sudo',
      user          => 'example.com',
      pathfile      => '/home/example.com/.bashrc'
    }

Usage
------

The `sudo::setup` resource definition has several parameters to assist installation of sudo.

**Parameters within `sudo`**

####`ensure`

This parameter specifies whether sudo should be deployed to the deployment directory and bashrc file is updated or not.
Valid arguments are "present" or "absent". Default 


####`source`

This parameter specifies the source for the sudo archive. 
This file must be in the files directory in the caller module. 
Only .tar.gz source archives are supported.

####`deploymentdir`

This parameter specifies the directory where sudo will be installed.

####`user`

This parameter is used to set the permissions for the installation directory of sudo.

####`pathfile`

This parameter is used to find and update the bashrc file to include sudo in the environment path.


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

**0.1.0**

First initial release.
