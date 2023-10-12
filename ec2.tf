resource "aws_instance" "serveur_web" {
  ami                         = "ami-0f82b13d37cd1e8cc"
  instance_type               = var.ec2_type
  subnet_id                   = data.aws_subnet.public_1.id
  vpc_security_group_ids      = [aws_security_group.serveur_web.id]
  associate_public_ip_address = true
  key_name                    = "nuumfactory-ec2-key-pair"

  tags = {
    Name = local.ec2_name
  }

  user_data = <<EOF
#!/bin/bash
sudo dnf update -y
sudo dnf install -y httpd php php-mysqli mariadb105
sudo systemctl start httpd
sudo systemctl enable httpd
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
EOF
}