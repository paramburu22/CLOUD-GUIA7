terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws",
      version = ">= 2.13.0"
    }

  }

  required_version = ">= 1.5.0"
}