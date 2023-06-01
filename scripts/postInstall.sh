set env vars
set -o allexport; source .env; set +o allexport;

echo "waiting...";
sleep 45s;

docker-compose exec -T couchbase bash -c "couchbase-cli cluster-init -c 127.0.0.1 --cluster-username ${COUCHBASE_ADMINISTRATOR_USERNAME} \
 --cluster-password ${ADMIN_PASSWORD} --cluster-name couchbase --services data --cluster-ramsize 4096"

 docker-compose exec -T couchbase bash -c "couchbase-cli setting-alert -c 127.0.0.1 --username ${COUCHBASE_ADMINISTRATOR_USERNAME} \
--password ${ADMIN_PASSWORD} --enable-email-alert 1 \
--email-host ${EMAIL_HOST} --email-port ${EMAIL_PORT} \
--email-recipients ${ADMIN_EMAIL} \
--email-sender ${DEFAULT_FROM_EMAIL} --enable-email-encrypt 0 \
--alert-auto-failover-node --alert-auto-failover-max-reached \
--alert-auto-failover-node-down --alert-auto-failover-cluster-small \
--alert-memory-threshold"
