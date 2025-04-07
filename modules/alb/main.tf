resource "aws_lb" "iac-project-alb" {
  name                       = var.alb_name
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.iac-project-alb-security-group.id]
  subnets                    = [var.public_subnet_id, var.public_subnet_id_2]
  enable_deletion_protection = false
}

resource "aws_lb_target_group" "iac-project-alb-target-group" {
  name     = var.alb_target_group_name
  port     = var.alb_target_group_port // 8080
  protocol = var.alb_target_group_protocol
  vpc_id   = var.vpc_id

  health_check {
    path                = var.alb_target_group_health_check_path
    interval            = var.alb_target_group_health_check_interval
    timeout             = var.alb_target_group_health_check_timeout
    healthy_threshold   = var.alb_target_group_health_check_healthy_threshold
    unhealthy_threshold = var.alb_target_group_health_check_unhealthy_threshold
    matcher             = var.alb_target_group_health_check_matcher
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.iac-project-alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.iac-project-alb-target-group.arn
  }
}

resource "aws_security_group" "iac-project-alb-security-group" {
  name        = "iac-project-alb-security-group"
  description = "Security group for the ALB"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = var.ec2_cidr_blocks
  }
}

