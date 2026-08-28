resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id = aws_vpc.main.id

  service_name = "com.amazonaws.${var.aws_region}.ecr.api"

  vpc_endpoint_type = "Interface"

  subnet_ids = [
    aws_subnet.private.id
  ]

  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "nginx-ecr-api-endpoint"
  }
}


resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id = aws_vpc.main.id

  service_name = "com.amazonaws.${var.aws_region}.ecr.dkr"

  vpc_endpoint_type = "Interface"

  subnet_ids = [
    aws_subnet.private.id
  ]

  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "nginx-ecr-dkr-endpoint"
  }
}


resource "aws_vpc_endpoint" "s3" {
  vpc_id = aws_vpc.main.id

  service_name = "com.amazonaws.${var.aws_region}.s3"

  vpc_endpoint_type = "Gateway"

  route_table_ids = [
    aws_route_table.private.id
  ]

  tags = {
    Name = "nginx-s3-endpoint"
  }
}



resource "aws_vpc_endpoint" "ssm" {
  vpc_id = aws_vpc.main.id

  service_name = "com.amazonaws.${var.aws_region}.ssm"

  vpc_endpoint_type = "Interface"

  subnet_ids = [
    aws_subnet.private.id
  ]

  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "nginx-ssm-endpoint"
  }
}



resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id = aws_vpc.main.id

  service_name = "com.amazonaws.${var.aws_region}.ssmmessages"

  vpc_endpoint_type = "Interface"

  subnet_ids = [
    aws_subnet.private.id
  ]

  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "nginx-ssmmessages-endpoint"
  }
}


resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id = aws_vpc.main.id

  service_name = "com.amazonaws.${var.aws_region}.ec2messages"

  vpc_endpoint_type = "Interface"

  subnet_ids = [
    aws_subnet.private.id
  ]

  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]

  private_dns_enabled = true

  tags = {
    Name = "nginx-ec2messages-endpoint"
  }
}
