---
layout: post
title: "Captive login with Rails"
date: 2012-05-30 09:50
comments: true
published: false
tags: [rails,captive,iptables]
---

Create a new chain named 'internet' in mangle table with this command

``` sh
iptables -t mangle -N internet
```

 
Send all HTTP traffic from eth1 to the newly created chain for further processing

``` sh
iptables -t mangle -A PREROUTING -i br0 -p tcp -m tcp --dport 80 -j internet
```

 
Mark all traffic from internet chain with 99

``` sh
iptables -t mangle -A internet -j MARK --set-mark 99
```

 
Redirect all marked traffic to the portal 
for DD-WRT routers, load mark module

``` sh
insmod ipt_mark
insmod xt_mark
```

 
``` sh
iptables -t nat -A PREROUTING -i eth1 -p tcp -m mark --mark 99 -m tcp --dport 80 -j DNAT --to-destination 213.222.29.198
```

 
Getting the MAC having IP

First - add www user to sudoers. Enter `sudo visudo` and add `www ALL=NOPASSWD: /usr/sbin/arp`

For getting MAC we can use this Ruby method

``` ruby
  def mac_from_ip(ip_addr)
    #ip_addr = '10.10.10.55' # testing

    arp_cmd = '/usr/sbin/arp'
    output = `sudo #{arp_cmd} -n #{ip_addr}` #-an

    matches = output.scan(/\S{1,2}:\S{1,2}:\S{1,2}:\S{1,2}:\S{1,2}:\S{1,2}/) #3c:7:54:50:22:58
    #puts "arp output" + output.inspect
    #puts "Matches" + matches.inspect

    mac = matches[0].nil? ? nil : matches[0]
  end
  ```

 

Links
[1] http://aryo.info/labs/captive-portal-using-php-and-iptables.html
[2] http://www.andybev.com/index.php/Using_iptables_and_PHP_to_create_a_captive_portal