variable "oci_dbs_ssh_public_key_path" {
  description = "Ruta al archivo de clave pública SSH para acceder a la instancia"
  type        = string
}

variable "oci_dbs_compartment_id" {
  description = "compartment id where to create all resources"
  type        = string
}

variable "oci_dbs_availability_domain_name" {
  description = "compartment id where to create all resources"
  type        = string
}

variable "oci_dbs_subnet_id" {
  description = "compartment id where to create all resources"
  type        = string
}

variable "oci_dbs_database_admin_password" {
  description = "compartment id where to create all resources"
  type        = string
}


variable "oci_dbs_database_edition" {
  description = "Tipo de edición para la base de datos"
  type        = string

  default = "ENTERPRISE_EDITION"
  validation {
    condition = contains(["STANDARD_EDITION", "ENTERPRISE_EDITION"], var.oci_dbs_database_edition)
    error_message = "Debe ser 'STANDARD_EDITION' o 'ENTERPRISE_EDITION'."
  }
}

variable "oci_dbs_license_model" {
  description = "Tipo de lincenciamiento para la base de datos"
  type        = string

  default = "LICENSE_INCLUDED"
  validation {
    condition = contains(["BRING_YOUR_OWN_LICENSE", "LICENSE_INCLUDED"], var.oci_dbs_license_model)
    error_message = "Debe ser 'BRING_YOUR_OWN_LICENSE' o 'LICENSE_INCLUDED'."
  }
}

variable "oci_dbs_db_name" {
  description = "ORACLE_SID de la base de datos"
  type        = string
  default = "datumdb"
}


variable "oci_dbs_character_set" {
  description = "Character set de la base de datos"
  type        = string
  default = "AL32UTF8"
}

variable "oci_dbs_ncharacter_set" {
  description = "National character set de la base de datos"
  type        = string
  default = "AL16UTF16"
}



variable "oci_dbs_db_workload" {
  description = "Tipo de carga para la base de datos"
  type        = string

  default = "OLTP"
  validation {
    condition = contains(["OLTP", "DW", "AJD", "APEX "], var.oci_dbs_db_workload)
    error_message = "Debe ser 'OLTP' o 'DW'."
  }
}


variable "oci_dbs_db_version" {
  description = "Versión de la base de datos"
  type        = string
  default = "21.18.0.0"
}


variable "oci_dbs_db_display_name" {
  description = "Display name de la base de datos"
  type        = string
  default = "MyDBHome"
}


variable "oci_dbs_hostname" {
  description = "Display name"
  type        = string
  default = "mydbhost"
}


variable "oci_dbs_shape" {
  description = "Shape"
  type        = string
  default = "VM.Standard2.2"
}


variable "oci_dbs_storage_management" {
  description = "Tipo de almacenamiento"
  type        = string

  default = "LVM"
  validation {
    condition = contains(["LVM", "ASM"], var.oci_dbs_storage_management)
    error_message = "Debe ser 'LVM' o 'ASM'."
  }
}



variable "oci_dbs_display_name" {
  description = "Display name en OCI consola gráfica"
  type        = string
  default = "MyDBSystem"
}



variable "oci_dbs_cpu_core_count" {
  description = "Cantidad de CPUs asignados a la base de datos"
  type        = number
  default = 1
}

variable "oci_dbs_data_storage_size_in_gb" {
  description = "Espacio en GB asignado a la base de datos"
  type        = number
  default = 256
}