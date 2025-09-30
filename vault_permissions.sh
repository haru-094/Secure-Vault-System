#!/bin/bash

secure_dir="$HOME/secure_vault"
keys="$secure_dir/keys.txt"
secrets="$secure_dir/secrets.txt"
logs="$secure_dir/logs.txt"

# check if secure valut exist
if [[ ! -d "$secure_dir" ]]; then
   echo "Vault not found. exiting"
   exit 1
fi

# check for the keys file
ls -l "$keys"
read -p "update permission for key.txt? (default is 600, y/n):" p_change
if [[ "$p_change" == "y" || "p_change" == "Y" ]]; then
   read -p "Enter new permission : " p_update
   if [[ -z "p_update" ]]; then
     chmod 600 "$keys"
   else
     chmod "$p_update" "$keys"
   fi
elif [[ -z "p_change" ]]; then
     chmod 600 "$keys"
fi

# check for the secret file
ls -l "$secrets"
read -p "update permission for secrets.txt? (default is 600, y/n):" p_change
if [[ "$p_change" == "y" || "p_change" == "Y" ]]; then
   read -p "Enter new permission : " p_update
   if [[ -z "p_update" ]]; then
     chmod 640 "$secrets"
   else
     chmod "$p_update" "$secrets"
   fi
elif [[ -z "p_change" ]]; then
     chmod 640 "$secrets"
fi

# check for the logs file
ls -l "$secrets"
read -p "update permission for logs.txt? (default is 600, y/n):" p_change
if [[ "$p_change" == "y" || "p_change" == "Y" ]]; then
   read -p "Enter new permission : " p_update
   if [[ -z "p_update" ]]; then
     chmod 644 "$logs"
   else
     chmod "$p_update" "$logs"
   fi
elif [[ -z "p_change" ]]; then
     chmod 644 "$logs"
fi

echo "permission update"
ls -l "$secure_dir"
