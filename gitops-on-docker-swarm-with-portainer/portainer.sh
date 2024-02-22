#!/bin/bash

ansible-playbook ./playbook_install_portainer.yaml -i inventory
ansible-playbook ./playbook_find_location.yaml -i inventory
