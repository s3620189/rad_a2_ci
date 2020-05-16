#!/bin/bash
result=$(terraform output instance_public_ip)
echo $result
sed -i "2c\\$result" hosts
