# PERIER Flavien
# 24/07/2017
# Update des listes des listes de sites bloqués

#!/bin/bash

# wget -O /etc/squid/lists/ads.txt http://pgl.yoyo.org/adservers/serverlist.php?hostformat=squid-dstdom-regex\&showintro=1\&mimetype=plaintext

rsync -arpogvt rsync://ftp.ut-capitole.fr/blacklist .
mv ./dest/ddos/domains ./lists/ddos.txt
mv ./dest/hacking/domains ./lists/hacking.txt
mv ./dest/phishing/domains ./lists/phishing.txt
mv ./dest/redirector/domains ./lists/redirector.txt
mv ./dest/remote-control/domains ./lists/remote-control.txt
mv ./dest/ads/domains ./lists/ads.txt
mv ./dest/adult/domains ./lists/porn.txt

rm -R ./dest

/etc/init.d/squid restart
