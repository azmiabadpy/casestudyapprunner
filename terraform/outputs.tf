output "ecr_repository_url" {
  description = "Private ECR repository URL"
  value       = aws_ecr_repository.nginx.repository_url
}

output "ecr_repository_arn" {
  description = "Private ECR repository ARN"
  value       = aws_ecr_repository.nginx.arn
}

output "apprunner_service_url" {
  description = "App Runner service URL"
  value       = var.deploy_app_runner ? aws_apprunner_service.nginx[0].service_url : null
}

output "apprunner_service_arn" {
  description = "App Runner service ARN"
  value       = var.deploy_app_runner ? aws_apprunner_service.nginx[0].arn : null
}
