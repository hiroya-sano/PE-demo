module "machine_multiaz" {
  source = "../modules/server_machine"

  is_multi_az          = true
  instance_name        = "handson-single"
  instance_subnet_name = "handson-subnet-single"
  instance_type        = "t3.micro"
  instance_vpc_name    = "handson-vpc-single"
  vpc_cidr             = "10.0.0.0/16"
  subnet_cidr_1a       = "10.0.0.0/24"
  subnet_cidr_1c       = "10.0.1.0/24"
}