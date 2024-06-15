module "machine_multiaz" {
  source = "../modules/server_machine"

  is_multi_az          = true
  instance_name        = "handson-multi"
  instance_subnet_name = "handson-subnet-multi"
  instance_type        = "t3.micro"
  instance_vpc_name    = "handson-vpc-multi"
  vpc_cidr             = "10.0.0.0/16"
  subnet_cidr_1a       = "10.0.0.0/24"
  subnet_cidr_1c       = "10.0.1.0/24"
  endpoint_policy = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = "*"
        Principal = "*"
        Resource = "arn:aws:*"
        Effect = "Allow"
      }
    ]
  }
}