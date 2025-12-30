resource "aws_ecr_repository" "this" {
  name = "${var.project}-${var.environment}"

  image_scanning_configuration {
    scan_on_push = true
  }
}
