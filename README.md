# K8S

Scripts and infrastructure code to provision and create a Kubernetes cluster.

## Dependencies

* cfssl & cfssljson
* kubectl
* terraform

## Instructions

1. Create the `remote_state` and adjust bucket and dynamodb name to your own.
2. Apply the `cluster` terraform so it provisions the compute infrastructure for the cluster.
3. Generate a Root CA with `scripts/generate-ca.sh`

## License

This project is under the MIT license
