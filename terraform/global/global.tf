terraform {
  required_version = "1.9.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

output "env" { value = terraform.workspace }
output "aws_acc_id" { value = data.aws_caller_identity.current.account_id }
output "aws_region" { value = data.aws_region.current.name }