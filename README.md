# pi-hole-yt-blocks.sh
Block YouTube Ads

# pi-hole-yt-blocks.sh for YouTube Ad blocking:
- https://github.com/angelperezleon/pi-hole-yt-blocks.sh
# Remix of below discussion:
- https://discourse.pi-hole.net/t/how-do-i-block-ads-on-youtube/253/11?u=jacob.salmela
 
 **Installation**

 Use the main script (**pi-hole-yt-blocks.sh**) to block all or partially block Ads dislayed in YT (youtube)
 Save to any location in your *nix system that has permission to run under a cron job or system account:
 ```cd "/opt/scripts/bash"
 #wgProxyList stopforumspam ban list
 require_once "$IP/bannedips.php";
```
You can also add the script to any other CMS that can be edited to called upon the bannedips.php banlist file.

**Cron job**
 ```bash
#Pull StopForumSpam IP Black List every Saturday at 8:56pm
56 20 * * 6 /opt/bannedips/bannedips.sh >> /opt/bannedips/bannedips_$(date +\%d\%b\%Y-\%H\%M\%S).log 2>&1
```
**Todo**
- [ ] create this todo list
- [ ] Test on other platforms a build a compatible list.
