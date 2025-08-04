

# general oci parameters

variable "oci_compartment_id" {
  description = "compartment id where to create all resources"
  type        = string
  # no default value, asking user to explicitly set this variable's value. see codingconventions.adoc
}


variable "oci_region" {
  # List of regions: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "the OCI region where resources will be created"
  type        = string
  default     = null
}



 variable "oci_tenancy_id"  { type = string }


variable "oci_user_ocid"     { type = string }
variable "oci_private_key"   { type = string }
variable "oci_fingerprint"   { type = string }




variable "oci_label_prefix" {
  description = "a string that will be prepended to all resources"
  type        = string
  default     = "none"
}

variable "oci_freeform_tags" {
  description = "simple key-value pairs to tag the created resources using freeform OCI Free-form tags."
  type        = map(any)
  default = {
    terraformed = "Please do not edit manually"
    module      = "oracle-terraform-modules/vcn/oci"
  }
}

variable "oci_defined_tags" {
  description = "predefined and scoped to a namespace to tag the resources created using defined tags."
  type        = map(string)
  default     = null
}

# vcn parameters
variable "oci_create_internet_gateway" {
  description = "whether to create the internet gateway in the vcn. If set to true, creates an Internet Gateway."
  default     = false
  type        = bool
}

variable "oci_create_nat_gateway" {
  description = "whether to create a nat gateway in the vcn. If set to true, creates a nat gateway."
  default     = false
  type        = bool
}

variable "oci_create_service_gateway" {
  description = "whether to create a service gateway. If set to true, creates a service gateway."
  default     = false
  type        = bool
}

variable "oci_enable_ipv6" {
  description = "Whether IPv6 is enabled for the VCN. If enabled, Oracle will assign the VCN a IPv6 /56 CIDR block."
  type        = bool
  default     = false
}

variable "oci_lockdown_default_seclist" {
  description = "whether to remove all default security rules from the VCN Default Security List"
  default     = true
  type        = bool
}

variable "oci_nat_gateway_public_ip_id" {
  description = "OCID of reserved IP address for NAT gateway. The reserved public IP address needs to be manually created."
  default     = "none"
  type        = string
}

variable "oci_vcn_cidrs" {
  description = "The list of IPv4 CIDR blocks the VCN will use."
  default     = ["10.0.0.0/16"]
  type        = list(string)
}

variable "oci_vcn_dns_label" {
  description = "A DNS label for the VCN, used in conjunction with the VNIC's hostname and subnet's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet. DNS resolution of hostnames in the VCN is disabled when null."
  type        = string
  default     = "vcnmodule"

  validation {
    condition     = var.oci_vcn_dns_label == null ? true : length(regexall("^[^0-9][a-zA-Z0-9_]{1,14}$", var.oci_vcn_dns_label)) > 0
    error_message = "DNS label must be unset to disable, or an alphanumeric string with length of 1 through 15 that begins with a letter."
  }
}

variable "oci_vcn_name" {
  description = "user-friendly name of to use for the vcn to be appended to the label_prefix"
  type        = string
  default     = "vcn"
  validation {
    condition     = length(var.oci_vcn_name) > 0
    error_message = "The vcn_name value cannot be an empty string."
  }
}

# gateways parameters
variable "oci_internet_gateway_display_name" {
  description = "(Updatable) Name of Internet Gateway. Does not have to be unique."
  type        = string
  default     = "internet-gateway"

  validation {
    condition     = length(var.oci_internet_gateway_display_name) > 0
    error_message = "The internet_gateway_display_name value cannot be an empty string."
  }
}

variable "oci_local_peering_gateways" {
  description = "Map of Local Peering Gateways to attach to the VCN."
  type        = map(any)
  default     = null
}

variable "oci_nat_gateway_display_name" {
  description = "(Updatable) Name of NAT Gateway. Does not have to be unique."
  type        = string
  default     = "nat-gateway"

  validation {
    condition     = length(var.oci_nat_gateway_display_name) > 0
    error_message = "The nat_gateway_display_name value cannot be an empty string."
  }
}

variable "oci_service_gateway_display_name" {
  description = "(Updatable) Name of Service Gateway. Does not have to be unique."
  type        = string
  default     = "service-gateway"

  validation {
    condition     = length(var.oci_service_gateway_display_name) > 0
    error_message = "The service_gateway_display_name value cannot be an empty string."
  }
}

