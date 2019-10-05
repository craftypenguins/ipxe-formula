#Itterate through the ipxe::scripts::<script>::files passing to file.managed
{%- from "ipxe/map.jinja" import ipxe with context %}
{%- set scripts = salt['pillar.get']('ipxe:scripts', {}) %}
{%- for script, config in scripts.items() %}
{%- if config.files is defined %}
{%- for file, values in config['files'].items() %}
{{ script }}-{{file}}:
  file.managed:
    - name: {{ ipxe.lookup.base_dir }}{{ ipxe.lookup.boot_dir }}/{{script}}/{{file}}
    - makedirs: True
{%- for k,v in values.items() %}
    - {{k}}: {{v}}
{%- endfor %}
{%- endfor -%}
{%- endif %}
{%- endfor %}
