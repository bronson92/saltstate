{% from "powerdns/map.jinja" import powerdns with context %}

include:
  - powerdns

conf_master:
  file.managed:
    - name: {{ powerdns.lookup.config_file }}
    - source: salt://powerdns/files/pdns_master.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: powerdns
    - watch_in:
      - service: powerdns
