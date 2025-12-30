resource "aws_lb" "this" {
  name               = "${var.project}-${var.environment}-alb"
  load_balancer_type = "application"
  subnets            = var.subnets
  security_groups    = []

  tags = {
    Environment = var.environment
  }
}
