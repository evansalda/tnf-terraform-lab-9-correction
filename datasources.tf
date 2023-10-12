data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["nuumfactory-vpc"]
  }
}

data "aws_subnet" "public_1" {
  filter {
    name   = "tag:Name"
    values = ["nuumfactory-public-subnet-1"]
  }
}

data "aws_subnet" "public_2" {
  filter {
    name   = "tag:Name"
    values = ["nuumfactory-public-subnet-2"]
  }
}