{% from "recursor/map.jinja" import powerdns with context %}

{% set os_family = salt['grains.get']('os_family') %}

{% if os_family in ['Debian', 'RedHat'] %}
include:
  - recursor.recursor_repo
{% endif %}

recursor:
  pkg.installed:
    - name: pdns-recursor
    - refresh_db: True
    {% if os_family in ['Debian', 'RedHat'] %}
    - require:
      - sls: recursor.recursor_repo
    {% endif %}

  service.running:
    - name: pdns-recursor
    - enable: True
    - require:
      - pkg: recursor

