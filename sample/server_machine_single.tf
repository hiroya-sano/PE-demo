variable "profile_name" {
  default = "test"
}
provider "aws" {
  region = "ap-northeast-1"

  profile = var.profile_name
}

module "machine" {
  source = "../modules/server_machine"

  instance_name        = "handson-single"
  instance_subnet_name = "handson-subnet-single"
  instance_type        = "t3.micro"
  instance_vpc_name    = "handson-vpc-single"
  vpc_cidr             = "10.0.0.0/16"
  subnet_cidr_1a       = "10.0.0.0/24"
}