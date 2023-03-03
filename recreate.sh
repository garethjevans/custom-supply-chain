#!/bin/bash

set -euo pipefail

NAME=custom-supply-chain

kubectl delete workload $NAME -n dev --ignore-not-found

sleep 2

tanzu apps workload create $NAME \
  --git-branch main \
  --git-repo https://github.com/garethjevans/$NAME \
  --namespace dev \
  --label app.kubernetes.io/part-of=$NAME \
  --param-yaml testing_pipeline_matching_labels='{"apps.tanzu.vmware.com/pipeline":"supply-chain-pipeline"}' \
  --param-yaml testing_pipeline_params='{}' \
  --type supply-chain \
  --yes

tanzu apps workload tail $NAME --timestamp --since 1h
