# pi-hole-yt-blocks.sh
Block YouTube Ads

# pi-hole-yt-blocks.sh for YouTube Ad blocking:
- https://github.com/angelperezleon/pi-hole-yt-blocks.sh
Remix of below discussion:
- https://discourse.pi-hole.net/t/how-do-i-block-ads-on-youtube/253/11?u=jacob.salmela
 
 **Installation**

 Use the main script (**pi-hole-yt-blocks.sh**) to block all or partially block Ads dislayed in YT (youtube)
 Save to any location in your *nix system that has permission to run under a cron job or system account:
 ```cd "/opt/scripts/bash"
 wget https://raw.githubusercontent.com/angelperezleon/pi-hole-yt-blocks.sh/main/pi-hole-yt-blocks.sh
 chmod +x pi-hole-yt-blocks.sh
 nano pi-hole-yt-blocks.sh
 #change path to which ever path you are using:
 path="/my/path/to/script"
```

**Cron job**
 ```bash
#Run pi-hole-yt-blocks.sh every Monday at 00:05
5 0 * * 1 /my/path/to/script/pi-hole-yt-blocks.sh >> /my/path/to/script/yt-blocks_$(date +\%d\%b\%Y-\%H\%M\%S).log 2>&1
```
**Todo**
- [ ] add discovered subdomain into an array filename rather than have the values added into array
- [ ] Make better function to add and 
- [ ] Fix a ways to run to exec or combine all into one file when doing exec bash $yt1 for example.
