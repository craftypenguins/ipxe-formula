#Deploy the bootstrap / firmware files for initial pxe load

{% from "ipxe/map.jinja" import ipxe with context %}

bootstrap:
  file.managed:
    - name: {{ ipxe.bootstrap_file }}
    - source: {{ ipxe.bootstrap_source }}
    - source_hash: {{ ipxe.bootstrap_source_hash }}
    - makedirs: True


