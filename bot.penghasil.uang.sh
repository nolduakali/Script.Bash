#:Author:ariadesupriyatna
#:lastname:nolduakali/0x00
#:Pendapatan $0.050 * 27 url = 22 ribu lebih
#:Sebarkan skrip ini agar banyak orang yang merasakan manfaatnya
#:perklik per config openvpn. silahkan buat/cari script otomatisnya untuk openvpn. atau modif script ini
#:Team >> Anon Cyber Team & BlackFishSeven

while true; do
  clear
  echo "=== Publik IP ==="
  curl -s ifconfig.me
  echo -e "\n\n=== BOT Givvy Penghasil Dolar ==="
  
  #:Array ini Ubah URL dengan milik Akunmu
  urls=(
    "https://app-earnings-link.com/yourFantasticPet/zd04ql0nf5yqj"
    "https://app-earnings-link.com/masterGoalkeeper/8eswk8bhda6tx"
    "https://app-earnings-link.com/sailMate/c441jq0roofjwps"
    "https://app-earnings-link.com/robotEvolution/5ix3gjxqbp6tvod1x"
    "https://app-earnings-link.com/mermaidTale/p5d5j102z7nt0c865n"
    "https://app-earnings-link.com/wizardForge/3y1u6763wh"
    "https://app-earnings-link.com/basketLegends/fdxc1cspeleiaxev"
    "https://app-earnings-link.com/wrathDragon/0aahcnybz3y880xhks9zd"
    "https://app-earnings-link.com/luckySurfer/mhp59gf1spl0nh2r"
    "https://app-earnings-link.com/prisonBreak/591xpzotx7"
    "https://app-earnings-link.com/lostKingdom/51ewxxavs4d71m4ezz1pg"
    "https://app-earnings-link.com/goodCopBadCop/8xjjtv79hionh"
    "https://app-earnings-link.com/spaceAdventure/imt09zr47xbb"
    "https://app-earnings-link.com/badSanta/htlt137pop064jht8gxyy"
    "https://app-earnings-link.com/twinkleElf/yvy5bhbuxig523g0i11o"
    "https://app-earnings-link.com/zombieApp/mpp07fbaafi8w2rve"
    "https://app-earnings-link.com/badGirls/v8h6o8srkq7r5f"
    "https://app-earnings-link.com/pirateApp/5d2m9q5vg0gkn"
    "https://app-earnings-link.com/crazyKitchen/vofb4ubt0ai8vg5"
    "https://app-earnings-link.com/yetiRun/ibov1zy350n1hk3g7"
    "https://app-earnings-link.com/givvyLudo/5mhy0x0j2z2ek"
    "https://app-earnings-link.com/santaDrift/x5lt05p86gzgm0091ijfa"
    "https://app-earnings-link.com/nutsHeist/libvfcntr49c69"
    "https://app-earnings-link.com/boatApp/v4ubwqx7d25qirr"
    "https://app-earnings-link.com/icyFun/uvf5csm1nfe2nf305v"
    "https://app-earnings-link.com/animalSoccer/5lgtw6t94si5"
    "https://app-earnings-link.com/givvyCryptoMiner/0eb2hg4fe27esjq7i"
  )
  
  
  user_agents=(
    "Mozilla/5.0 (Linux; Android 13; SM-S901B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36"
    "Mozilla/5.0 (Linux; Android 13; SM-G991B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36"
    "Mozilla/5.0 (Linux; Android 13; Pixel 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36"
    "Mozilla/5.0 (Linux; Android 12; SM-G980F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36"
    "Mozilla/5.0 (Linux; Android 13; SM-G998B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36"
    "Mozilla/5.0 (Linux; Android 13; SM-A536B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36"
    "Mozilla/5.0 (Linux; Android 12; SM-N986B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36"
    "Mozilla/5.0 (Linux; Android 13; SM-F711B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36"
    "Mozilla/5.0 (Linux; Android 13; SM-M526BR) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36"
    "Mozilla/5.0 (Linux; Android 13; SM-E426B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36"
  )
  
  
  for url in "${urls[@]}"; do
    
    random_ua=${user_agents[$RANDOM % ${#user_agents[@]}]}
    
    echo -n "Request to ${url} "
    echo -n "[UA: $(echo $random_ua | awk -F'[()]' '{print $2}')] "
    
    
    curl -s -o /dev/null -w "Status: %{http_code}" -A "$random_ua" "$url"
    echo
  done
  
  sleep 5
done