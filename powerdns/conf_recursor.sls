{% from "powerdns/map.jinja" import powerdns with context %}

include:
  - recursor
  - powerdns

conf_recursor:
  file.managed:
    - name: {{ powerdns.lookup.recursor_config_file }}
    - source: salt://powerdns/files/pdns_recursor.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: recursor
    - watch_in:
      - service: recursor