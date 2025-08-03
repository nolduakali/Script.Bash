#!/bin/bash

# =============================================
# Skrip ini untuk mengambil URL audio saja dari video YouTube
# lalu kamu bisa salin URL hasilnya ke VLC Android (APK)
# =============================================

# 1. Jalankan skrip ini di Termux atau terminal Linux:
#    #bash dengerin.podcast.youtube.sh
#
# 2. Setelah URL audio ditampilkan, tekan dan salin URL-nya
#
# 3. Buka aplikasi VLC di Android
#    → Ketuk ikon menu ☰ (kiri atas)
#    → Pilih "Stream" atau "Aliran"
#    → Tempel URL hasil dari skrip ini
#    → Tekan "Play"
#
# 🎧 Selamat menikmati audio YouTube langsung di VLC!

# Masukkan URL YouTube
YT_URL="https://www.youtube.com/watch?v=id-uniknyaa"

# Ambil URL audio terbaik dan tampilkan
yt-dlp -f bestaudio -g "$YT_URL"