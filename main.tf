provider "aws" {
  version = "~> 2.0"
  region  = "us-west-1"
}

module "my_vpc" {
  source = "/home/terraform/module"
  
    vpc_cidr = "10.0.0.0/16"

  tenancy = "default"

  vpc_id = module.aws_vpc.main.vpc_id

  count_private_subnet = 2

  count_public_subnet = 2
}

