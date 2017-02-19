#Itterate through the ipxe::scripts creating script files
{%- from "ipxe/map.jinja" import ipxe with context %}
{%- set scripts = salt['pillar.get']('ipxe:scripts', {}) %}

#Deploy the boot menu
{{ ipxe.base_dir }}{{ ipxe.boot_dir }}/{{ ipxe.boot_file }}:
  file.managed:
    - makedirs: True
    - source: {{ ipxe.boot_file_source }}
    - template: jinja
    - context:
        ipxe: {{ipxe}}

#Deploy the top menu
{{ ipxe.base_dir }}{{ ipxe.boot_dir }}/{{ ipxe.menu_file }}:
  file.managed:
    - makedirs: True
    - source: {{ ipxe.menu_file_source }}
    - template: jinja
    - context:
        scripts: {{scripts}}

#Generate sub menu scripts
{%- for script, config in scripts.iteritems() %}
{{ script }}-ipxe-script:
  file.managed:
    - name: {{ ipxe.base_dir }}{{ ipxe.boot_dir }}/{{script}}/{{script}}.ipxe
    - makedirs: True
    - source: salt://ipxe/templates/script.jinja
    - template: jinja
    - context:
        config: {{config}}
{%- endfor %}
