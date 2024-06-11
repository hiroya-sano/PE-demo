variable "profile_name" {
  default = "test"
}
provider "aws" {
  region = "ap-northeast-1"

  profile = var.profile_name
}
