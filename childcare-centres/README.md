# Childcare centres

If you are using Docker, then simply run

```bash
./feed-index.sh
```

Now write a query to find child care centres within 1km of the Melbourne GPO

- Lat: -37.8138932
- Lon: 144.9611874


NOTE:
Childcare_Centres.csv is from https://data.melbourne.vic.gov.au/Assets-Infrastructure/Childcare-Centres/rdi4-j8zh

## If not using Docker

You will need to have installed Logstash.

If you already have a `childcare-centres` index then you will need to manually delete it.

```
DELETE /childcare-centres
```

Then, use logstash to ingest the data.

Note the use of `--pipeline.workers 1` to work around a concurrency problem with the csv input.
See https://discuss.elastic.co/t/event-dependent-configuration-broken-with-multiple-pipelines/141869

```
XPACK_MONITORING_ENABLED=false \
    INDEX=childcare-centres \
    ELASTICSEARCH_URL='http://localhost:9200' \
    TEMPLATE_PATH="$PWD/mapping-template.json" \
    logstash --pipeline.workers 1 -f ./logstash/logstash.config \
    < Childcare_Centres.csv
```

NOTE: If you are not using a locally running Elasticsearch server (on port 9200),
then you will need to set the `ELASTICSEARCH_URL`.
Make sure you include a port number, even if it is the default port 80 or 443 for `http` and `https`

e.g.

```
ELASTICSEARCH_URL='https://search-elasticsearch-training-abcdef.ap-southeast-2.es.amazonaws.com:443' ./feed-index.sh 
```
