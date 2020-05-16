output "instance_public_ip" {
  value = aws_instance.a2_app.public_ip
}

output "lb_endpoint" {
  value = aws_lb.a2_app.dns_name
}

output "db_name" {
  value = aws_db_instance.default.name
}
output "db_port" {
  value = aws_db_instance.default.port
}
output "db_endpoint" {
  value = aws_db_instance.default.endpoint
}
output "db_address" {
  value = aws_db_instance.default.address
}
output "db_user" {
  value = aws_db_instance.default.username
}

output "db_pass" {
  value = aws_db_instance.default.password
}

