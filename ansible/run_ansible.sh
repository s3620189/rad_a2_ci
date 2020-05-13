#!/bin/bash
set +ex

# todo genereate inventory.yml file with ec2 host

# todo add any additional variables
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts -e 'record_host_keys=True' playbook.yml

#ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook aws -i hosts -e 'record_host_keys=True' -u ec2-user --private-key ~/.ssh/id_rsa playbook.yml
