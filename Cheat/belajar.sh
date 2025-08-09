#!/usr/bin/env bash
# Baris pertama skrip adalah shebang, yang memberi tahu sistem cara menjalankan skrip.
# Penjelasan: https://id.wikipedia.org/wiki/Shebang
# Seperti yang sudah diketahui, komentar diawali dengan tanda #. Shebang juga dianggap komentar.

# Contoh sederhana hello world:
echo "Hello world!" # => Hello world!

# Setiap perintah dimulai pada baris baru, atau setelah titik koma:
echo "Ini perintah pertama"; echo "Ini perintah kedua"
# => Ini perintah pertama
# => Ini perintah kedua

# Mendeklarasikan variabel:
variable="Beberapa teks"

# Tetapi tidak seperti ini:
variable = "Beberapa teks" # => error "variable: command not found"
# Bash akan menganggap `variable` adalah perintah yang harus dijalankan, lalu gagal menemukannya.

# Atau tidak seperti ini:
variable= "Beberapa teks" # => error: "Beberapa teks: command not found"
# Bash akan menganggap "Beberapa teks" adalah perintah yang dijalankan.
# "variable=" di sini dianggap sebagai variabel sementara untuk perintah "Beberapa teks".

# Menggunakan variabel:
echo "$variable" # => Beberapa teks
echo '$variable' # => $variable
# Saat menggunakan variabel — mengisinya, mengekspornya, dll — tulis namanya tanpa $.
# Jika ingin nilai variabelnya, gunakan $.  
# Tanda kutip tunggal ' tidak akan mengekspansi variabel.  
# Disarankan gunakan tanda kutip ganda untuk menghindari masalah spasi.

# Ekspansi parameter ${...}:
echo "${variable}" # => Beberapa teks
# Ini mengambil nilai dari variabel.
# "Ekspansi" artinya menampilkan nilainya.
# Saat ekspansi, nilai bisa dimodifikasi.

# Substitusi string dalam variabel:
echo "${variable/Beberapa/A}" # => A teks
# Mengganti kemunculan pertama "Beberapa" dengan "A".

# Mengambil substring dari variabel:
length=7
echo "${variable:0:length}" # => Beberapa
echo "${variable: -5}" # => teks
# Mengambil karakter terakhir. Spasi sebelum -5 wajib.

# Panjang string:
echo "${#variable}" # => 13

# Ekspansi tidak langsung:
other_variable="variable"
echo ${!other_variable} # => Beberapa teks
# Mengambil nilai dari nama variabel yang disimpan di variabel lain.

# Nilai default variabel:
echo "${foo:-"NilaiDefaultJikaFooKosong"}"
# => NilaiDefaultJikaFooKosong
# Bekerja untuk null (foo=) dan string kosong. Nilai 0 tetap dianggap ada.

# Membuat array dengan 6 elemen:
array=(satu dua tiga empat lima enam)
# Menampilkan elemen pertama:
echo "${array[0]}" # => "satu"
# Menampilkan semua elemen:
echo "${array[@]}" # => "satu dua tiga empat lima enam"
# Jumlah elemen array:
echo "${#array[@]}" # => "6"
# Panjang elemen ketiga:
echo "${#array[2]}" # => "4"
# Menampilkan 2 elemen mulai dari elemen keempat:
echo "${array[@]:3:2}" # => "empat lima"
# Menampilkan semua elemen, masing-masing di baris baru:
for item in "${array[@]}"; do
    echo "$item"
done

# Variabel bawaan:
echo "Nilai keluar program terakhir: $?"
echo "PID skrip ini: $$"
echo "Jumlah argumen: $#"
echo "Semua argumen: $@"
echo "Argumen terpisah: $1 $2..."

# Ekspansi kurung {...}
echo {1..10} # => 1 2 3 4 5 6 7 8 9 10
echo {a..z}  # => a b c ... z
# Tidak bisa memakai variabel:
from=1
to=10
echo {$from..$to} # => {$from..$to}

# Direktori saat ini: `pwd` atau $PWD
echo "Saya di $(pwd)"
echo "Saya di $PWD"

# Membersihkan layar:
clear
# Ctrl-L juga bisa.

# Membaca input:
echo "Siapa namamu?"
read name
echo "Halo, $name!"

# Struktur if:
if [[ "$name" != "$USER" ]]; then
    echo "Namamu bukan username login"
else
    echo "Namamu sama dengan username login"
fi

# Contoh if dengan && dan ||:
read age
if [[ "$name" == "Steve" ]] && [[ "$age" -eq 15 ]]; then
    echo "Jalan jika nama Steve DAN umur 15."
fi

