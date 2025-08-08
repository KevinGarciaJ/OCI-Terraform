###############################################
# PARÁMETROS GENERALES DE OCI
###############################################

variable "oci_compartment_id" {
  description = "ID del compartment donde se crearán todos los recursos"
  type        = string
}

variable "oci_region" {
  # Lista de regiones: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "La región OCI donde se crearán los recursos"
  type        = string
  default     = null
}

variable "oci_tenancy_id" {}

# variable "oci_user_ocid"     { }
# variable "oci_private_key"   { }
# variable "oci_fingerprint"   { }

variable "oci_label_prefix" {
  description = "Una cadena que se antepondrá a todos los recursos"
  type        = string
  default     = "none"
}

variable "oci_freeform_tags_dev" {
  description = "Pares simples de clave-valor para etiquetar los recursos creados utilizando etiquetas de formato libre de OCI."
  type        = map(any)
  default = {
    terraformed = "Por favor no editar manualmente"
    module      = "oracle-terraform-modules/vcn/oci"
  }
}

variable "oci_defined_tags" {
  description = "Etiquetas predefinidas y limitadas a un espacio de nombres para etiquetar los recursos creados."
  type        = map(string)
  default     = null
}



###############################################
# PARÁMETROS DE VCN DESARROLLO
###############################################

variable "oci_vcn_name" {
  description = "nombre amigable para usar en la VCN que se anexará al prefijo de etiqueta"
  type        = string
  default     = "vcn"
  validation {
    condition     = length(var.oci_vcn_name) > 0
    error_message = "El valor vcn_name no puede ser una cadena vacía."
  }
}

variable "oci_vcn_cidrs" {
  description = "La lista de bloques CIDR IPv4 que usará la VCN."
  default     = ["10.0.0.0/16"]
  type        = list(string)
}

variable "oci_vcn_dns_label" {
  description = "Una etiqueta DNS para la VCN, utilizada junto con el nombre de host del VNIC y la etiqueta DNS de la subred para formar un nombre de dominio completo (FQDN) para cada VNIC dentro de esta subred. La resolución DNS de nombres de host en la VCN está deshabilitada cuando es nulo."
  type        = string
  default     = "vcnmodule"

  validation {
    condition     = var.oci_vcn_dns_label == null ? true : length(regexall("^[^0-9][a-zA-Z0-9_]{1,14}$", var.oci_vcn_dns_label)) > 0
    error_message = "La etiqueta DNS debe estar sin establecer para deshabilitarla, o ser una cadena alfanumérica con longitud de 1 a 15 que comience con una letra."
  }
}

variable "oci_enable_ipv6" {
  description = "Si IPv6 está habilitado para la VCN. Si está habilitado, Oracle asignará a la VCN un bloque CIDR IPv6 /56."
  type        = bool
  default     = false
}

variable "oci_lockdown_default_seclist" {
  description = "si se deben eliminar todas las reglas de seguridad predeterminadas de la Lista de Seguridad Predeterminada de la VCN"
  default     = true
  type        = bool
}

###############################################
# PARÁMETROS DE GATEWAYS
###############################################

variable "oci_create_internet_gateway" {
  description = "si se debe crear el gateway de internet en la VCN. Si se establece en verdadero, crea un Gateway de Internet."
  default     = false
  type        = bool
}

variable "oci_internet_gateway_display_name" {
  description = "(Actualizable) Nombre del Gateway de Internet. No tiene que ser único."
  type        = string
  default     = "internet-gateway"

  validation {
    condition     = length(var.oci_internet_gateway_display_name) > 0
    error_message = "El valor internet_gateway_display_name no puede ser una cadena vacía."
  }
}

variable "oci_internet_gateway_route_rules" {
  description = "(Actualizable) Lista de reglas de enrutamiento para añadir a la Tabla de Rutas del Gateway de Internet"
  type        = list(map(string))
  default     = null
}

variable "oci_create_nat_gateway" {
  description = "si se debe crear un gateway NAT en la VCN. Si se establece en verdadero, crea un gateway NAT."
  default     = false
  type        = bool
}

