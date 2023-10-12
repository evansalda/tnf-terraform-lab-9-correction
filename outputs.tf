output "elb_name" {
  value = local.elb_name
}

output "elb_dns_name" {
  value = aws_lb.serveur_web.dns_name
}

output "elb_sg_name" {
  value = aws_security_group.lb.name
}

output "ec2_name" {
  value = local.ec2_name
}

output "ec2_public_ip" {
  value = aws_instance.serveur_web.public_ip
}

output "ec2_private_ip" {
  value = aws_instance.serveur_web.private_ip
}

output "ec2_sg_name" {
  value = aws_security_group.serveur_web.name
}

output "database_endpoint" {
  value = aws_db_instance.database.endpoint
}

output "database_port" {
  value = aws_db_instance.database.port
}

output "db_sg_name" {
  value = aws_security_group.db.name
}