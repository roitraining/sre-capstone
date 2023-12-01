# SRE Capstone Terraform 

## To run:

Open Google Cloud Shell and clone this repository.

Open terraform.tfvars file and change project_id variable to your project ID

## Then run: 
terraform init

terraform plan

terraform apply -auto-approve

## The following will be created:
GKE Cluster
Kubernetes namespace
Helm release to install a MariaDB Database
Kubernetes job to initialize the Database Schema
Kubernetes deployment for a microservice called internal
Kubernetes deployment for a microservice called external 
Kubernetes load balancer for external
Kubernetes ClusterIP for internal

The public IP of the load balancer will be in the outputt when done

## To delete everything run:
terraform destroy -auto-approve