variable "oci_nat_gateway_display_name" {
  description = "(Actualizable) Nombre del Gateway NAT. No tiene que ser único."
  type        = string
  default     = "nat-gateway"

  validation {
    condition     = length(var.oci_nat_gateway_display_name) > 0
    error_message = "El valor nat_gateway_display_name no puede ser una cadena vacía."
  }
}

variable "oci_nat_gateway_public_ip_id" {
  description = "OCID de la dirección IP reservada para el gateway NAT. La dirección IP pública reservada debe crearse manualmente."
  default     = "none"
  type        = string
}

variable "oci_nat_gateway_route_rules" {
  description = "(Actualizable) lista de reglas de enrutamiento para añadir a la Tabla de Rutas del Gateway NAT"
  type        = list(map(string))
  default     = null
}

variable "oci_create_service_gateway" {
  description = "si se debe crear un gateway de servicio. Si se establece en verdadero, crea un gateway de servicio."
  default     = false
  type        = bool
}

variable "oci_service_gateway_display_name" {
  description = "(Actualizable) Nombre del Gateway de Servicio. No tiene que ser único."
  type        = string
  default     = "service-gateway"

  validation {
    condition     = length(var.oci_service_gateway_display_name) > 0
    error_message = "El valor service_gateway_display_name no puede ser una cadena vacía."
  }
}

variable "oci_local_peering_gateways" {
  description = "Mapa de Gateways de Peering Local para adjuntar a la VCN."
  type        = map(any)
  default     = null
}

###############################################
# PARÁMETROS DE RED Y SEGURIDAD
###############################################

variable "oci_subnets" {
  description = "Subredes privadas o públicas en una VCN"
  type        = any
  default     = {}
}

variable "oci_ingress_ports_list_tcp" {
  description = "Lista de puertos de ingress para protocolo TCP"
  type        = list(number)
}

variable "oci_icmp_protocols" {
  description = "Lista de protocolos ICMP"
  type        = list(number)
}

################################################
# PARÁMETROS DE AUTONOMOUS DATABASE DESARROLLO 1
################################################

variable "oci_adb_db_name_dev_1" {
  description = "ORACLE_SID de la base de datos"
  type        = string
  default     = "datumdb"
}

variable "oci_adb_admin_password_dev_1" {
  description = "Contraseña para la base de datos"
  type        = string
  default     = "Manager1##2Datum"
  validation {
    condition = var.oci_adb_admin_password_dev_1 == null ? true : (
      length(var.oci_adb_admin_password_dev_1) >= 9 &&
      length(regexall("[A-Z]", var.oci_adb_admin_password_dev_1)) >= 2 &&
      length(regexall("[0-9]", var.oci_adb_admin_password_dev_1)) >= 2 &&
      length(regexall("[#_-]", var.oci_adb_admin_password_dev_1)) >= 2
    )
    error_message = "La contraseña debe tener al menos 9 caracteres, 2 letras mayúsculas, 2 números y 2 caracteres especiales."
  }
}

variable "oci_adb_db_workload_dev_1" {
  description = "Tipo de carga para la base de datos"
  type        = string
  default     = "OLTP"
  validation {
    condition     = contains(["OLTP", "DW", "AJD", "APEX "], var.oci_adb_db_workload_dev_1)
    error_message = "Debe ser 'OLTP' o 'DW'."
  }
}

variable "oci_adb_compute_count_dev_1" {
  description = "Cantidad de ECPUs asignados a la base de datos"
  type        = number
  default     = 4 # Para developers debe ser 4 
}

variable "oci_adb_data_storage_size_in_gb_dev_1" {
  description = "Espacio en GB asignado a la base de datos (Solo ECPU)"
  type        = number
  default     = 20 # Para developers debe ser 20 GB
}

variable "oci_adb_is_auto_scaling_enabled_dev_1" {
  description = "Autoescalado automático para la base de datos"
  type        = bool
  default     = false
}

variable "oci_adb_license_model_dev_1" {
  description = "Tipo de licenciamiento para la base de datos"
  type        = string
  default     = "LICENSE_INCLUDED"
  validation {
    condition     = contains(["BRING_YOUR_OWN_LICENSE", "LICENSE_INCLUDED"], var.oci_adb_license_model_dev_1)
    error_message = "Debe ser 'BRING_YOUR_OWN_LICENSE' o 'LICENSE_INCLUDED'."
  }
}

