#Itterate through the ipxe::scripts creating script files
{%- from "ipxe/map.jinja" import ipxe with context %}
{%- set scripts = ipxe.scripts %}

#Test for ipxe.lookup.boot_url
{% if salt['pillar.get']('ipxe:lookup:boot_url', default=None) %}
#Deploy the boot menu
{{ ipxe.lookup.base_dir }}{{ ipxe.lookup.boot_dir }}/{{ ipxe.lookup.boot_file }}:
  file.managed:
    - makedirs: True
    - source: {{ ipxe.lookup.boot_file_source }}
    - template: jinja
    - context:
        ipxe: {{ipxe}}

#Deploy the top menu
{{ ipxe.lookup.base_dir }}{{ ipxe.lookup.boot_dir }}/{{ ipxe.lookup.menu_file }}:
  file.managed:
    - makedirs: True
    - source: {{ ipxe.lookup.menu_file_source }}
    - template: jinja
    - context:
        scripts: {{scripts}}
        ipxe: {{ipxe.lookup}}

#Generate sub menu scripts
{%- for script, config in scripts.iteritems() %}
{{ script }}-ipxe-script:
  file.managed:
    - name: {{ ipxe.lookup.base_dir }}{{ ipxe.lookup.boot_dir }}/{{script}}/{{script}}.ipxe
    - makedirs: True
    - source: salt://ipxe/templates/script.jinja
    - template: jinja
    - context:
        config: {{config}}
{%- endfor %}

{% else %}
ipxe_fail_pillar_boot_url:
  test.fail_without_changes:
    - name: "Pillar variable ipxe.lookup.boot_url not set"
{% endif %}
