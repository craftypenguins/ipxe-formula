ipxe
=====

Formula to deploy ipxe bootstrap and menus

Work In Progress
================
This a work in progress.  A blog post related to its development
is in progress.  

This does now work using the example pillar.   Note that I don't use the 
pillar as is, I have it broken in to various pillar files, and they are merged 
togther using the Saltstack Yamlex processor that supports aggregation of yaml.

The pillar example is as of March 12th, 2017.  The external URLS and SHA256 hashes
migth not be valid when you go to use it.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``ipxe``
---------

Install ipxe files for tftp bootstrap, configures ipxe menus, and installs any required
support files as defined by the pillar data


``ipxe.bootstrap``
------------------

Install iPXE tftp pxe bootstrap firmware

``ipxe.files``
----------------

Deploy chainload files for scripts.
Reads 'files' section from the scripts and sets up file.managed states for required assets


``ipxe.scripts``
----------------

Deploy ipxe boot menus scripts based on pillar data.
An example of deploying a Debian and Ubuntu chainload is in the ``pillar.example``

See ``pillar.example`` for pillar-data for a sample configuration.
