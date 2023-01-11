terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "3.39.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }
}
