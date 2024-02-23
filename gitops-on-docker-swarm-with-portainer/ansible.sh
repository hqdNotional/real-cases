#!/bin/bash

ansible-playbook ./playbook_install_docker.yaml -i inventory
ansible-playbook ./playbook_init_swarm.yaml -i inventory
ansible-playbook ./playbook_add_manager.yaml -i inventory
ansible-playbook ./playbook_add_worker.yaml -i inventory
ansible-playbook ./playbook_get_nodes.yaml -i inventory
ansible-playbook ./playbook_install_portainer.yaml -i inventory
ansible-playbook ./playbook_find_location.yaml -i inventory
