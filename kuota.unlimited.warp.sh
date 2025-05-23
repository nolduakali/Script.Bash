#!/bin/bash

rand_number() {
    echo $(( RANDOM % 999 + 1 ))
}

rand_string() {
    local length=$1
    < /dev/urandom tr -dc 'a-zA-Z0-9' | head -c "$length"
}

warp_unlimited() {
    local id_code="$1"
    local install_id=$(rand_string 22)
    local fcm_token="${install_id}:APA91b$(rand_string 134)"
    local body='{"key":"'"$(rand_string 43)"'=","install_id":"'"$install_id"'","fcm_token":"'"$fcm_token"'","referrer":"'"$id_code"'","warp_enabled":false,"locale":"es_US"}'
    local url="https://api.cloudflareclient.com/v0a$(rand_number)/reg"

    curl -X POST \
        -H "Content-Type: application/json; charset=UTF-8" \
        -H "User-Agent: okhttp/3.12.1" \
        -d "$body" \
        "$url" >/dev/null 2>&1
}

cat << "EOF"
    \\ //
    (o o)
ooO--(_)--Ooo-
EOF

echo -e "\033[31m[#] Created by ariadesupriyatna & raihan"
echo -e "\033[32m[$] Channel ~> @BlackFishSeven"
echo -e "\033[95m[&] Warp Plus Unlimited Script !"
echo -e "\033[33m====================================="

read -p "$(echo -e "\033[36m[+] Please Enter Your Client ID : ")" code_id

while true; do
    warp_unlimited "$code_id"
    echo -e "\033[32mSuccess ! You Got 1GB Warp +\n\033[35mPlease Wait 17 Second !"
    sleep 17
done
