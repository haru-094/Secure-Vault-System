#!/bin/bash

secure_dir="$HOME/secure_vault"
mkdir -p "$secure_dir"

echo "Welcome to your secure vault store your encrption here" > "$secure_dir/keys.txt"
echo "Welcome to your secure vault stores confidential data here" > "$secure_dir/secrets.txt"
echo "Welcome to your secure vault stores system logs here" > "$secure_dir/logs.txt"

echo "Vault created"
ls -l "$secure_dir"
