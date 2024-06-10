output "instance_1a_id" {
  description = "instance id in 1a"
  value = aws_instance.instance_1a.id
}

output "instance_1c_id" {
  description = "instance id in 1c"
  value = var.is_multi_az ? aws_instance.instance_1c[0].id : null
}

output "sts_endponit_id" {
  description = "vpcendpoint id for sts"
  value       = aws_vpc_endpoint.sts.id
}

output "lambda_endponit_id" {
  description = "vpcendpoint id for sts"
  value       = aws_vpc_endpoint.lambda.id
}