#!/bin/bash
set +ex
#./up_load_app.sh
# todo genereate inventory.yml file with ec2 host
./auto_get_db_config.sh
./auto_set_hosts_ip.sh

# todo add any additional variables
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts -e 'record_host_keys=True' --private-key ~/.ssh/id_rsa -u ec2-user playbook.yml

#ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook aws -i hosts -e 'record_host_keys=True' -u ec2-user --private-key ~/.ssh/id_rsa playbook.yml
