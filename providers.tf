terraform {
    required_providers {
        oci = {
        source  = "registry.terraform.io/hashicorp/oci"
        version = ">=4.67.3"
    }
    }
    required_version = "~>1.11.0"
}


# Terraform Cloud
provider "oci" {
  tenancy_ocid     = var.oci_tenancy_id
  user_ocid        = var.oci_user_ocid
  fingerprint      = var.oci_fingerprint
  private_key      = var.oci_private_key
  region           = var.oci_region
}




# Local
# provider "oci" {
#   region           = var.oci_region  # Ajusta a tu región
#   config_file_profile = "DEFAULT"
# }

