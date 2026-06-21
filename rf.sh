#!/bin/bash

USER_ID=6072572733

echo "== USER GAMES =="
curl -s "https://games.roblox.com/v2/users/$USER_ID/games?accessFilter=Public&limit=50" | jq

echo "== GROUPS =="
GROUPS=$(curl -s "https://groups.roblox.com/v2/users/$USER_ID/groups/roles")

echo "$GROUPS" | jq

echo "== GROUP GAMES =="
echo "$GROUPS" | jq -r '.data[].group.id' | while read gid
do
  echo "Group ID: $gid"
  curl -s "https://games.roblox.com/v2/groups/$gid/games?accessFilter=Public&limit=50" | jq
done

echo "== UNIVERSE DETAILS =="
curl -s "https://games.roblox.com/v1/games?universeIds=10368392364" | jq
