resource "aws_iam_role" "apprunner_ecr_access" {
  name = "${var.app_runner_service_name}-ecr-access"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "build.apprunner.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "app-runner-ecr-access-role"
  }
}


resource "aws_iam_role_policy_attachment" "apprunner_ecr_access" {
  role = aws_iam_role.apprunner_ecr_access.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}
