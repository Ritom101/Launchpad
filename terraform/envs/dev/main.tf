module "vpc" {
  source = "D:/Launchpad/terraform/modules/vpc"

  project     = var.project
  environment = var.environment
  cidr_block  = "10.0.0.0/16"
}

#module "eks" {
 # source = "D:/Launchpad/terraform/modules/eks"

 # project     = var.project
 # environment = var.environment

 # vpc_id         = module.vpc.vpc_id
 # private_subnets = module.vpc.private_subnets
#}

module "ecr" {
  source = "D:/Launchpad/terraform/modules/ecr"

  project     = var.project
  environment = var.environment
}

module "iam" {
  source = "D:/Launchpad/terraform/modules/iam"

  project     = var.project
  environment = var.environment
  #eks_oidc_arn = module.eks.oidc_provider_arn
  #eks_oidc_arn = null
}

#module "alb" {
 # source = "D:/Launchpad/terraform/modules/alb"

 # project     = var.project
 # environment = var.environment

 # vpc_id  = module.vpc.vpc_id
 # subnets = module.vpc.public_subnets
#}

module "eks" {
  count  = var.enable_eks ? 1 : 0
  source = "D:/Launchpad/terraform/modules/eks"

  project          = var.project
  environment      = var.environment
  vpc_id           = module.vpc.vpc_id
  private_subnets  = module.vpc.private_subnets
}


module "alb" {
  count  = var.enable_alb ? 1 : 0
  source = "D:/Launchpad/terraform/modules/alb"

  project     = var.project
  environment = var.environment
  vpc_id      = module.vpc.vpc_id
  subnets     = module.vpc.public_subnets
}
