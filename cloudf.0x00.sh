#!/bin/bash

echo -e "\e[31m"
echo "  ____ _                 _ ____            _   _   _ "
echo " / ___| | ___  _   _  __| |  _ \ _ __ ___ | |_| | | |"
echo "| |   | |/ _ \| | | |/ _\` | |_) | '__/ _ \| __| |_| |"
echo "| |___| | (_) | |_| | (_| |  __/| | | (_) | |_|  _  |"
echo " \____|_|\___/ \__,_|\__,_|_|   |_|  \___/ \__|_| |_|"
echo -e "\e[0m"
echo "Cloudflare Detector - By ariadesupriyatna"
echo "=========================================="

domains=(
    "info.langitmusik.co.id" 
    "dn.langitmusik.co.id" 
    "www.langitmusik.co.id" 
    "widget-lm.langitmusik.co.id" 
    "mapi-test.langitmusik.co.id" 
    "dev.langitmusik.co.id" 
    "mynsp.langitmusik.co.id" 
    "payment.langitmusik.co.id" 
    "mapi.langitmusik.co.id" 
    "webmail.langitmusik.co.id" 
    "api.langitmusik.co.id" 
    "media.langitmusik.co.id" 
    "langitmusik.co.id" 
    "www.langitmusik.co.id" 
    "links.langitmusik.co.id" 
    "play.langitmusik.co.id" 
    "auth.langitmusik.co.id" 
    "static.langitmusik.co.id"
    "udemy.com"
)

cf_ns=("ns1.cloudflare.com" "ns2.cloudflare.com" "ns3.cloudflare.com" "ns4.cloudflare.com")

punya() {
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
            echo "1"
            return
        fi
    }
    echo "0"
}

echo "Memulai scanning..."
echo "-------------------"

for domain in "${domains[@]}"; do
    echo -e "\e[33mScanning: $domain\e[0m"
    
    ns_records=($(dig NS $domain +short 2>/dev/null))
    pakai_ns_cf=0
    for ns in "${ns_records[@]}"; do
        if [ $(punya "${cf_ns[@]}" "$ns") -eq 1 ]; then
            pakai_ns_cf=1
            break
        fi
    done
    
    ip=$(dig A $domain +short | head -n 1 2>/dev/null)
    ip_cf=0
    if [[ -n "$ip" ]]; then
        if whois $ip | grep -qi "cloudflare"; then
            ip_cf=1
        fi
    fi
    
    headers=$(curl -sI "http://$domain" -m 5 2>/dev/null)
    header_cf=0
    if echo "$headers" | grep -qi "cloudflare" || echo "$headers" | grep -qi "cf-ray"; then
        header_cf=1
    fi
    
    if [ $pakai_ns_cf -eq 1 ] || [ $ip_cf -eq 1 ] || [ $header_cf -eq 1 ]; then
        echo -e "\e[32mResult: PAKAI CLOUDFLARE\e[0m"
        if [ $pakai_ns_cf -eq 1 ]; then
            echo "  * NS Record: ${ns_records[@]}"
        fi
        if [ $ip_cf -eq 1 ]; then
            echo "  * IP Cloudflare: $ip"
        fi
        if [ $header_cf -eq 1 ]; then
            echo "  * Header CF ketemu"
        fi
    else
        echo -e "\e[31mResult: GAK PAKAI CLOUDFLARE\e[0m"
        if [[ -n "$ip" ]]; then
            echo "  * IP: $ip"
        else
            echo "  * Gak ada A record"
        fi
    fi
    
    echo "-------------------"
done

echo -e "\e[35m"
echo "Script by Ari Ade Supriyatna | 2023"
echo "Gunakan dengan bijak!"
echo "From a Researcher to Everyone"
echo -e "\e[0m"
