#!/bin/bash
# ansible-galaxy install -r roles/requirements.yml

echo $ANSIBLE_VAULT_PASSWORD >> .vault

if ! ansible-playbook site.yml -i inventories/hosts_azure_rm.yml --vault-password-file .vault -vvv; 
then
  echo "Ansible failed!" 
  rm .vault
  exit 1
else
  rm .vault
fi