#Itterate through the ipxe::scripts::<script>::files passing to file.managed
{%- from "ipxe/map.jinja" import ipxe with context %}
{%- set scripts = salt['pillar.get']('ipxe:scripts', {}) %}
{%- for script, config in scripts.iteritems() %}
{%- if config.files is defined %}
{%- for file, values in config['files'].iteritems() %}
{{ script }}-{{file}}:
  file.managed:
    - name: {{ ipxe.base_dir }}{{ ipxe.boot_dir }}/{{script}}/{{file}}
    - makedirs: True
{%- for k,v in values.iteritems() %}
    - {{k}}: {{v}}
{%- endfor %}
{%- endfor -%}
{%- endif %}
{%- endfor %}
