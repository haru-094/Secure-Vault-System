#!/bin/bash

secure_dir="$HOME/secure_vault"
report="$secure_dir/vault_report.txt"

> "$report"

for file in "$secure_dir"/*; do
	name=$(basename "$file")
	size=$(stat -c %s "$file")
	date=$(stat -c %y "$file")
	perm=$(stat -c %a "$file")
	
	echo "File: $name" >> "$report"
	echo "Size: $size" >> "$report"
	echo "Last Modified: $date" >> "$report"
	echo "Permission: $perm" >> "$report"


	if [ "$perm" -gt 644 ]; then
		echo "Security risk detected" >> "$report"
	fi

	echo "---" >> "$report"
done

echo "vault report created at $report"
 
