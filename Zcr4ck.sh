#!/bin/bash
#/developer by ariadesupriyatna ✓
#[]
#apt update -y && apt upgrade -y
#apt install zip unzip -y
#sediakan file wordlist bernama passwords.txt
#bash Zcr4ck.sh file.zip

if [ $# -ne 1 ]; then
    echo "Usage: $0 <file.zip>"
    exit 1
fi

file="$1"

while read password; do
    if unzip -qq -o -P "$password" "$file"; then
        echo "Password found: $password"
        exit 0
    fi
done < passwords.txt

echo "Password not found."
exit 1