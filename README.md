# docker-telegraf
Docker image for [Telegraf](https://github.com/influxdata/telegraf) to collect metrics from [Docker](https://www.docker.com) host and report them to [InfluxDB](https://influxdata.com) or [Kafka](http://kafka.apache.org)

## Environment Variables

### General
```
TELEGRAF_CONFIG_PATH:                   Predefined config to use (all other variables will not have any effect)
```

### Agent
```
TELEGRAF_AGENT_INTERVAL:                Default data collection interval                Optional (1m if not defined)
TELEGRAF_AGENT_HOSTNAME:	            Hostname                                        Optional (system hostname if not defined)
```

### Docker
```
TELEGRAF_INPUTS_DOCKER_ENDPOINT:        Docker host API endpoint                        Required
TELEGRAF_INPUTS_DOCKER_TLS_ENABLED:     To collect metrics from a TLS-enabled daemon    Optional
TELEGRAF_INPUTS_DOCKER_TLS_CA:          Path to CA file                                 Optional (required if TLS enabled)
TELEGRAF_INPUTS_DOCKER_TLS_CERT:        Path to cert file                               Optional (required if TLS enabled)
TELEGRAF_INPUTS_DOCKER_TLS_KEY:         Path to cert key file                           Optional (required if TLS enabled)
TELEGRAF_INPUTS_DOCKER_CONTAINERS:      Only collect metrics for these containers       Optional (collect all if not defined)
```

### InfluxDB
```
TELEGRAF_OUTPUTS_INFLUXDB_ENABLED:      Enables InfluxDB output                         Optional
TELEGRAF_OUTPUTS_INFLUXDB_URLS:         Endpoint(s) for InfluxDB instance(s)            Optional (required if InfluxDB output enabled)
TELEGRAF_OUTPUTS_INFLUXDB_DATABASE:     The target database for metrics                 Optional (required if InfluxDB output enabled)
```

### Kafka
```
TELEGRAF_OUTPUTS_KAFKA_ENABLED:         Enables Kafka output                            Optional
TELEGRAF_OUTPUTS_KAFKA_BROKERS:         URLs of Kafka brokers                           Optional (required if InfluxDB output enabled)
TELEGRAF_OUTPUTS_KAFKA_TOPIC:           Kafka topic for messages                        Optional (required if InfluxDB output enabled)
TELEGRAF_OUTPUTS_KAFKA_TAG:             Telegraf tag to use as a routing key            Optional
```
