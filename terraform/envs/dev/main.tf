module "vpc" {
  source = "../../modules/vpc"

  project     = var.project
  environment = var.environment
  cidr_block  = "10.0.0.0/16"
}

module "ecr" {
  source = "../../modules/ecr"

  project     = var.project
  environment = var.environment
}

module "iam" {
  source = "../../modules/iam"

  project     = var.project
  environment = var.environment
  # eks_oidc_arn = module.eks[0].oidc_provider_arn
}

module "eks" {
  count  = var.enable_eks ? 1 : 0
  source = "../../modules/eks"

  project         = var.project
  environment     = var.environment
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "alb" {
  count  = var.enable_alb ? 1 : 0
  source = "../../modules/alb"

  project = var.project
  environment = var.environment
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
}