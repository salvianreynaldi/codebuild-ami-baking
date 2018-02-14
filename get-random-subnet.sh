#!/bin/bash
set -e
IFS=',' read -ra AWS_SUBNET_IDS <<< "${AWS_SUBNET_IDS_STRING}"
APP_TEMPLATE_INSTANCE_SUBNET_ID=${AWS_SUBNET_IDS[$(($(date +%s) % ${#AWS_SUBNET_IDS[@]}))]}
echo ${APP_TEMPLATE_INSTANCE_SUBNET_ID}
