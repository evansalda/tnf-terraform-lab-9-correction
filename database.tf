resource "aws_db_instance" "database" {
  identifier             = local.db_name_lowercase # Le paramètre identifier n'acceptant pas les majuscules, j'ai du créer une seconde variable locale. Vous n'avez pas à faire cela.
  allocated_storage      = 10
  db_name                = "nuumfactorydb${var.digit}"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_subnet_group_name   = "nuumfactory-db-subnet-group"
  vpc_security_group_ids = [aws_security_group.db.id]
  username               = "dbadmin"
  password               = "dbadminpassword"
  skip_final_snapshot    = true
}