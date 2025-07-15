#!/bin/bash

# Fungsi untuk menampilkan header
header() {
	clear
	echo "===================================="
	echo "         TEXT REPEATER TOOL         "
	echo "===================================="
	echo
}

# Fungsi utama
main() {
	header

# Input teks
	read -p "1. Kata apa? " text

# Validasi input tidak kosong
	while [[ -z "$text" ]];
	do
		echo "Teks tidak boleh kosong!"
		read -p "1. Kata apa? " text
		done

# Input jumlah pengulangan
		read -p "2. Jumlah berapa? (1-1000) " count

# Validasi angka antara 1-1000
		while ! [[ "$count" =~ ^[0-9]+$ ]] || (( count < 1 || count > 1000 ));
	do
		echo "Masukkan angka antara 1-1000!"
		read -p "2. Jumlah berapa? (1-1000) " count
		done

# Generate hasil
		result=$(printf "%${count}s" | sed "s/ /${text} /g" | sed 's/ $//')

# Tampilkan hasil
		       header
		       echo "Hasil:"
		       echo "$result"
		       echo

# Tanya untuk mengulang
		       read -p "Ulangi lagi? (y/n) " -n 1 -r
		       echo
		       if [[ $REPLY =~ ^[Yy]$ ]];
	then
	main
		else
			echo "Terima kasih telah menggunakan tool ini!"
			fi
		}

# Jalankan program
main
