#!/bin/bash

USER_ID=6072572733

echo "==================== USER INFO ===================="
curl -s "https://users.roblox.com/v1/users/$USER_ID" | jq

echo "==================== USER GAMES ===================="
curl -s "https://games.roblox.com/v2/users/$USER_ID/games?accessFilter=Public&limit=50" | jq

echo "==================== GROUPS ===================="
GROUPS=$(curl -s "https://groups.roblox.com/v2/users/$USER_ID/groups/roles")
echo "$GROUPS" | jq

echo "==================== GROUP GAMES ===================="
echo "$GROUPS" | jq -r '.data[].group.id' | while read gid
do
  echo "--- GROUP $gid ---"
  curl -s "https://games.roblox.com/v2/groups/$gid/games?accessFilter=Public&limit=50" | jq
done

echo "==================== BADGES ===================="
curl -s "https://badges.roblox.com/v1/users/$USER_ID/badges?limit=100" | jq

echo "==================== FRIENDS ===================="
curl -s "https://friends.roblox.com/v1/users/$USER_ID/friends" | jq

echo "==================== FOLLOWERS ===================="
curl -s "https://friends.roblox.com/v1/users/$USER_ID/followers" | jq

echo "==================== FOLLOWINGS ===================="
curl -s "https://friends.roblox.com/v1/users/$USER_ID/followings" | jq

echo "==================== AVATAR ===================="
curl -s "https://avatar.roblox.com/v1/users/$USER_ID/avatar" | jq

echo "==================== INVENTORY (LIMITED SAMPLE) ===================="
curl -s "https://inventory.roblox.com/v2/users/$USER_ID/inventory?limit=50" | jq

echo "==================== DONE ===================="
