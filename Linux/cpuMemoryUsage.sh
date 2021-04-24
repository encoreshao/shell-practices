#!/bin/sh

#A script to log the cpu and memory usage of linux processes namely - redis, logstash, elasticsearch and kibana

REDIS_PID=$(ps -ef | grep redis | grep -v grep | awk '{print $2}')

LOGSTASH_PID=$(ps -ef | grep logstash | grep -v grep | awk '{print $2}')

ELASTICSEARCH_PID=$(ps -ef | grep elasticsearch | grep -v grep | awk '{print $2}')

KIBANA_PID=$(ps -ef | grep kibana | grep -v grep | awk '{print $2}')

LOG_FILE=/var/log/user/usage.log
echo $LOG_FILE
top | awk -v redis="$REDIS_PID" -v logstash="$LOGSTASH_PID" '/redis|logstash/ {print $1","$9","$10","$12}'
