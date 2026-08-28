resource "aws_apprunner_service" "nginx" {
  count = var.deploy_app_runner ? 1 : 0

  service_name = var.app_runner_service_name

  source_configuration {
    auto_deployments_enabled = false

    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner_ecr_access.arn
    }

    image_repository {
      image_repository_type = "ECR"

      image_identifier = "${aws_ecr_repository.nginx.repository_url}:${var.image_tag}"

      image_configuration {
        port = "80"
      }
    }
  }

  instance_configuration {
    cpu    = "1 vCPU"
    memory = "2 GB"
  }
}
