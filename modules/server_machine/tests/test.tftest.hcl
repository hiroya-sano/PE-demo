mock_provider "aws" {}

variables {
    instance_name        = "test-single"
    instance_subnet_name = "test-subnet-single"
    instance_type        = "t3.micro"
    instance_vpc_name    = "test-vpc-single"
    vpc_cidr             = "10.0.0.0/16"
    subnet_cidr_1a       = "10.0.0.0/24"
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

run "create_instances_single" {}

run "create_instances_multi" {
    variables {
        is_multi_az          = true
        subnet_cidr_1c       = "10.0.1.0/24"
    }
}

run "create_instances_error_instance_type" {
    command = plan
    variables {
        instance_type = "t3.large"
    }
    expect_failures = [var.instance_type]
}

run "create_instances_error_endpoint_policy" {
    command = plan
    variables {
        endpoint_policy = {
            Version = "2012-10-17"
            Statement = [
                {
                    Action = "*"
                    Principal = "*"
                    Resource = "*"
                    Effect = "Allow"
                }
            ]
        }
    }
    expect_failures = [ var.endpoint_policy ]
}

// is_multi_azがtrueにもかかわらずis_subnet_cidr_1cが指定されていない場合はエラーになることを確認するため
// このテストケースを実行するとテストプロセスがエラーになる
// 変数を相互参照してvalisationできる機能が1.9で実装されるようなので、それを待った方が良い
// 参考リンク：https://github.com/hashicorp/terraform/issues/25609
// run "create_instances_multi_error" {
//     variables {
//         is_multi_az          = true
//     }
//     expect_failures = [ terraform_data.check_1c_cidr[0] ]
// }
