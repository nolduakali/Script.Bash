#!/bin/bash

# Buat wordlist berdasarkan pattern WordPress
echo "Membuat wordlist untuk WordPress password check..."

# 1. Username patterns (3-12 chars)
crunch 3 12 abcdefghijklmnopqrstuvwxyz0123456789 -t @@@%%%% -o temp_usernames.txt

# 2. Common names (4-10 chars, letters only)
crunch 4 10 abcdefghijklmnopqrstuvwxyz -o temp_names.txt

# 3. Gabungkan dan filter (min 4 chars)
cat temp_usernames.txt temp_names.txt | \
awk 'length($0) >= 4' | \
sort -u > wordpress_patterns.txt

# 4. Tambahkan domain keywords
echo -e "gmail\nyahoo\nhotmail\noutlook\nwordpress\nblog\nsite\nweb\nadmin\nemail\nmail\nlogin" >> wordpress_patterns.txt

# 5. Clean up
rm temp_usernames.txt temp_names.txt

echo "Wordlist selesai: wordpress_patterns.txt"
echo "Total kata: $(wc -l < wordpress_patterns.txt)"
