#!/bin/bash

set -B                  # enable brace expansion
for i in {1..10}; do
  
  curl 'https://public.trendyol.com/discovery-web-searchgw-service/v2/api/infinite-scroll/erkek-ceket-x-g2-c1030?pi='$i'&culture=tr-TR&userGenderId=1&pId=0&scoringAlgorithmId=2&categoryRelevancyEnabled=false&isLegalRequirementConfirmed=false&searchStrategyType=DEFAULT&productStampType=TypeA&fixSlotProductAdsIncluded=true&offset='$i*16 \
    -H 'authority: public.trendyol.com' \
    -H 'accept: application/json, text/plain, */*' \
    -H 'accept-language: tr-TR,tr;q=0.9,en-US;q=0.8,en;q=0.7' \
    -H 'authorization: Bearer' \
    -H 'cache-control: no-cache' \
    -H 'origin: https://www.trendyol.com' \
    -H 'pragma: no-cache' \
    -H 'sec-fetch-dest: empty' \
    -H 'sec-fetch-mode: cors' \
    -H 'sec-fetch-site: same-site' \
    -H 'user-agent: Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1' \
    --compressed >> $i".txt";
done