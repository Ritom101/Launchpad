output "cluster_name" {
  description = "EKS cluster name (null if disabled)"
  value       = var.enable_eks ? module.eks[0].cluster_name : null
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "alb_dns_name" {
  description = "ALB DNS name (null if disabled)"
  value       = var.enable_alb ? module.alb[0].alb_dns_name : null
}