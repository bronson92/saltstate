powerdns:
  repo:
    release: master
    keyid: FF389421CBC8B383

  config:
    api: 'yes'
    api-key: d34db33f
    webserver: 'yes'
    webserver-port: 8081

    launch: gmysql
    gmysql-host: localhost
    gmysql-port: 3306
    gmysql-user: pdns
    gmysql-password: mys3cr3tdbp4ssw0rd
    gmysql-dnssec: 'yes'

  master_config:
    config-dir: /etc/pdns
    daemon: 'yes'
    disable-axfr: 'no'
    disable-tcp: 'no'
    guardian: 'yes'
    launch: gmysql
    gmysql-host: 127.0.0.1
    #gmysql-dbname: ${DB_SCHEMA}
    gmysql-user: powerdns
    gmysql-password: root123
    local-port: 53
    log-dns-details: 'on'
    loglevel: 4
    master: 'yes'
    slave: 'no'
    setgid: pdns
    setuid: pdns
    experimental-json-interface: 'yes'
    experimental-api-key: 'root123'
    webserver: 'yes'
    webserver-port: 8081
    webserver-allow-from: 0.0.0.0/0,::/0
  
  slave_config:
    config-dir: /etc/pdns
    daemon: 'yes'
    disable-axfr: 'no'
    disable-tcp: 'no'
    guardian: 'yes'
    launch: 'gmysql'
    gmysql-host: '127.0.0.1'
    #gmysql-dbname: ${DB_SCHEMA}
    gmysql-user: powerdns
    gmysql-password: root123
    local-port: 53
    log-dns-details: 'on'
    loglevel: 4
    master: 'no'
    slave: 'yes'
    setgid: pdns
    setuid: pdns
    experimental-json-interface: 'yes'
    experimental-api-key: 'root123'
    webserver: 'yes'
    webserver-port: 8081
    webserver-allow-from: '0.0.0.0/0,::/0'


  native_config:
  
    config-dir: /etc/pdns
    daemon: 'yes'
    disable-tcp: 'no'
    guardian: 'yes'
    launch: gmysql
    gmysql-host: 127.0.0.1
    gmysql-dbname: ${DB_SCHEMA}
    gmysql-user: ${DB_USERNAME}
    gmysql-password: ${DB_PASSWORD}
    local-address: 127.0.0.1
    local-port: 5300
    log-dns-details: 'on'
    loglevel: 4
    setgid: pdns
    setuid: pdns
    
  recursor_config:
    forward-zones: 127.0.0.1:5300
    local-port: 53


