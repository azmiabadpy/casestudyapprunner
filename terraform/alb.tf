
resource "aws_security_group" "alb" {
  name        = "nginx-alb-sg"
  description = "Security group for Nginx ALB"
  vpc_id      = aws_vpc.main.id

  
  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-alb-sg"
  }

resource "aws_vpc_security_group_ingress_rule" "ec2_from_alb" {
  security_group_id            = aws_security_group.nginx_ec2.id
  referenced_security_group_id = aws_security_group.alb.id

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
}


resource "aws_lb" "nginx" {
  name               = "nginx-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb.id
  ]

  subnets = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  tags = {
    Name = "nginx-alb"
  }

resource "aws_lb_target_group" "nginx" {
  name     = "nginx-target-group"
  port     = 80
  protocol = "HTTP"

  vpc_id = aws_vpc.main.id

  target_type = "instance"

  health_check {
    enabled  = true
    protocol = "HTTP"
    path     = "/"
    port     = "80"
  }

  tags = {
    Name = "nginx-target-group"
  }
}


 
resource "aws_lb_target_group_attachment" "nginx" {
  target_group_arn = aws_lb_target_group.nginx.arn

  target_id = aws_instance.nginx.id

  port = 80
}
resource "aws_lb_listener" "nginx" {
  load_balancer_arn = aws_lb.nginx.arn

  port     = 80
  protocol = "HTTP"

  default_action {
    type             = "forward"

    target_group_arn = aws_lb_target_group.nginx.arn
  }
}
output "nginx_alb_url" {
  description = "URL to access Nginx through the ALB"

  value = "http://${aws_lb.nginx.dns_name}"
}
