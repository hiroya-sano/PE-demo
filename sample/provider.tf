variable "profile_name" {
  default = "test"
}
provider "aws" {
  region = "ap-northeast-1"

  profile = var.profile_name
}


variable "github_token" {
  type        = string
  default     = "xxxxx"
  description = "環境変数TF_VAR_github_tokenに設定する"
}
provider "github" {
  owner = "hiroya-sano"
  token = var.github_token
}


terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.28.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}