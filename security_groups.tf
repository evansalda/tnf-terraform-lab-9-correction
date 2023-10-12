resource "aws_security_group" "lb" {
  name   = "nuumfactory-${var.environnement}-lb-sg-${var.digit}"
  vpc_id = data.aws_vpc.vpc.id

  ingress {
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
    Name = "nuumfactory-${var.environnement}-lb-sg-${var.digit}"
  }
}

resource "aws_security_group" "serveur_web" {
  name   = "nuumfactory-${var.environnement}-ec2-sg-${var.digit}"
  vpc_id = data.aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["5.50.34.152/32"] # Remplacer par votre adresse IP publique
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.lb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nuumfactory-${var.environnement}-ec2-sg-${var.digit}"
  }
}

resource "aws_security_group" "db" {
  name   = "nuumfactory-${var.environnement}-db-sg-${var.digit}"
  vpc_id = data.aws_vpc.vpc.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.serveur_web.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nuumfactory-${var.environnement}-db-sg-${var.digit}"
  }
}