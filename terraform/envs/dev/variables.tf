variable "region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "project" {
  type    = string
  default = "launchpad"
}

variable "enable_eks" {
  description = "Enable EKS cluster (costly, disabled by default)"
  type        = bool
  default     = false
}

variable "enable_alb" {
  description = "Enable ALB (disabled by default)"
  type        = bool
  default     = false
}

# terraform ci test