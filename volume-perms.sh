#!/bin/bash

#This script fixes the file permissions volume data + configs to match what's inside the container.

GRAFANA_ID=`docker run --rm --entrypoint "/usr/bin/id" grafana/grafana "-u"`
GRAFANA_DATA_VOLUME=./data/grafana
echo "Grafana UID is: $GRAFANA_ID"
sudo chown -R $GRAFANA_ID:$GRAFANA_ID $GRAFANA_DATA_VOLUME

PROM_ID=`docker run --rm --entrypoint "/bin/id" prom/prometheus:latest "-u"`
PROM_DATA_VOLUME=./data/prometheus
echo "Prometheus UID is: $PROM_ID"
sudo chown -R $PROM_ID:$PROM_ID $PROM_DATA_VOLUME
