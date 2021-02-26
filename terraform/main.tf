provider "aws" {
  profile = "bookstore"
  version = "~> 2.21"
  region  = var.region
}

provider "template" {
  version = "~> 2.1"
}

terraform {
  backend "s3" {
    bucket = "bookstore-s3-data"
    region  = "eu-west-2"
    key     = "terraform/terraform.tfstate"
    encrypt = true
  }
}

module "global" {
  source       = "./environments/global"
  project_name = var.project_name
}

module "staging" {
  source = "./environments/staging"

  region                            = var.region
  project_name                      = var.project_name
  default_subnet_ids                = module.global.default_subnet_ids
  default_vpc_id                    = module.global.default_vpc_id
  ecs_instance_iam_role             = module.global.ecs_instance_iam_role
  ecs_instance_iam_instance_profile = module.global.ecs_instance_iam_instance_profile
  ecr_repositories                  = module.staging.ecr_repositories
  db_username                       = var.project_name
  db_password                       = var.production_db_password
}
