{% from "powerdns/map.jinja" import powerdns with context %}

{% set os_family = salt['grains.get']('os_family') %}

{% if os_family in ['Debian', 'RedHat'] %}
include:
  - powerdns.recursor_repo
{% endif %}

recursor:
  pkg.installed:
    - name: {{ powerdns.lookup.recursor_pkg }}
    - refresh_db: True
    {% if os_family in ['Debian', 'RedHat'] %}
    - require:
      - sls: powerdns.recursor_repo
    {% endif %}

  service.running:
    - name: {{ powerdns.lookup.recursor_service }}
    - enable: True
    - require:
      - pkg: recursor

