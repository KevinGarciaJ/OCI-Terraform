###############################################
# CONFIGURACIÓN BÁSICA DE AUTONOMOUS DATABASE
###############################################
variable "oci_adb_compartment_id" {
  description = "Id del compartment donde se crearán todos los recursos"
  type        = string
}

variable "oci_adb_db_name" {
  description = "ORACLE_SID de la base de datos"
  type        = string
  default     = "datumadb"
}

variable "oci_adb_admin_password" {
  description = "Password para la base de datos"
  type        = string
  default     = "manager1"
}

variable "oci_adb_db_workload" {
  description = "Tipo de carga para la base de datos"
  type        = string
  default     = "OLTP"
  validation {
    condition     = contains(["OLTP", "DW", "AJD", "APEX "], var.oci_adb_db_workload)
    error_message = "Debe ser 'OLTP' o 'DW'."
  }
}

variable "oci_adb_freeform_tags" {
  description = "Pares simples de clave-valor para etiquetar los recursos creados utilizando etiquetas de formato libre de OCI."
  type        = map(any)
  default = {
    terraformed = "Por favor no editar manualmente"
    module      = "vcn/oci"
  }
}


###############################################
# CONFIGURACIÓN DE RECURSOS COMPUTACIONALES
###############################################
variable "oci_adb_cpu_model" {
  description = "Tipo de CPU"
  type        = string
  default     = "ECPU"
  validation {
    condition     = contains(["OCPU", "ECPU"], var.oci_adb_cpu_model)
    error_message = "Debe ser 'OCPU' o 'ECPU'."
  }
}

variable "oci_adb_compute_count" {
  description = "Cantidad de ECPUs asignados a la base de datos"
  type        = number
  default     = 2
}

variable "oci_adb_cpu_core_count" {
  description = "Cantidad de OCPUs asignados a la base de datos"
  type        = number
  default     = 2
}

variable "oci_adb_is_auto_scaling_enabled" {
  description = "Autoescalado automático para la base de datos"
  type        = bool
  default     = false
}

###############################################
# CONFIGURACIÓN DE ALMACENAMIENTO
###############################################
variable "oci_adb_data_storage_size_in_gb" {
  description = "Espacio en GB asignado a la base de datos (Solo ECPU)"
  type        = number
  default     = 100
}

variable "oci_adb_data_storage_size_in_tbs" {
  description = "Espacio en TB asignado a la base de datos (Solo OCPU)"
  type        = number
  default     = 100
}

###############################################
# CONFIGURACIÓN DE LICENCIAMIENTO Y NIVEL DE SERVICIO
###############################################
variable "oci_adb_license_model" {
  description = "Tipo de licenciamiento para la base de datos"
  type        = string
  default     = "LICENSE_INCLUDED"
  validation {
    condition     = contains(["BRING_YOUR_OWN_LICENSE", "LICENSE_INCLUDED"], var.oci_adb_license_model)
    error_message = "Debe ser 'BRING_YOUR_OWN_LICENSE' o 'LICENSE_INCLUDED'."
  }
}

variable "oci_adb_is_dev_tier" {
  description = "La base de datos se encuentra en la capa gratuita"
  type        = bool
  default     = true
}