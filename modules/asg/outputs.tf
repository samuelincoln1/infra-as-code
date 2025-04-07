
output "autoscaling_group_name" {
  value = aws_autoscaling_group.web-server-autoscaling-group.name
}

output "rds-security-group-id" {
  value = aws_security_group.rds-security-group.id
}
