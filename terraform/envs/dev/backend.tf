terraform {
  backend "s3" {
    bucket         = "launchpad-dev-tf-state-12345"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "launchpad-dev-terraform-locks"
    encrypt        = true
  }
}
