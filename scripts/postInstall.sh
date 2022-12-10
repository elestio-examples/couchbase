set env vars
set -o allexport; source .env; set +o allexport;

echo "waiting...";
sleep 20s;

target=$(docker-compose port couchbase 8091)


# Creating user
curl http://${target}/settings/web?just_validate=1 \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'invalid-auth-response: on' \
  -H 'ns-server-ui: yes' \
  -H 'pragma: no-cache' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36' \
  --data-raw 'username='${COUCHBASE_ADMINISTRATOR_USERNAME}'&password='${ADMIN_PASSWORD}'&port=SAME' \
  --compressed

# Creating new instance
  curl http://${target}/clusterInit \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'invalid-auth-response: on' \
  -H 'ns-server-ui: yes' \
  -H 'pragma: no-cache' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36' \
  --data-raw 'hostname=127.0.0.1&services=kv%2Cn1ql%2Cindex%2Cfts%2Ccbas%2Ceventing%2Cbackup&sendStats=true&clusterName=couchbase&setDefaultMemQuotas=true&indexerStorageMode=plasma&username='${COUCHBASE_ADMINISTRATOR_USERNAME}'&password='${ADMIN_PASSWORD}'&port=SAME' \
  --compressed

# Configuring SMTP Server

curl http://${target}/settings/alerts \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'invalid-auth-response: on' \
  -H 'ns-server-ui: yes' \
  -H 'pragma: no-cache' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36' \
  --data-raw 'alerts=auto_failover_node%2Cauto_failover_maximum_reached%2Cauto_failover_other_nodes_down%2Cauto_failover_cluster_too_small%2Cauto_failover_disabled%2Cip%2Cdisk%2Coverhead%2Cep_oom_errors%2Cep_item_commit_failed%2Caudit_dropped_events%2Cindexer_ram_max_usage%2Cep_clock_cas_drift_threshold_exceeded%2Ccommunication_issue%2Ctime_out_of_sync%2Cdisk_usage_analyzer_stuck%2Cmemory_threshold&pop_up_alerts=auto_failover_node%2Cauto_failover_maximum_reached%2Cauto_failover_other_nodes_down%2Cauto_failover_cluster_too_small%2Cauto_failover_disabled%2Cip%2Cdisk%2Coverhead%2Cep_oom_errors%2Cep_item_commit_failed%2Caudit_dropped_events%2Cindexer_ram_max_usage%2Cep_clock_cas_drift_threshold_exceeded%2Ccommunication_issue%2Ctime_out_of_sync%2Cdisk_usage_analyzer_stuck%2Cmemory_threshold&enabled=true&emailEncrypt=false&emailHost='${EMAIL_HOST}'&emailPort='${EMAIL_PORT}'&emailUser='${EMAIL_HOST_USER}'&emailPass='${EMAIL_HOST_PASSWORD}'&recipients=root@localhost.com&sender='${DEFAULT_FROM_EMAIL}'' \
  --compressed