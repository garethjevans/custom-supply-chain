#!/bin/bash

#set -euo pipefail

./test.sh

echo "Apply"
ytt -f ./config --data-values-file values.yaml | kubectl apply -f -
echo "================================================="
