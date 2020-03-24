# Terraform Cloud Run Demo

Welcome to a Terraform Cloud Run Demo!

This demo deploys a Docker container to GCP Cloud Run.

Check out GCP documentation for Cloud Run at:
https://cloud.google.com/run/docs

This demo comes directly from Seth Vargo's tutorial at:
https://www.sethvargo.com/configuring-cloud-run-with-terraform/

## Help

Get help using the `make help` command:

```
$ make help
TARGET		DESCRIPTION
welcome		# print welcome message
help		# print this help
deps		# install dependencies for demo
init		# initialize gcloud and terraform plugins
plan		# create terraform plan in current.plan file
apply		# apply terraform plan in current.plan file
show		# print terraform state and outputs
output		# print terraform outputs
list		# print GCP cloud run services
destroy		# create terraform plan to destroy resources (apply plan afterwards)
```

## Demo

The demo is driven using make targets:

```
git clone https://github.com/mbigras/terraform-cloud-run-demo
cd terraform-cloud-run-demo
make deps
make init
make plan
make apply
make output
make list
make destroy
make apply
```
