include:
  - recursor
  
conf_recursor:
  file.managed:
    - name: /etc/pdns-recursor/recursor.conf
    - source: salt://recursor/files/pdns_recursor.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: recursor
    - watch_in:
      - service: recursor
