#!/bin/sh

# playbooks must be stored in ~/.playbook
mkdir ~/.playbook || echo "directory exists"
cp unplaybook.yml ~/.playbook/unplaybook.yml
podman run --rm -it \
    --userns keep-id \
    -v "${HOME}":/work:rw \
    --rm rebooting/ansible:latest ansible-playbook /work/.playbook/unplaybook.yml
    # -i inventories/testgroup.yml 