variable "oci_adb_is_dev_tier_dev_1" {
  description = "La base de datos se encuentra en la capa gratuita"
  type        = bool
  default     = true
}

###############################################
# PARÁMETROS DE DBSYSTEM DESARROLLO
###############################################

variable "oci_dbs_dbname_dev_1" {
  description = "ORACLE_SID de la base de datos"
  type        = string
  default     = "datumdb1"
}

variable "oci_dbs_admin_password_dev_1" {
  description = "Contraseña para la base de datos"
  type        = string
  default     = "Manager1##2Datum"
  validation {
    condition = var.oci_dbs_admin_password_dev_1 == null ? true : (
      length(var.oci_dbs_admin_password_dev_1) >= 9 &&
      length(regexall("[A-Z]", var.oci_dbs_admin_password_dev_1)) >= 2 &&
      length(regexall("[0-9]", var.oci_dbs_admin_password_dev_1)) >= 2 &&
      length(regexall("[#_-]", var.oci_dbs_admin_password_dev_1)) >= 2
    )
    error_message = "La contraseña debe tener al menos 9 caracteres, 2 letras mayúsculas, 2 números y 2 caracteres especiales."
  }
}

variable "oci_ssh_public_key_path" {
  description = "Ruta al archivo de clave pública SSH para acceder a la instancia"
  type        = string
}






################################################
# PARÁMETROS DE AUTONOMOUS DATABASE DESARROLLO 2 
################################################

variable "oci_adb_db_name_dev_2" {
  description = "ORACLE_SID de la base de datos"
  type        = string
  default     = "conferencia"
}

variable "oci_adb_admin_password_dev_2" {
  description = "Contraseña para la base de datos"
  type        = string
  default     = "Manager1##2Conferencia"
  validation {
    condition = var.oci_adb_admin_password_dev_2 == null ? true : (
      length(var.oci_adb_admin_password_dev_2) >= 9 &&
      length(regexall("[A-Z]", var.oci_adb_admin_password_dev_2)) >= 2 &&
      length(regexall("[0-9]", var.oci_adb_admin_password_dev_2)) >= 2 &&
      length(regexall("[#_-]", var.oci_adb_admin_password_dev_2)) >= 2
    )
    error_message = "La contraseña debe tener al menos 9 caracteres, 2 letras mayúsculas, 2 números y 2 caracteres especiales."
  }
}

variable "oci_adb_db_workload_dev_2" {
  description = "Tipo de carga para la base de datos"
  type        = string
  default     = "OLTP"
  validation {
    condition     = contains(["OLTP", "DW", "AJD", "APEX "], var.oci_adb_db_workload_dev_2)
    error_message = "Debe ser 'OLTP' o 'DW'."
  }
}

variable "oci_adb_compute_count_dev_2" {
  description = "Cantidad de ECPUs asignados a la base de datos"
  type        = number
  default     = 4 # Para developers debe ser 4 
}

variable "oci_adb_data_storage_size_in_gb_dev_2" {
  description = "Espacio en GB asignado a la base de datos (Solo ECPU)"
  type        = number
  default     = 20 # Para developers debe ser 20 GB
}

variable "oci_adb_is_auto_scaling_enabled_dev_2" {
  description = "Autoescalado automático para la base de datos"
  type        = bool
  default     = false
}

variable "oci_adb_license_model_dev_2" {
  description = "Tipo de licenciamiento para la base de datos"
  type        = string
  default     = "LICENSE_INCLUDED"
  validation {
    condition     = contains(["BRING_YOUR_OWN_LICENSE", "LICENSE_INCLUDED"], var.oci_adb_license_model_dev_2)
    error_message = "Debe ser 'BRING_YOUR_OWN_LICENSE' o 'LICENSE_INCLUDED'."
  }
}

variable "oci_adb_is_dev_tier_dev_2" {
  description = "La base de datos se encuentra en la capa gratuita"
  type        = bool
  default     = true
}