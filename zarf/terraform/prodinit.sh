CI_ENVIRONMENT_SLUG="prod"
TF_DATA_DIR="${TF_DATA_DIR}-${CI_ENVIRONMENT_SLUG}"
terraform init -backend-config="key=${CI_ENVIRONMENT_SLUG}/knote-js"
