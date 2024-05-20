# 📑 opentofu

## Description

A set of opentofu (terraform fork) examples to dive into the code

## ⚠️ Dependances

- opentofu
- proxmox
- *OPTION* ovh account (with a domain) 
- *OPTION* direnv 

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

## Documentation
### setup
[Setup BPG/provider](https://culturelinux.github.io/doc/iac/opentofu/#providers)
[Setup OVH](https://registry.terraform.io/providers/ovh/ovh/latest/docs)

### videos 
[Playlist YT proxmox](https://www.youtube.com/watch?v=w9Eb7f8dr6k&list=PLstyDDGv-B4F8MgLCD1J4Ze_2dp_54HYB)
[Direnv](https://www.youtube.com/watch?v=uN_IxJlAMEU)
