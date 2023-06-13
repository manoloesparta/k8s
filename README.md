# K8S

Scripts and infrastructure to provision and create a Kubernetes cluster.

## Organization

* `app`: Application for demoing Kubernetes cluster
* `terraform`: Terraform code for the cluster infrastructure
* `ansible`: Playbooks for setting up the cluster in certain scenarios

## Instructions

To create the infrastucture please apply the `remote_state` module before any other root module. Adjust bucket and dynamodb table name to your own.

## License

This project is under the MIT license
