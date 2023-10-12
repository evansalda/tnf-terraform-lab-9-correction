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
sudo yum update -y
sudo amazon-linux-extras install php8.0 mariadb10.5
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
EOF
}