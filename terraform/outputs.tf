output "ecr_repository_url" {
  description = "Private ECR repository URL"
  value       = aws_ecr_repository.nginx.repository_url
}

output "ecr_repository_arn" {
  description = "Private ECR repository ARN"
  value       = aws_ecr_repository.nginx.arn
}

output "vpc_id" {
  description = "NGINX VPC ID"
  value       = aws_vpc.main.id
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = aws_subnet.private.id
}

output "private_route_table_id" {
  description = "Private route table ID"
  value       = aws_route_table.private.id
}

output "ec2_instance_id" {
  description = "Private EC2 instance ID"
  value       = aws_instance.nginx.id
}

output "ec2_private_ip" {
  description = "Private EC2 private IP address"
  value       = aws_instance.nginx.private_ip
}

output "ec2_iam_role" {
  description = "IAM role attached to the EC2"
  value       = aws_iam_role.ec2_ecr.name
}

output "ecr_api_endpoint_id" {
  description = "ECR API VPC endpoint ID"
  value       = aws_vpc_endpoint.ecr_api.id
}

output "ecr_dkr_endpoint_id" {
  description = "ECR Docker VPC endpoint ID"
  value       = aws_vpc_endpoint.ecr_dkr.id
}

output "s3_endpoint_id" {
  description = "S3 Gateway VPC endpoint ID"
  value       = aws_vpc_endpoint.s3.id
}

output "ssm_endpoint_id" {
  description = "SSM VPC endpoint ID"
  value       = aws_vpc_endpoint.ssm.id
}

output "ssmmessages_endpoint_id" {
  description = "SSM Messages VPC endpoint ID"
  value       = aws_vpc_endpoint.ssmmessages.id
}

output "ec2messages_endpoint_id" {
  description = "EC2 Messages VPC endpoint ID"
  value       = aws_vpc_endpoint.ec2messages.id
}
