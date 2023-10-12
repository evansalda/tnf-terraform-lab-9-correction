locals {
  elb_name          = "nuumfactory-${var.environnement}-lb-${var.digit}"
  elb_tg_name       = "nuumfactory-${var.environnement}-tg-${var.digit}"
  ec2_name          = "nuumfactory-${var.environnement}-ec2-${var.digit}"
  db_name           = "nuumfactory-${var.environnement}-db-${var.digit}"
  db_name_lowercase = "nuumfactory-${var.environnement}-db-xx"
}