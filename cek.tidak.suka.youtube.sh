#!/bin/bash

# ==============================
# YouTube Dislike Checker Tool
# by: ariadesupriyatna
# ==============================

API_URL="https://returnyoutubedislikeapi.com/votes"

# Cek apakah jq dan curl tersedia
for cmd in curl jq; do
    if ! command -v $cmd &> /dev/null; then
        echo "❌ Error: '$cmd' belum terinstall."
        echo "Silakan install dengan: sudo apt install $cmd"
        exit 1
    fi
done

# Fungsi untuk ambil data dari API
get_video_stats() {
    local VIDEO_ID="$1"
    local RESPONSE=$(curl -s "$API_URL?videoId=$VIDEO_ID")

    if echo "$RESPONSE" | jq -e '.error' > /dev/null; then
        echo "❌ Video tidak ditemukan atau ID salah."
        return 1
    fi

    echo "🎬 Informasi Video ID: $VIDEO_ID"
    echo "───────────────────────────────"
    echo "📅 Dibuat     : $(echo "$RESPONSE" | jq -r '.dateCreated')"
    echo "👍 Likes      : $(echo "$RESPONSE" | jq -r '.likes')"
    echo "👎 Dislikes   : $(echo "$RESPONSE" | jq -r '.dislikes')"
    echo "⭐ Rating     : $(echo "$RESPONSE" | jq -r '.rating')"
    echo "👁  Views     : $(echo "$RESPONSE" | jq -r '.viewCount')"
    echo "───────────────────────────────"
}

# Loop interaktif
while true; do
    read -p "Masukkan YouTube Video ID (atau ketik 'keluar' untuk keluar): " input

    if [[ "$input" == "keluar" ]]; then
        echo "👋 Keluar dari program. Terima kasih!"
        break
    fi

    if [[ -z "$input" ]]; then
        echo "⚠️  Input tidak boleh kosong!"
        continue
    fi

    get_video_stats "$input"
    echo
done