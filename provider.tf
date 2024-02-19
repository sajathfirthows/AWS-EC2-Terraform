terraform {
  backend "s3" {
    bucket = "dev-saja"
    key    = "dev-saja/terraform.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "us-east-1"
}

