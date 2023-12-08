provider "aws" {
    region = "ap-northeast-2"
  }

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.19.0"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.12.1"
    }
  }
}
