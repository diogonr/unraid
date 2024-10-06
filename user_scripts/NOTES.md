### Send notification
```sh
/usr/local/emhttp/webGui/scripts/notify  -i "alert" -s "Bootup" -d "Unraid is fully booted up"
```

### Send webhook
```sh
WEBHOOK_URL="https://discord.com/api/webhooks/xxxxxxxxxxxxx/-xxxxxxxxxxx"

curl -X POST -H "Content-Type: application/json" -d '{"message": "message"}' "$WEBHOOK_URL"
```
