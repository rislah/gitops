#!/bin/sh

export NODE_IP=$(kubectl get nodes -o jsonpath='{range .items[*]}{.status.addresses[?(@.type=="InternalIP")].address}{"\n"}{end}')
export KAFKA_EXTERNAL_PORT=$(kubectl -n kafka get service dev-kafka-external-bootstrap -o jsonpath='{.spec.ports[*].nodePort}')
export KAFKA_EXTERNAL_ADDRESS="${NODE_IP}:${KAFKA_EXTERNAL_PORT}"

echo "NODE_IP: ${NODE_IP}
KAFKA_EXTERNAL_PORT: ${KAFKA_EXTERNAL_PORT} 
KAFKA_EXTERNAL_ADDRESS: ${KAFKA_EXTERNAL_ADDRESS}"
