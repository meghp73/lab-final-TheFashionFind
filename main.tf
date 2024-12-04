provider "aws" {
  region = "us-west-1"
}

module "networking" {
  source = "./.terraform/modules/networking"
}

module "compute" {
  source = "./.terraform/modules/compute"
  vpc_id = module.networking.vpc_id
  subnets = module.networking.public_subnet_ids
}

module "storage" {
  source = "./.terraform/modules/storage"
  db_instance_type = "db.t3.micro"
  subnet_ids = module.networking.public_subnet_ids
}

module "monitoring" {
  source  = "./.terraform/modules/monitoring"
  vpc_id  = module.networking.vpc_id
}

module "event_driven" {
  source = "./.terraform/modules/event_driven"
}
