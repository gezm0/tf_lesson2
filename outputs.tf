output "webserver_instance_id" {
  value = aws_instance.my_webserver.id
  description = "My Webserver Instance ID"
}

output "webserver_public_ip_address" {
  value = aws_instance.my_webserver.public_ip
  description = "My Webserver instance public IP"
}

output "webserver_sg_id" {
  value = aws_security_group.my_webserver_sg.id
  description = "My Webserver Security Group"
}

output "webserver_sg_arn" {
  value = aws_security_group.my_webserver_sg.arn
  description = "My Webserver Security Group ARN"
}

output "db_instance_id" {
  value = aws_db_instance.my_database.id
  description = "My Database Instance ID"
}

output "db_sg_id" {
  value = aws_security_group.my_db_sg.id
  description = "My Webserver Security Group"
}