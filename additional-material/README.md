Try out logstash:

The following will place some documents into an index called `simple-log`:

```bash
LOGSTASH_CONFIG_DIR="${PWD}/simple-logstash" ../scripts/logstash <<HERE
line 1
line 2
last line
HERE
```

The following will index your Mac syslogs into logstash indices:

```bash
LOGSTASH_CONFIG_DIR="${PWD}/macos-syslog-logstash" ../scripts/logstash
```
