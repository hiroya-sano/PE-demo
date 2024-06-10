<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.instance_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.instance_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.main_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.main_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.main_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.main_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_endpoint.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.sts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [terraform_data.check_1c_cidr](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | ec2 instance name | `string` | n/a | yes |
| <a name="input_instance_subnet_name"></a> [instance\_subnet\_name](#input\_instance\_subnet\_name) | subnet name for instance | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | ec2 instance type | `string` | `"t3.micro"` | no |
| <a name="input_instance_vpc_name"></a> [instance\_vpc\_name](#input\_instance\_vpc\_name) | vpc name for instance | `string` | n/a | yes |
| <a name="input_is_multi_az"></a> [is\_multi\_az](#input\_is\_multi\_az) | マルチAZ冗長化構成とするかどうかのフラグ | `bool` | `false` | no |
| <a name="input_subnet_cidr_1a"></a> [subnet\_cidr\_1a](#input\_subnet\_cidr\_1a) | 1a subnet's cidr block | `string` | n/a | yes |
| <a name="input_subnet_cidr_1c"></a> [subnet\_cidr\_1c](#input\_subnet\_cidr\_1c) | 1c subnet's cidr block | `string` | `null` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | vpc's cidr block | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_1a_id"></a> [instance\_1a\_id](#output\_instance\_1a\_id) | instance id in 1a |
| <a name="output_instance_1c_id"></a> [instance\_1c\_id](#output\_instance\_1c\_id) | instance id in 1c |
| <a name="output_lambda_endponit_id"></a> [lambda\_endponit\_id](#output\_lambda\_endponit\_id) | vpcendpoint id for sts |
| <a name="output_sts_endponit_id"></a> [sts\_endponit\_id](#output\_sts\_endponit\_id) | vpcendpoint id for sts |
<!-- END_TF_DOCS -->