resource "aws_instance" "instance_1a" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.main_1a.id

  tags = {
    Name      = "${var.instance_name}-1a"
    Createdby = "Terraform"
  }

  lifecycle {
    ignore_changes = [ instance_type ]
  }
}

resource "aws_instance" "instance_1c" {
  count = var.is_multi_az ? 1 : 0

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.main_1c[0].id

  tags = {
    Name      = "${var.instance_name}-1c"
    Createdby = "Terraform"
  }
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name      = var.instance_vpc_name
    Createdby = "Terraform"
  }
}

resource "aws_subnet" "main_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_1a
  availability_zone = "ap-northeast-1a"

  tags = {
    Name      = "subnet-handson-1a"
    Createdby = "Terraform"
  }
}

resource "aws_subnet" "main_1c" {
  count = var.is_multi_az ? 1 : 0

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_1c
  availability_zone = "ap-northeast-1c"

  tags = {
    Name      = "subnet-handson-1c"
    Createdby = "Terraform"
  }
}

resource "terraform_data" "check_1c_cidr" {
  count = var.is_multi_az && var.subnet_cidr_1c == null ? 1 : 0

  provisioner "local-exec" {
    command = "echo 'Error: subnet_cidr_1c must be specified when is_multi_az is true' && exit 1"
  }
}

resource "aws_security_group" "main" {
  name   = "${var.instance_name}-alb"
  vpc_id = aws_vpc.main.id

  tags = {
    Name      = "sg-handson"
    Createdby = "Terraform"
  }
}

resource "aws_security_group_rule" "main_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.main.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "main_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.main.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_vpc_endpoint" "sts" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.ap-northeast-1.sts"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.main.id]
  subnet_ids          = var.is_multi_az ? [aws_subnet.main_1a.id, aws_subnet.main_1c[0].id] : [aws_subnet.main_1a.id]
  private_dns_enabled = false
  policy = jsonencode(var.endpoint_policy)

  tags = {
    Name      = "public_bastion_sts"
    Createdby = "Terraform"
  }
}

resource "aws_vpc_endpoint" "lambda" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.ap-northeast-1.lambda"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.main.id]
  subnet_ids          = var.is_multi_az ? [aws_subnet.main_1a.id, aws_subnet.main_1c[0].id] : [aws_subnet.main_1a.id]
  private_dns_enabled = false
  policy = jsonencode(var.endpoint_policy)

  tags = {
    Name      = "public_bastion_lambda"
    Createdby = "Terraform"
  }
}
