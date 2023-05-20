#!/bin/sh

# playbooks must be stored in ~/.playbook
mkdir ~/.playbook || echo "directory exists"
cp playbook.yml ~/.playbook/playbook.yml
podman run --rm -it \
    --userns keep-id \
    -v "${HOME}":/work:rw \
    -e USERHOME="${HOME}" \
    --rm rebooting/ansible:latest ansible-playbook -v /work/.playbook/playbook.yml
    # -i inventories/testgroup.yml 
