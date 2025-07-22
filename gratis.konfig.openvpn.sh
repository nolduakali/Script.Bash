#!/bin/bash


#Researcher = nolduakali
#Team = 98 | bf7
#tool = mt manager tuk ngintip api nya & deepseek tuk program dasar
#sudah di test dan berhasil konek
#tadinya mau pakai python biar mudah dan cepet selesai
#tapi puter otak dan beginilah hasilnya


# Download file CSV
echo "Mengunduh file CSV dari api.ovpn.pw..."
wget -q https://api.ovpn.pw/csv -O data_vpn.csv

# Cek apakah download berhasil
if [ ! -f data_vpn.csv ]; then
    echo "Gagal mengunduh file CSV!"
    exit 1
fi

# Konfigurasi cipher yang akan ditambahkan
CIPHER="
data-ciphers AES-128-CBC
data-ciphers-fallback AES-128-CBC"

# Proses decoding Base64 ke file .ovpn
echo "Memproses konfigurasi VPN..."
counter=1

# Filter teks Base64 menggunakan regex
grep -oE '([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)?' data_vpn.csv | while read -r baris; do
    # Pastikan ini Base64 valid
    if [[ $baris =~ ^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)?$ ]] && [ $(( ${#baris} % 4 )) -eq 0 ]; then
        # Decode dan simpan sebagai file .ovpn
        echo "$baris" | base64 -d > "vpn${counter}.ovpn" 2>/dev/null
        
        # Cek apakah file berisi konfigurasi OpenVPN (minimal ada "remote")
        if grep -q "remote " "vpn${counter}.ovpn"; then
            # Tambahkan cipher di akhir file
            echo "$CIPHER" >> "vpn${counter}.ovpn"
            echo "Berhasil membuat vpn${counter}.ovpn"
            ((counter++))
        else
            rm -f "vpn${counter}.ovpn"  # Hapus jika tidak valid
        fi
    fi
done

echo "Selesai! Total file VPN yang dibuat: $((counter-1))"
