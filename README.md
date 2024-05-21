# 📑 opentofu

## Description

A set of opentofu (terraform fork) examples to dive into the code

## ⚠️ Dependances

- opentofu
- proxmox
- *OPTION* ovh account (with a domain) 
- *OPTION* direnv 
- *OPTION* loop cloud images 

## install
### proxmox
    wget https://github.com/opentofu/opentofu/releases/download/v1.7.1/tofu_1.7.1_linux_amd64.zip
    unzip tofu_1.7.1_linux_amd64.zip
    mv tofu /usr/local/bin/
### direnv
    curl -sfL https://direnv.net/install.sh | bash
    echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
    cd proxmox-clone-direnv
    direnv allow

### ovh
#### Create token
[OVH Token Generation](https://eu.api.ovh.com/createToken/)
#### Permissions for the domain (example.com)
    GET : /domain/zone/example.com/record/*
    PUT: /domain/zone/example.com/record/*
    DELETE: /domain/zone/example.com/record/*
    GET: /domain/zone/example.com/record
    POST: /domain/zone/example.com/record
    POST: /domain/zone/example.com/refresh

### generic cloud loop
- </> [Ansible role](https://github.com/CultureLinux/ansible/tree/main/roles/proxmox-cloud-template)
- ▶️ [YT ansible loop](https://www.youtube.com/watch?v=sAzRL-oxpX8)
- ▶️ [YT opentofu loop](https://www.youtube.com/watch?v=IIqTbm5CuSs)
## test 
    tofu version

## Usage
    tofu init
    tofu plan
    tofu apply
    tofu destroy

## Details
### proxmox-clone

- `main.tf` : change IP/Gateway/Resolver
- `vars.tf` : setup PROXMOX_ vars and put your SSH key

### proxmox-clone-direnv

- `main.tf` : change IP/Gateway/Resolver
- `vars.tf` : and put your SSH key
- `.envrc`  : setup PROXMOX_ vars
- cd to the directory and execute `direnv allow` 

### ovh-create-subdomain

- `main.tf` : change PTR_A and PTR_CNAME

### proxmox-clone-loop
- ⚠️idx from `vars.tf` is used to setup dns ip
- `main.tf` : change IP/Gateway/Resolver (192.186.1.) and the idw value will be added on IP 192.168.1.180
- `vars.tf` : setup proxmox node name, put your SSH key, be sure to have VM's generic templates [1003,1001] in place
- `.envrc`  : setup PROXMOX_ vars
- cd to the directory and execute `direnv allow` 

## Documentation
### setup
- </> [Setup BPG/provider](https://culturelinux.github.io/doc/iac/opentofu/#providers)
- </> [Setup OVH](https://registry.terraform.io/providers/ovh/ovh/latest/docs)

### videos 
- ▶️ [Playlist YT proxmox](https://www.youtube.com/watch?v=w9Eb7f8dr6k&list=PLstyDDGv-B4F8MgLCD1J4Ze_2dp_54HYB)
- ▶️ [Direnv](https://www.youtube.com/watch?v=uN_IxJlAMEU)
