variable "eks_cluster_name" {
  type = string
}

variable "environment" {
  type = string

  validation {
    condition     = can(regex("(?:^dev)|(?:^prod)|(?:^feature)\\/", var.environment))
    error_message = "The environment name must start with `dev`, `prod` or `feature/`."
  }
}
