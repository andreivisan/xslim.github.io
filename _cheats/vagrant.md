---
title: Vagrant
---

## Commands
- `up`

## Config 

```
.vm.box = "raring"
.vm.box_url = "http://...-vagrant.box"
.vm.forward_port 7990, 7991
.vm.share_folder("vagrant-root", "/vagrant", ".")
.vm.customize ["modifyvm", :id, "--memory", 2048]
```
