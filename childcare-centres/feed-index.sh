#!/bin/bash

set -euv -o pipefail

INDEX=${INDEX:-childcare-centres}

SRC_DIR="$PWD/$(dirname $0)"
MOUNT_DIR="/usr/share/logstash/childcare-centres"

ELASTICSEARCH_URL=${ELASTICSEARCH_URL:-http://localhost:9200}

echo "Delete the index if it already exists"
curl -XDELETE "$ELASTICSEARCH_URL/$INDEX?pretty=true" ||:

# Need to set pipeline.workers to work around bugs in the CSV filter :-(
# See https://discuss.elastic.co/t/event-dependent-configuration-broken-with-multiple-pipelines/141869
PIPELINE_WORKERS=1

docker run \
    -v "$SRC_DIR":"$MOUNT_DIR" \
    -e XPACK_MONITORING_ENABLED=false \
    -e ELASTICSEARCH_URL="$ELASTICSEARCH_URL" \
    -e INDEX="$INDEX" \
    -e TEMPLATE_PATH="$MOUNT_DIR/mapping-template.json" \
    --rm -i \
    --network="container:elasticsearch-hands-on-2" \
    docker.elastic.co/logstash/logstash:7.17.5 \
        --pipeline.workers $PIPELINE_WORKERS \
        --path.config "$MOUNT_DIR/logstash" \
    < "$SRC_DIR/Childcare_Centres.csv"
