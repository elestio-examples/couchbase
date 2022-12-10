

target=$(docker-compose port couchbase 8091)





curl http://${target}/settings/web?just_validate=1 \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'invalid-auth-response: on' \
  -H 'ns-server-ui: yes' \
  -H 'pragma: no-cache' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36' \
  --data-raw 'username='${COUCHBASE_ADMINISTRATOR_USERNAME}'&password='${COUCHBASE_ADMINISTRATOR_PASSWORD}'&port=SAME' \
  --compressed









  curl http://${target}/clusterInit \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'invalid-auth-response: on' \
  -H 'ns-server-ui: yes' \
  -H 'pragma: no-cache' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36' \
  --data-raw 'hostname=127.0.0.1&services=kv%2Cn1ql%2Cindex%2Cfts%2Ccbas%2Ceventing%2Cbackup&sendStats=true&clusterName=couchbase&setDefaultMemQuotas=true&indexerStorageMode=plasma&username='${COUCHBASE_ADMINISTRATOR_USERNAME}'&password='${COUCHBASE_ADMINISTRATOR_PASSWORD}'&port=SAME' \
  --compressed