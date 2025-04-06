#!/usr/bin/env bash

echo "= UPDATING PACKAGES"
yay -Syyu

echo ""
echo "= CLEAR PACMAN CACHE"
pacman_cache_space="$(du -sh /var/cache/pacman/pkg/)"

echo "- Clearing cache, leaving 2 newest versions"
paccache -vrk2

echo "- Clearing uninstalled packages"
paccache -ruk0

pacman_cache_space_after="$(du -sh /var/cache/pacman/pkg/)"
echo "Before: $pacman_cache_space | After: $pacman_cache_space_after"

echo ""
echo "= REMOVE ORPHANED PACKAGES"
orphaned=$(yay -Qdtq)
if [ -n "$orphaned" ]; then
    echo "$orphaned" | yay -Rns -
else
    echo "No orphaned packages"
fi

echo ""
echo "= CLEARING HOME CACHE"
home_cache_space="$(du -sh ~/.cache)"
rm -rf ~/.cache/
echo "Cleared: $home_cache_space"

echo ""
echo "= CLEARING SYS LOGS"
sudo journalctl --vacuum-time=7d

echo ""
echo "System maintenance completed"
