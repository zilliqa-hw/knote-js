#!/bin/sh

export AWS_PROFILE='z-engineering-prod-cicd'
export TF_VAR_eks_cluster_name='engineering-prod-eu-central-1'
export TF_VAR_environment='dev'
export TF_DATA_DIR="${TF_DATA_DIR}-${TF_VAR_environment}"
terraform $@
