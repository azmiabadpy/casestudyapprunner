variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ecr_repository_name" {
  description = "Private ECR repository name"
  type        = string
  default     = "my-nginx"
}

variable "app_runner_service_name" {
  description = "App Runner service name"
  type        = string
  default     = "my-nginx-service"
}

variable "image_tag" {
  description = "Docker image tag stored in ECR"
  type        = string
  default     = "latest"
}

variable "deploy_app_runner" {
  description = "Whether to deploy the App Runner service"
  type        = bool
  default     = false
}
