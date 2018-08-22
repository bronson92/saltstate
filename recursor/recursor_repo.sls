powerdns_recursor_repo:
  pkgrepo.managed:
    - humanname: PowerDNS_Recursor
    {% if salt['grains.get']('os_family') == 'Debian' %}
    #{TODO put package for Debian OS  }
    {% elif salt['grains.get']('os_family') == 'RedHat' %}
    - baseurl: http://repo.powerdns.com/centos/$basearch/$releasever/rec-41/debug
    - gpgkey: https://repo.powerdns.com/FD380FBB-pub.asc
    - gpgcheck: 1
    {% endif %}
