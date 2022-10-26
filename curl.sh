#!/bin/bash

set -B                  # enable brace expansion
categories=("erkek-t-shirt-x-g2-c73" "erkek-sort-x-g2-c119" "erkek-gomlek-x-g2-c75" "erkek-esofman-x-g2-c1049" "erkek-pantolon-x-g2-c70" "erkek-ceket-x-g2-c1030" "erkek-sweatshirt-x-g2-c1179" "erkek-yelek-x-g2-c1207" "erkek-kazak-x-g2-c1092" "erkek-mont-x-g2-c118")

folders=("tisort" "sort" "gomlek" "esofman" "pantolon" "ceket" "sweat" "yelek" "kazak" "mont")
mkdir -p tisort sort gomlek esofman pantolon ceket sweat yelek kazak mont

j=0
for str in ${categories[@]}; do
  echo $str
  for i in {1..10}; do
    
    curl 'https://public.trendyol.com/discovery-web-searchgw-service/v2/api/infinite-scroll/'$str'?pi='$i'&culture=tr-TR&userGenderId=1&pId=0&scoringAlgorithmId=2&categoryRelevancyEnabled=false&isLegalRequirementConfirmed=false&searchStrategyType=DEFAULT&productStampType=TypeA&fixSlotProductAdsIncluded=true&offset='$i*16 \
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
      --compressed | jq ".result.products[].images[]" | cut -d '"' -f2 | awk '{ printf "https://cdn.dsmcdn.com"; print }' > "$i""_last.txt";
    cat ./*_last.txt > last.txt

  done
  wget -i last.txt
  mv last.txt *.jpg *.jpg* ${folders[$j]}
  rm -rf *.txt
  j=$j+1
done