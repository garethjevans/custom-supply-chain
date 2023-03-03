#!/bin/bash

set -euo pipefail

NAME=custom-workload
tanzu apps workload create $NAME \
  --namespace dev \
  --git-branch main \
  --git-repo https://github.com/carto-run/app-maven-kpack \
  --label apps.tanzu.vmware.com/has-tests=true \
  --label app.kubernetes.io/part-of=$NAME \
  --type custom \
  --yes