variable "oci_internet_gateway_route_rules" {
  description = "(Updatable) List of routing rules to add to Internet Gateway Route Table"
  type        = list(map(string))
  default     = null
}

variable "oci_nat_gateway_route_rules" {
  description = "(Updatable) list of routing rules to add to NAT Gateway Route Table"
  type        = list(map(string))
  default     = null
}


#subnets
variable "oci_subnets" {
  description = "Private or Public subnets in a VCN"
  type        = any
  default     = {}
}





variable "oci_ingress_ports_list_tcp" {
  description = "Lista de puertos de ingress para protocolo TCP"
  type        = list(number)

}

variable "oci_icmp_protocols" {
  description = "Lista de procotolos ICMP"
  type        = list(number)

}





### VARIABLES DBSYSTEM PRODUCCIÓN



variable "oci_ssh_public_key_path" {
  description = "Ruta al archivo de clave pública SSH para acceder a la instancia"
  type        = string
}










## VARIABLES PARA AUTONOMOUS DATABASE PRODUCCIÓN
variable "oci_adb_db_name_prod" {
  description = "ORACLE_SID de la base de datos"
  type        = string
  default = "datumdb"
}

variable "oci_adb_admin_password_prod" {
  description = "Password para la base de datos"
  type        = string
  default = "Manager1##2Datum"
  validation {
    condition = var.oci_adb_admin_password_prod == null ? true : (
      length(var.oci_adb_admin_password_prod) >= 9 && 
      length(regexall("[A-Z]", var.oci_adb_admin_password_prod)) >= 2 && 
      length(regexall("[0-9]", var.oci_adb_admin_password_prod)) >= 2 && 
      length(regexall("[#_-]", var.oci_adb_admin_password_prod)) >= 2
    )
    error_message = "El password debe tener al menos 9 caracteres, 2 letras mayúsculas, 2 números y 2 caracteres especiales."
  }
}

variable "oci_adb_db_workload_prod" {
  description = "Tipo de carga para la base de datos"
  type        = string

  default = "OLTP"
  validation {
    condition = contains(["OLTP", "DW", "AJD", "APEX "], var.oci_adb_db_workload_prod)
    error_message = "Debe ser 'OLTP' o 'DW'."
  }
}

variable "oci_adb_compute_count_prod" {
  description = "Cantidad de ECPUs asignados a la base de datos"
  type        = number
  default = 4 # Para developers debe ser 4 
}
variable "oci_adb_data_storage_size_in_gb_prod" {
  description = "Espacio en GB asignado a la base de datos (Solo ECPU)"
  type        = number
  default = 20 # Para developers debe ser 20 GB
}


variable "oci_adb_is_auto_scaling_enabled_prod" {
  description = "Autoescalado automático para la base de datos"
  type        = bool
  default = false
}

variable "oci_adb_license_model_prod" {
  description = "Tipo de lincenciamiento para la base de datos"
  type        = string

  default = "LICENSE_INCLUDED"
  validation {
    condition = contains(["BRING_YOUR_OWN_LICENSE", "LICENSE_INCLUDED"], var.oci_adb_license_model_prod)
    error_message = "Debe ser 'BRING_YOUR_OWN_LICENSE' o 'LICENSE_INCLUDED'."
  }
}

variable "oci_adb_is_dev_tier_prod" {
  description = "La base de datos se encuentra en la capa gratuita"
  type        = bool
  default = true
}





## VARIABLES PARA DBSYSTEM DE DESARROLLO

variable "oci_dbs_admin_password_prod" {
  description = "Password para la base de datos"
  type        = string
  default = "Manager1##2Datum"
  validation {
    condition = var.oci_dbs_admin_password_prod == null ? true : (
      length(var.oci_dbs_admin_password_prod) >= 9 && 
      length(regexall("[A-Z]", var.oci_dbs_admin_password_prod)) >= 2 && 
      length(regexall("[0-9]", var.oci_dbs_admin_password_prod)) >= 2 && 
      length(regexall("[#_-]", var.oci_dbs_admin_password_prod)) >= 2
    )
    error_message = "El password debe tener al menos 9 caracteres, 2 letras mayúsculas, 2 números y 2 caracteres especiales."
  }
}