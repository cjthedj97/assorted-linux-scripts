#!/bin/bash

YOUR_API_KEY=

read -p "Enter ip address: " IP_ADDRESS

curl -sS -G https://api.abuseipdb.com/api/v2/check --data-urlencode "ipAddress=$IP_ADDRESS" -d maxAgeInDays=90 -d verbose \
  -H "Key: $YOUR_API_KEY" -H "Accept: application/json" | jq . | sed '/reports/,$d' | tr -d '"'   
