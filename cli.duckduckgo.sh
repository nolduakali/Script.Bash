#!/bin/bash

# Fungsi untuk mengambil jawaban dari DuckDuckGo Instant Answer API
ambil_jawaban() {
    local query="$1"
    local url="https://api.duckduckgo.com/"
    local response

    # Gunakan curl dengan timeout dan penanganan error
    response=$(curl -Gs --compressed \
        --connect-timeout 5 \
        --max-time 10 \
        --data-urlencode "q=$query" \
        --data-urlencode "format=json" \
        --data-urlencode "no_redirect=1" \
        --data-urlencode "skip_disambig=1" \
        "$url" 2>/dev/null)

    # Periksa apakah curl berhasil
    if [ $? -ne 0 ]; then
        echo "Error: Gagal terhubung ke API DuckDuckGo"
        return 1
    fi

    # Periksa apakah response kosong
    if [ -z "$response" ]; then
        echo "Error: Menerima response kosong dari API"
        return 1
    fi

    # Parse response JSON
    local jawaban
    jawaban=$(echo "$response" | jq -r '
        if .AbstractText != "" then
            .AbstractText
        elif .Answer != "" then
            .Answer
        elif .RelatedTopics and (.RelatedTopics | length) > 0 then
            .RelatedTopics[] | select(.Text != null) | .Text
        else
            empty
        end' | head -n 5)  # Batasi hingga 5 hasil teratas

    if [ -z "$jawaban" ]; then
        echo "Tidak ditemukan jawaban untuk \"$query\""
    else
        echo "$jawaban"
    fi
}

# Fungsi utama
utama() {
    # Periksa apakah jq terinstal
    if ! command -v jq &> /dev/null; then
        echo "Error: jq diperlukan tetapi tidak terinstal. Silakan instal jq terlebih dahulu."
        exit 1
    fi

    # Baca query dari argumen atau prompt
    local query
    if [ $# -gt 0 ]; then
        query="$*"
    else
        echo "Masukkan pencarian Anda:"
        read -r query
    fi

    # Periksa apakah query kosong
    if [ -z "$query" ]; then
        echo "Error: Pencarian tidak boleh kosong"
        exit 1
    fi

    echo "Mencari: $query"
    echo ""

    # Ambil dan tampilkan jawaban
    ambil_jawaban "$query"
}

# Tangani interupsi script
trap "echo -e '\nOperasi dibatalkan.'; exit 1" INT

# Jalankan fungsi utama dengan semua argumen
utama "$@"
