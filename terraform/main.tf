module "global" {
  source = "./global"
}

terraform {
  backend "s3" {
    region               = "us-east-1"
    bucket               = "ryanemcdaniel-terraform"
    workspace_key_prefix = "shared-infrastructure"
    key                  = "org.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    env  = "root"
    comp = "org"
    git  = "git@github.com:ryanemcdaniel/shared-infrastructure.git"
  }
}


