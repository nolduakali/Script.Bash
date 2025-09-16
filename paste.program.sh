coder by ariadesupriyatna

cat file.txt | curl -s -F "syntax=text" -F "expiry_days=365" -F "content=<-" https://dpaste.com/api/v2/

#syntax bisa ekstensi bahasa pemograman apapun
#file.txt ganti sesuai syntax yang dipakai
#365 artinya 365 hari , sesuaikanlah
