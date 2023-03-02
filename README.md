# custom-supply-chain

## Installation

To install this into a cluster use:

```
tanzu apps workload create custom-supply-chain \
  --git-branch main \
  --git-repo https://github.com/garethjevans/custom-supply-chain \
  --namespace dev \
  --label app.kubernetes.io/part-of=custom-supply-chain \
  --param-yaml testing_pipeline_matching_labels='{"apps.tanzu.vmware.com/pipeline":"supply-chain-pipeline"}' \
  --param-yaml testing_pipeline_params='{}' \
  --type supply-chain \
  --yes
```
