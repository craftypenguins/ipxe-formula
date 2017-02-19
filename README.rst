ipxe
=====

Formula to deploy ipxe bootstrap and menus

Work In Progress
================
This a work in progress.  A blog post related to it's development
is in progress.  It does currently work with the example pillar
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
