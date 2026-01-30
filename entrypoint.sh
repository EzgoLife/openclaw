#!/bin/sh
set -e

# Clear config locks
rm -f /home/node/.openclaw/openclaw.json.*.tmp
rm -f /home/node/.clawdbot/moltbot.json.*.tmp

# Inject env vars from Zeabur
apk add --no-cache gettext 2>/dev/null || apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*
envsubst < /app/openclaw.json > /home/node/.openclaw/openclaw.json
cp /home/node/.openclaw/openclaw.json /home/node/.clawdbot/moltbot.json

chown -R node:node /home/node/.openclaw /home/node/.clawdbot

exec "$@"
