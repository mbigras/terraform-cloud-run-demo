all: welcome

welcome:		# print welcome message
	@echo "Welcome to terraform-cloud-run-demo!"
	@echo ""
	@echo "This demo deploys a Docker container to GCP Cloud Run."
	@echo "Check out GCP documentation for Cloud Run at:"
	@echo "https://cloud.google.com/run/docs"
	@echo ""
	@echo "This demo comes directly from Seth Vargo's tutorial at:"
	@echo "https://www.sethvargo.com/configuring-cloud-run-with-terraform/"
	@echo ""
	@echo "To print possible make targets, run the following command:"
	@echo "    make help"
	@echo "To install dependencies, run the following command:"
	@echo "    make deps"
	@echo "To initialize terraform, run the following command:"
	@echo "    make init"
	@echo "To create a terraform plan, run the following command:"
	@echo "    make plan"
	@echo "To apply the terraform plan, run the following command:"
	@echo "    make apply"

help:		# print this help
	@echo "TARGET		DESCRIPTION"
	@awk '/^[a-z\.]+:.*#/ { gsub(":", ""); print }' Makefile

deps:		# install dependencies for demo
	brew install terraform
	brew cask install docker google-cloud-sdk

init:		# initialize gcloud and terraform plugins
	gcloud auth application-default login
	# Enable the run.googleapis.com API while initializing with make init
	# instead of using the google_project_service terraform resource
	# to prevent destroying it, when running make destroy
	# See this issue for more details:
	# https://github.com/hashicorp/terraform/issues/2253
	gcloud services enable run.googleapis.com
	gcloud services enable cloudbuild.googleapis.com
	terraform init

plan:		# create terraform plan in current.plan file
	terraform fmt
	terraform plan -out=current.plan
	@echo "You can also use make, run the following command to apply:"
	@echo "    make apply"

apply:		# apply terraform plan in current.plan file
	terraform apply current.plan

show:		# print terraform state and outputs
	terraform show -no-color

output:		# print terraform outputs
	terraform output

list:		# print GCP cloud run services
	gcloud run services list --platform=managed

destroy:		# create terraform plan to destroy resources (apply plan afterwards)
	terraform plan -destroy -out=current.plan
	@echo "You can also use make, run the following command to apply:"
	@echo "    make apply"