if [[ "$name" == "Daniya" ]] || [[ "$name" == "Zach" ]]; then
    echo "Jalan jika nama Daniya ATAU Zach."
fi

# Mengecek string kosong:
if [[ -z "$name" ]]; then
    echo "Nama kosong"
fi

# Operator perbandingan angka:
# -ne: tidak sama
# -lt: kurang dari
# -gt: lebih dari
# -le: kurang atau sama
# -ge: lebih atau sama

# Operator regex =~:
email=me@example.com
if [[ "$email" =~ [a-z]+@[a-z]{2,}\.(com|net|org) ]]; then
    echo "Email valid!"
fi

# Eksekusi bersyarat:
echo "Selalu jalan" || echo "Hanya jalan jika pertama gagal"
echo "Selalu jalan" && echo "Jalan jika pertama sukses"

# Menjalankan di background (&):
sleep 30 &
jobs
fg
bg
kill %2

# Alias:
alias ping='ping -c 5'
\ping 192.168.1.1
alias -p

# Ekspresi aritmatika:
echo $(( 10 + 5 )) # => 15

# Melihat file di direktori:
ls
ls -l
ls -t
ls -R

# Pipeline:
ls -l | grep "\.txt"

# Menampilkan file:
cat file.txt

# Membaca file ke variabel:
Contents=$(cat file.txt)
echo -e "AWAL\n$Contents\nAKHIR"

# Menyalin file/direktori:
cp srcFile.txt clone.txt
cp -r srcDirectory/ dst/

# Memindahkan atau mengganti nama file:
mv s0urc3.txt dst.txt

# Ganti direktori:
cd ~
cd ..
cd /path/ke/folder
cd -

# Subshell:
(echo "Sekarang di: $PWD") && (cd someDir; echo "Sekarang di: $PWD")
pwd

# Membuat direktori:
mkdir myNewDir
mkdir -p myNewDir/with/intermediate/directories

# Redirection:
cat > hello.py << EOF
#!/usr/bin/env python
from __future__ import print_function
import sys
print("#stdout", file=sys.stdout)
print("#stderr", file=sys.stderr)
for line in sys.stdin:
    print(line, file=sys.stdout)
EOF

# Menjalankan skrip dengan redirection:
python hello.py < "input.in"
python hello.py > "output.out"
python hello.py 2> "error.err"
python hello.py > "gabungan.log" 2>&1
python hello.py > /dev/null 2>&1
python hello.py >> "output.out" 2>> "error.err"

# Membersihkan file:
rm -v output.out error.err gabungan.log
rm -r tempDir/

# Substitusi perintah:
echo "Ada $(ls | wc -l) item di sini."

# Statement case:
case "$Variable" in
    0) echo "Ada nol.";;
    1) echo "Ada satu.";;
    *) echo "Bukan nol.";;
esac

# For loop sederhana:
for Variable in {1..3}; do
    echo "$Variable"
done

# For loop gaya C:
for ((a=1; a <= 3; a++)); do
    echo $a
done

# Loop untuk file:
for Variable in file1 file2; do
    cat "$Variable"
done

# Loop dari output perintah:
for Output in $(ls); do
    cat "$Output"
done

# Loop untuk semua file markdown:
for Output in ./*.markdown; do
    cat "$Output"
done

# While loop:
while [ true ]; do
    echo "Isi loop..."
    break
done

# Fungsi:
function foo () {
    echo "Argumen: $@"
    echo "Dan: $1 $2..."
    echo "Ini fungsi"
    returnValue=0
    return $returnValue
}
foo arg1 arg2
resultValue=$?

bar () {
    echo "Deklarasi fungsi cara lain!"
    return 0
}
bar

foo "Namaku" $Name

# Perintah berguna:
tail -n 10 file.txt
head -n 10 file.txt
sort file.txt
uniq -d file.txt
cut -d ',' -f 1 file.txt
sed -i 's/okay/great/g' file.txt
grep "^foo.*bar$" file.txt
grep -c "^foo.*bar$" file.txt
grep -r "^foo.*bar$" someDir/
grep -n "^foo.*bar$" file.txt
grep -rI "^foo.*bar$" someDir/
grep "^foo.*bar$" file.txt | grep -v "baz"
fgrep "foobar" file.txt

# Trap:
trap "rm $TEMP_FILE; exit" SIGHUP SIGINT SIGTERM

# Sudo:
NAME1=$(whoami)
NAME2=$(sudo whoami)
echo "Dari $NAME1 menjadi $NAME2"

# Bantuan Bash:
help
help help
help for
help return
help source
help .

# Dokumentasi:
apropos bash
man bash
info bash
