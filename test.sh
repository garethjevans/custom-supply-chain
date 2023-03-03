#!/bin/bash

set -euo pipefail

echo "================================================="

echo "Validate"
ytt -f ./config --data-values-file values.yaml | ../supply-chain-validator/build/scv validate -
echo "================================================="

echo "Diff"
ytt -f ./config --data-values-file values.yaml | kubectl diff -f -
echo "================================================="
