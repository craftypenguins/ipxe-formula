#Deploy the bootstrap / firmware files for initial pxe load

{% from "ipxe/map.jinja" import ipxe with context %}

bootstrap:
  file.managed:
    - name: {{ ipxe.lookup.bootstrap_file }}
    - source: {{ ipxe.lookup.bootstrap_source }}
    - source_hash: {{ ipxe.lookup.bootstrap_source_hash }}
    - makedirs: True


