forward-zones: 127.0.0.1:5300
local-port: 53
local-address: {{salt[grains.item](fqdn_ip4)}}