#!/bin/bash

terraform validate
terraform fmt
terraform plan
terraform apply --auto-approve
./auto_set_hosts_ip.sh

ANSIBLE_HOST_KEY_CHECKING=False ansible -i hosts --private-key ~/.ssh/id_rsa -u ec2-user copy -a "src=dist/ dest=app/dist owner=root group=root mode=0777"
