#!/bin/bash

secure_dir="$HOME/secure_vault"
secrets="$secure_dir/secrets.txt"
keys="$secure_dir/keys.txt"
logs="$secure_dir/logs.txt"

while true; do
	echo " ----- Vault Menu -----"
	echo "1. Add Secret"
	echo "2. Update Secret"
	echo "3. Add log entry"
	echo "4. Access keys"
	echo "5. Exit"
	read -p "Choose an option [1-5]: " choose

	case "$choose" in
		1)
		  read -p "Enter secret to add: " secret
  	  	  echo "$secret" >> "$secrets"
		  echo "secret added"
		  ;;
		2)
		  read -p "enter secret to update: " search
		  read -p "enter new secret value: " replace
		  if grep -q "$search" "$secrets"; then
			sed -i "s/$search/$replace/" "$secrets"
	  		echo "secret update"
		  else
			echo "no match found"
		  fi
		  ;;
		3)
		  read -p "Enter log entry" log
		  echo "$(date '+%Y-%m-%d %H:%M:%S') $log" >> "$logs"
		  echo "log entry added"
		  ;;
		4)
		  echo "access denied"
		  ;;
		5)
		  echo "Exiting vault"
		  break
		  ;;
		*)
		  echo "Invaild option"
		  ;;
	esac
done
