#!/bin/bash
# ansible-galaxy install -r roles/requirements.yml

echo $ANSIBLE_VAULT_PASSWORD >> .vault

if ! ansible-playbook -i hosts_azure_rm.yml site.yml --vault-password-file .vault; 
then
  echo "Ansible failed!" 
  rm .vault
  exit 1
else
  rm .vault
fi