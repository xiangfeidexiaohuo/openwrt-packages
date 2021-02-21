wget 'https://raw.githubusercontent.com/houzi-/CDN/master/kp.dat' -O files/usr/share/koolproxy/data/rules/kp.dat
wget 'https://raw.githubusercontent.com/houzi-/CDN/master/koolproxy.txt' -O files/usr/share/koolproxy/data/rules/koolproxy.txt
wget 'https://raw.githubusercontent.com/houzi-/CDN/master/daily.txt' -O files/usr/share/koolproxy/data/rules/daily.txt
wget 'https://raw.githubusercontent.com/houzi-/CDN/master/user.txt' -O files/usr/share/koolproxy/data/user.txt
wget 'https://github.com/houzi-/CDN/raw/master/binary/v3.8.5/arm' -O files/bin/arm
wget 'https://github.com/houzi-/CDN/raw/master/binary/v3.8.5/x86' -O files/bin/i386
wget 'https://github.com/houzi-/CDN/raw/master/binary/v3.8.5/mips' -O files/bin/mips
wget 'https://github.com/houzi-/CDN/raw/master/binary/v3.8.5/mipsel' -O files/bin/mipsel
wget 'https://github.com/houzi-/CDN/raw/master/binary/v3.8.5/aarch64' -O files/bin/aarch64
wget 'https://github.com/houzi-/CDN/raw/master/binary/v3.8.5/x86_64' -O files/bin/x86_64

chmod +x files/bin/*

wget https://easylist-downloads.adblockplus.org/easylistchina+easylist.txt -O- | grep ^\|\|[^\*]*\^$ | sed -e 's:||:address\=\/:' -e 's:\^:/0\.0\.0\.0:' > files/usr/share/koolproxy/dnsmasq.adblock
sed -i '/youku/d' files/usr/share/koolproxy/dnsmasq.adblock
sed -i '/[1-9]\{1,3\}\.[1-9]\{1,3\}\.[1-9]\{1,3\}\.[1-9]\{1,3\}/d' files/usr/share/koolproxy/dnsmasq.adblock
