# terraform.tf
terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6.0.0"
    }
  }
}

#provider "oci" {
#  config_file_profile = "DEFAULT"
#}
