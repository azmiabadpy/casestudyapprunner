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
  value       = aws_apprunner_service.nginx.service_url
}

output "apprunner_service_arn" {
  description = "App Runner service ARN"
  value       = aws_apprunner_service.nginx.arn
}
