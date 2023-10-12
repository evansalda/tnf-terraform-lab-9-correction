terraform {
  backend "s3" {
    bucket  = "nuumfactory-terraform-backend"
    key     = "terraform-XX-dev.tfstate"
    region  = "eu-west-3"
    profile = "nuumfactory-student"
  }
}