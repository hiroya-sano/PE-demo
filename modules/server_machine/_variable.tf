variable "instance_vpc_name" {
  type        = string
  description = "vpc name for instance"
  nullable    = false
}

variable "instance_subnet_name" {
  type        = string
  description = "subnet name for instance"
  nullable    = false
}

variable "instance_name" {
  type        = string
  description = "ec2 instance name"
  nullable    = false
}

variable "instance_type" {
  type        = string
  description = "ec2 instance type"
  default     = "t3.micro"

  validation {
    condition     = (
      var.instance_type == "t3.medium" ||
      var.instance_type == "t3.micro"
    )
    error_message = "The instance_type can be \"t3.medium\" or \"t3.micro\""
  }
}

variable "vpc_cidr" {
  type        = string
  description = "vpc's cidr block"
}

variable "is_multi_az" {
  type        = bool
  default     = false
  description = "マルチAZ冗長化構成とするかどうかのフラグ"
}

variable "subnet_cidr_1a" {
  type        = string
  description = "1a subnet's cidr block"
}

variable "subnet_cidr_1c" {
  type        = string
  default     = null
  description = "1c subnet's cidr block"
}

variable "endpoint_policy" {
  type = object({
    Version = string
    Statement = list(object({
      Action = string
      Principal = string
      Resource = string
      Effect = string
    }))
  })
  description = "VPCエンドポイントのポリシー"

  validation {
    condition = (
      var.endpoint_policy != null &&
      alltrue([for st in var.endpoint_policy.Statement : st.Resource != "*" ])
    )
    error_message = "The endpoint_policy must always be set to a value"
  }
}