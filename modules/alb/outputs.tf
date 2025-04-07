output "security_group_id" {
  value = aws_security_group.iac-project-alb-security-group.id
}

output "target_group_arn" {
  value = aws_lb_target_group.iac-project-alb-target-group.arn
}
