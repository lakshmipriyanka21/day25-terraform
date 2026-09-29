terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Primary AWS Provider - Singapore
provider "aws" {
  region = "ap-southeast-1"
}

# Secondary AWS Provider - Mumbai
provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}