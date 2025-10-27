#!/bin/bash

# × ariadesupriyatna × nolduakali × zeronegatif × riderone × n00bx8 ×

echo -e "\033[1;35m"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                   SYSTEM RECONNAISSANCE SCRIPT                             ║"
echo "║                   Penetration Testing Toolkit                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "\033[0m"

# =========================================================
# INFORMASI SISTEM DASAR
# =========================================================

echo -e "\033[1;33m[+] INFORMASI SISTEM DASAR\033[0m"
echo "════════════════════════════════════════════════════════════════"

echo -e "\033[1;36m[*] Kernel dan Informasi Distribusi\033[0m"
echo "────────────────────────────────────────────────────────"
uname -a
echo
cat /etc/*-release 2>/dev/null
echo

echo -e "\033[1;36m[*] Informasi Hostname dan Uptime\033[0m"
echo "────────────────────────────────────────────────────────"
hostname
hostname -f 2>/dev/null
uptime
echo

echo -e "\033[1;36m[*] Informasi Disk dan Partisi\033[0m"
echo "────────────────────────────────────────────────────────"
df -h
echo
lsblk 2>/dev/null
echo

# =========================================================
# INFORMASI JARINGAN
# =========================================================

echo -e "\033[1;33m[+] INFORMASI JARINGAN\033[0m"
echo "════════════════════════════════════════════════════════════════"

echo -e "\033[1;36m[*] Konfigurasi Jaringan\033[0m"
echo "────────────────────────────────────────────────────────"
ip a show
echo

echo -e "\033[1;36m[*] Tabel Routing\033[0m"
echo "────────────────────────────────────────────────────────"
route -n
ip route 2>/dev/null
echo

echo -e "\033[1;36m[*] Informasi DNS\033[0m"
echo "────────────────────────────────────────────────────────"
cat /etc/resolv.conf 2>/dev/null
cat /etc/hosts 2>/dev/null
echo

echo -e "\033[1;36m[*] Koneksi Jaringan Aktif\033[0m"
echo "────────────────────────────────────────────────────────"
netstat -tulpn 2>/dev/null || ss -tulpn 2>/dev/null
echo

echo -e "\033[1;36m[*] Firewall dan Iptables\033[0m"
echo "────────────────────────────────────────────────────────"
iptables -L 2>/dev/null
ufw status 2>/dev/null
echo

# =========================================================
# INFORMASI PENGGUNA DAN OTENTIKASI
# =========================================================

echo -e "\033[1;33m[+] INFORMASI PENGGUNA DAN OTENTIKASI\033[0m"
echo "════════════════════════════════════════════════════════════════"

echo -e "\033[1;36m[*] Informasi Pengguna Saat Ini\033[0m"
echo "────────────────────────────────────────────────────────"
whoami
id
echo

echo -e "\033[1;36m[*] Daftar Semua Pengguna\033[0m"
echo "────────────────────────────────────────────────────────"
cat /etc/passwd
echo

echo -e "\033[1;36m[*] Daftar Pengguna dengan Shell Login\033[0m"
echo "────────────────────────────────────────────────────────"
grep -v "/nologin\|/false" /etc/passwd
echo

echo -e "\033[1;36m[*] Akun Root\033[0m"
echo "────────────────────────────────────────────────────────"
grep "x:0:" /etc/passwd
echo

echo -e "\033[1;36m[*] File Shadow (jika dapat diakses)\033[0m"
echo "────────────────────────────────────────────────────────"
cat /etc/shadow 2>/dev/null || echo "Tidak dapat mengakses /etc/shadow"
echo

echo -e "\033[1;36m[*] Kebijakan Password\033[0m"
echo "────────────────────────────────────────────────────────"
grep "^PASS" /etc/login.defs 2>/dev/null
chage -l $(whoami) 2>/dev/null
echo

echo -e "\033[1;36m[*] Informasi Login\033[0m"
echo "────────────────────────────────────────────────────────"
who
last | head -20
echo

# =========================================================
# PRIVILEGE ESCALATION CHECKS
# =========================================================

echo -e "\033[1;33m[+] PRIVILEGE ESCALATION CHECKS\033[0m"
echo "════════════════════════════════════════════════════════════════"

echo -e "\033[1;36m[*] Sudo Permissions\033[0m"
echo "────────────────────────────────────────────────────────"
sudo -l 2>/dev/null || echo "Tidak ada akses sudo"
echo

echo -e "\033[1;36m[*] File Sudoers\033[0m"
echo "────────────────────────────────────────────────────────"
ls -la /etc/sudoers /etc/sudoers.d/ 2>/dev/null
echo

echo -e "\033[1;36m[*] SUID/GUID Files\033[0m"
echo "────────────────────────────────────────────────────────"
find / -perm -4000 -type f 2>/dev/null | head -20
echo
find / -perm -2000 -type f 2>/dev/null | head -20
echo

echo -e "\033[1;36m[*] Files dengan Capabilities\033[0m"
echo "────────────────────────────────────────────────────────"
getcap -r / 2>/dev/null | head -20
echo

echo -e "\033[1;36m[*] World Writable Files\033[0m"
echo "────────────────────────────────────────────────────────"
find / -perm -2 -type f 2>/dev/null | grep -v "/proc/" | head -20
echo

echo -e "\033[1;36m[*] Cron Jobs\033[0m"
echo "────────────────────────────────────────────────────────"
crontab -l 2>/dev/null
ls -la /etc/cron* 2>/dev/null
cat /etc/crontab 2>/dev/null
echo

# =========================================================
# WEB PENTEST SECTION
# =========================================================

echo -e "\033[1;33m[+] WEB PENTEST CHECKS\033[0m"
echo "════════════════════════════════════════════════════════════════"

echo -e "\033[1;36m[*] Web Services yang Berjalan\033[0m"
echo "────────────────────────────────────────────────────────"
netstat -tulpn | grep -E ":80|:443|:8080|:8000" 2>/dev/null
echo

echo -e "\033[1;36m[*] Web Server Configuration\033[0m"
echo "────────────────────────────────────────────────────────"
find /etc -name "*apache*" -o -name "*nginx*" -o -name "*httpd*" 2>/dev/null | head -10
echo

echo -e "\033[1;36m[*] Web Root Directories\033[0m"
echo "────────────────────────────────────────────────────────"
find /var/www /usr/share/nginx /opt /home -type d -name "html" -o -name "htdocs" -o -name "public_html" 2>/dev/null | head -10
echo

echo -e "\033[1;36m[*] Web Application Files\033[0m"
echo "────────────────────────────────────────────────────────"
find /var/www /home -name "*.php" -o -name "*.jsp" -o -name "*.asp" 2>/dev/null | head -10
echo

echo -e "\033[1;36m[*] Web Server Logs\033[0m"
echo "────────────────────────────────────────────────────────"
find /var/log -name "*access*" -o -name "*error*" -o -name "*apache*" -o -name "*nginx*" 2>/dev/null | head -10
echo

echo -e "\033[1;36m[*] Database Configuration Files\033[0m"
echo "────────────────────────────────────────────────────────"
find /etc -name "my.cnf" -o -name "*.sql" 2>/dev/null
find /var/www -name "*.php" -exec grep -l "mysql_connect\|password" {} \; 2>/dev/null | head -5
echo

# =========================================================
# BINARY EXPLOITATION SECTION
# =========================================================

echo -e "\033[1;33m[+] BINARY EXPLOITATION CHECKS\033[0m"
echo "════════════════════════════════════════════════════════════════"

echo -e "\033[1;36m[*] Security Protections\033[0m"
echo "────────────────────────────────────────────────────────"
echo "ASLR: $(cat /proc/sys/kernel/randomize_va_space 2>/dev/null)"
execstack -q /bin/ls 2>/dev/null && echo "Execstack tersedia"
echo

echo -e "\033[1;36m[*] Development Tools\033[0m"
echo "────────────────────────────────────────────────────────"
which gcc && echo "GCC tersedia"
which gdb && echo "GDB tersedia"
which python && echo "Python tersedia"
which perl && echo "Perl tersedia"
which php && echo "PHP tersedia"
echo

echo -e "\033[1;36m[*] Binary Analysis Tools\033[0m"
echo "────────────────────────────────────────────────────────"
which objdump && echo "Objdump tersedia"
which readelf && echo "Readelf tersedia"
which strings && echo "Strings tersedia"
which ltrace && echo "Ltrace tersedia"
which strace && echo "Strace tersedia"
echo

echo -e "\033[1;36m[*] Interesting SUID Binaries\033[0m"
echo "────────────────────────────────────────────────────────"
for binary in nmap vim bash find awk less more python perl php; do
    find / -name "$binary" -perm -4000 2>/dev/null | while read file; do
        echo "[SUID] $file"
        file "$file" 2>/dev/null
    done
done
echo

# =========================================================
# CONTAINER & VIRTUALIZATION CHECKS
# =========================================================

echo -e "\033[1;33m[+] CONTAINER & VIRTUALIZATION\033[0m"
echo "════════════════════════════════════════════════════════════════"

echo -e "\033[1;36m[*] Container Detection\033[0m"
echo "────────────────────────────────────────────────────────"
cat /proc/1/cgroup 2>/dev/null | grep -i "docker\|lxc" && echo "Mungkin dalam container"
docker --version 2>/dev/null && echo "Docker terinstall"
which podman 2>/dev/null && echo "Podman terinstall"
echo

echo -e "\033[1;36m[*] Cloud Metadata\033[0m"
echo "────────────────────────────────────────────────────────"
curl -s http://169.254.169.254/latest/meta-data/ 2>/dev/null && echo "AWS Metadata tersedia"
echo

# =========================================================
# APPLICATION & SERVICE CHECKS
# =========================================================

echo -e "\033[1;33m[+] APLIKASI & SERVICE\033[0m"
echo "════════════════════════════════════════════════════════════════"

echo -e "\033[1;36m[*] Running Processes\033[0m"
echo "────────────────────────────────────────────────────────"
ps aux --sort=-%mem | head -20
echo

echo -e "\033[1;36m[*] Service Management\033[0m"
echo "────────────────────────────────────────────────────────"
systemctl list-units --type=service 2>/dev/null | head -15
service --status-all 2>/dev/null | head -15
echo

echo -e "\033[1;36m[*] Installed Packages\033[0m"
echo "────────────────────────────────────────────────────────"
which dpkg && dpkg -l 2>/dev/null | head -20
which rpm && rpm -qa 2>/dev/null | head -20
echo

# =========================================================
# FILE SYSTEM & SENSITIVE FILES
# =========================================================

echo -e "\033[1;33m[+] FILE SYSTEM & FILE SENSITIF\033[0m"
echo "════════════════════════════════════════════════════════════════"

echo -e "\033[1;36m[*] File Konfigurasi Sensitif\033[0m"
echo "────────────────────────────────────────────────────────"
find /etc -name "*.conf" -o -name "*.cfg" 2>/dev/null | head -15
echo

echo -e "\033[1;36m[*] Backup Files\033[0m"
echo "────────────────────────────────────────────────────────"
find / -name "*.bak" -o -name "*.backup" -o -name "*~" 2>/dev/null | head -10
echo

echo -e "\033[1;36m[*] History Files\033[0m"
echo "────────────────────────────────────────────────────────"
find /home /root -name ".*history" -o -name ".*bash_history" 2>/dev/null
echo

echo -e "\033[1;36m[*] SSH Keys dan Konfigurasi\033[0m"
echo "────────────────────────────────────────────────────────"
find / -name "id_rsa" -o -name "id_dsa" -o -name "known_hosts" 2>/dev/null | head -10
ls -la ~/.ssh/ 2>/dev/null
echo

echo -e "\033[1;36m[*] File dengan Credentials\033[0m"
echo "────────────────────────────────────────────────────────"
find / -name "*.pem" -o -name "*.key" -o -name "*.crt" 2>/dev/null | head -10
grep -r "password\|passwd\|pwd" /etc 2>/dev/null | head -5
echo

# =========================================================
# NETWORK SERVICE DISCOVERY
# =========================================================

echo -e "\033[1;33m[+] NETWORK SERVICE DISCOVERY\033[0m"
echo "════════════════════════════════════════════════════════════════"

echo -e "\033[1;36m[*] Port Scanning Localhost\033[0m"
echo "────────────────────────────────────────────────────────"
nmap 127.0.0.1 -p- --open 2>/dev/null || \
echo "Gunakan perintah berikut untuk scan manual:"
echo "nmap 127.0.0.1"
echo "netstat -tulpn || ss -tulpn"
echo

echo -e "\033[1;36m[*] Service Versions\033[0m"
echo "────────────────────────────────────────────────────────"
nmap 127.0.0.1 -sV 2>/dev/null | head -20
echo

# =========================================================
# EXPLOITATION PREPARATION
# =========================================================

echo -e "\033[1;33m[+] EXPLOITATION PREPARATION\033[0m"
echo "════════════════════════════════════════════════════════════════"

echo -e "\033[1;36m[*] System Architecture\033[0m"
echo "────────────────────────────────────────────────────────"
uname -m
lscpu 2>/dev/null | head -10
echo

echo -e "\033[1;36m[*] Kernel Version dan Exploit Check\033[0m"
echo "────────────────────────────────────────────────────────"
uname -r
echo "Cek exploits untuk: $(uname -s) $(uname -r)"
echo

echo -e "\033[1;36m[*] Environment Variables\033[0m"
echo "────────────────────────────────────────────────────────"
env | grep -i "pass\|user\|key\|token\|secret" | head -10
echo

echo -e "\033[1;36m[*] Writable Directories\033[0m"
echo "────────────────────────────────────────────────────────"
find / -type d -perm -2 -ls 2>/dev/null | grep -v "/proc/" | head -10
echo

# =========================================================
# QUICK VULNERABILITY CHECKS
# =========================================================

echo -e "\033[1;33m[+] QUICK VULNERABILITY CHECKS\033[0m"
echo "════════════════════════════════════════════════════════════════"

echo -e "\033[1;36m[*] Dirty Pipe/Dirty Cow Check\033[0m"
echo "────────────────────────────────────────────────────────"
uname -r | grep -E "3\.|4\.|5\.|6\.0|6\.1|6\.2|6\.3|6\.4|6\.5|6\.6|6\.7" && echo "Mungkin vulnerable ke Dirty Pipe/Cow"
echo

echo -e "\033[1;36m[*] Sudo Version Check\033[0m"
echo "────────────────────────────────────────────────────────"
sudo --version 2>/dev/null | head -1
echo

echo -e "\033[1;36m[*] Kernel Exploit Suggester\033[0m"
echo "────────────────────────────────────────────────────────"
echo "Gunakan tools seperti:"
echo "linux-exploit-suggester.sh"
echo "linuxprivchecker.py"
echo "linpeas.sh"
echo

# =========================================================
# SUMMARY & RECOMMENDATIONS
# =========================================================

echo -e "\033[1;33m[+] SUMMARY & REKOMENDASI\033[0m"
echo "════════════════════════════════════════════════════════════════"

echo -e "\033[1;36m[*] Poin Penting untuk Dieksplorasi:\033[0m"
echo "────────────────────────────────────────────────────────"
echo "1. Cek SUID/GUID binaries yang unusual"
echo "2. Review cron jobs dan systemd timers"
echo "3. Cek capabilities pada binaries"
echo "4. Review konfigurasi sudo"
echo "5. Cek world-writable files dan directories"
echo "6. Review service yang berjalan sebagai root"
echo "7. Cek kernel version untuk known exploits"
echo "8. Review konfigurasi web application"
echo "9. Cek credentials dalam file konfigurasi"
echo "10. Review network services yang exposed"
echo

echo -e "\033[1;35m"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                   SCAN SELESAI                                             ║"
echo "║         Review output di atas untuk potensi eksploitasi                    ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "\033[0m"

echo -e "\033[1;33m[*] Tools Recommended untuk Next Steps:\033[0m"
echo "• LinPEAS: https://github.com/carlospolop/PEASS-ng"
echo "• Linux Exploit Suggester: https://github.com/mzet-/linux-exploit-suggester"
echo "• Linux Priv Checker: https://github.com/sleventyeleven/linuxprivchecker"
echo "• PsPy: https://github.com/DominicBreuker/pspy"
echo