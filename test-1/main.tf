# Configure the AWS Provider
provider "aws" {
  profile                  = "acloudguru"
  shared_credentials_files = ["C:/Users/JinTan/.aws/credentials"]
  region = "${var.region}"
}

module "vpc_set"{
  source = "../modules/vpc"
}

module "subnets"{
  source = "../modules/subnets"
  vpc1_id = module.vpc_set.vpc1_id
  vpc2_id = module.vpc_set.vpc2_id
}

module "route_tables"{
  source = "../modules/route_tables"
  vpc1_id = module.vpc_set.vpc1_id
  vpc2_id = module.vpc_set.vpc2_id
  vpc1_cidr_block = module.vpc_set.vpc1_cidr_block
  vpc2_cidr_block = module.vpc_set.vpc2_cidr_block
  vpc1_vpc2_peering_connection_id = module.vpc_set.vpc1_vpc2_peering_connection_id
  igw_id = module.vpc_set.igw_id
  vpc1_PrivateSubnet1_id = module.subnets.vpc1_PrivateSubnet1_id
  vpc2_PrivateSubnet1_id = module.subnets.vpc2_PrivateSubnet1_id
  vpc2_PublicSubnet1_id = module.subnets.vpc2_PublicSubnet1_id
}