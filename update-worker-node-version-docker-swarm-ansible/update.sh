#!/bin/bash

ansible-playbook ./playbook_update_docker.yaml -i inventory
ansible-playbook ./playbook_get_nodes.yaml -i inventory
