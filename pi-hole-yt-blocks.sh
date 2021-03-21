#!/bin/bash
# Description: Block YouTube Ads
# Filename: pi-hole-yt-blocks.sh
# Array of fingerprints
# Add new ones here and the script below will generate the list
# Source: https://discourse.pi-hole.net/t/how-do-i-block-ads-on-youtube/253/12
# Pi-hole cmds: Whitelisting, Blacklisting and Regex: pihole -w, pihole -b, pihole -regex, pihole -wild
# -d, --delmode       Remove domain(s) from the ${listname}
# Paths for binary files
GZIP="/bin/gzip"
path="/opt/scripts/bash"

# dicovered yt googlecontent add subdomains
# light list
fingerprints=( sn-c0q7lnse sn-c0q7lns7 sn-c0q7lnly )
# full list
#fingerprints=( sn-c0q7lnly sn-nv47lnly sn-uxaxh5ji-aw0l sn-c0q7lns7 sn-4g5edns6 sn-c0q7lnse sn-ntqe6nes sn-uxaxh5ji-aw0e sn-c0q7lnsl sn-4g5e6nle sn-8xgp1vo-xfgk sn-8xgp1vo-xfge7 sn-p5qlsnll sn-a5mekner sn-vgqs7nez sn-vgqs7n7k sn-vgqsenes sn-8xgp1vo-xfgd sn-hp57kn7e sn-p5qlsnz6 sn-8xgp1vo-xfgr sn-aigllnze sn-4g57kn7e sn-4g5e6n7d sn-5hne6n7s sn-4g57knd7 )
#var=$(cat filename)
#var_array=(var)

# Compress yt-block text files
#${GZIP} ${path}/*-blocks.txt
${GZIP} -c  $path"/yt1-blocks.txt"  >  ${path}/"yt1-blocks.txt-$(date +%d%m%Y)".gz;
${GZIP} -c  $path"/yt2-blocks.txt"  >  ${path}/"yt2-blocks.txt-$(date +%d%m%Y)".gz;
rm $path"/yt1-blocks.txt"
rm $path"/yt2-blocks.txt"

#save domains to these files
yt1=($path"/yt1-blocks.txt")
#yt1=("/opt/scripts/bash/yt1-blocks.txt")
yt2=($path"/yt2-blocks.txt")
#yt2=("/opt/scripts/bash/yt2-blocks.txt")
touch $yt1
touch $yt2

# For each fingerpint,
#for i in "${fingerprints[@]}"; do
for ((i = 0; i < "${#fingerprints[@]}"; i++)); do
  # Generate the list based on https://discourse.pi-hole.net/t/how-do-i-block-ads-on-youtube/253/11?u=jacob.salmela
  #echo r$((i+1))---${fingerprints[$i]}.googlevideo.com >>$yt1
  echo r{1..20}---${fingerprints[$i]}.googlevideo.com >>$yt1
  #echo r{1..20}---${fingerprints[$i]}.googlevideo.com >yt1-blocks.txt
  #echo r$((i+1)).${fingerprints[$i]}.googlevideo.com >>$yt2
  echo r{1..20}.${fingerprints[$i]}.googlevideo.com >>$yt2
  #echo r{1..20}.${fingerprints[$i]}.googlevideo.com >yt2-blocks.txt
done

# Add new line on each space after every phrase/word!
#echo "/opt/scripts/bash/yt1-blocks.txt /opt/scripts/bash/yt2-blocks.txt"\ | tr " " "\n"
#tr ' ' '\n' < "/opt/scripts/bash/yt1-blocks.txt" > "/opt/scripts/bash/yt1a-blocks.txt"
#tr ' ' '\n' < "/opt/scripts/bash/yt2-blocks.txt" > "/opt/scripts/bash/yt2a-blocks.txt"

#Pre-append at beging of each line 'pihole -b '
#This will blacklist
#sed -i -e 's/^/pihole -b /' $path"/yt1-blocks.txt"
#sed -i -e 's/^/pihole -b /' $path"/yt2-blocks.txt"
#old# sed -i -e 's/^/pihole -b /' "/opt/scripts/bash/yt1-blocks.txt"
#old# sed -i -e 's/^/pihole -b /' "/opt/scripts/bash/yt2-blocks.txt"

#Remove from whitelist
sed -i -e 's/^/pihole -w -d /' $path"/yt1-blocks.txt"
sed -i -e 's/^/pihole -w -d /' $path"/yt2-blocks.txt"

#This will whitelist
#sed -i -e 's/^/pihole -w /' $path"/yt1-blocks.txt"
#sed -i -e 's/^/pihole -w /' $path"/yt2-blocks.txt"

# This will delete domains
#sed -i -e 's/^/pihole -d /' $path"/yt1-blocks.txt"
#sed -i -e 's/^/pihole -d /' $path"/yt2-blocks.txt"

#yt1=("/opt/scripts/bash/yt1-blocks.txt")
#yt2=("/opt/scripts/bash/yt2-blocks.txt")

#Now import these generated domains into Pi-Hole Blacklist database
#sed -n '1 p' | sh $yt1
#sed -n '1 p' | sh $yt2

#Now import into pi-hole db all generated YT ads spam sub-domains
#Uncomend one exec at a time to run
#exec bash $yt1
exec bash $yt2

#restart pi-hole dns &  FTL flush its internal domain-blocking cache
#pihole restartdns
pihole restartdns reload-lists

