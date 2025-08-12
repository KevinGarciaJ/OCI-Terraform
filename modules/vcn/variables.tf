###############################################
# PARÁMETROS GENERALES DE OCI
###############################################
variable "oci_compartment_id" {
  description = "Id del compartment donde se crearán todos los recursos"
  type        = string
}

variable "oci_tenancy_id" {
  type        = string
}

variable "oci_label_prefix" {
  description = "Una cadena que se antepondrá a todos los recursos"
  type        = string
  default     = "none"
}

variable "oci_freeform_tags" {
  description = "Pares de clave-valor para etiquetar los recursos creados utilizando etiquetas de formato libre de OCI."
  type        = map(any)
  default = {
    terraformed = "No editar manualmente"
    module      = "vcn/oci"
  }
}

variable "oci_defined_tags" {
  description = "Etiquetas predefinidas y limitadas a un namespace para etiquetar los recursos creados."
  type        = map(string)
  default     = null
}

###############################################
# PARÁMETROS DE VCN
###############################################
variable "oci_vcn_name" {
  description = "Nombre para usar en la VCN que se anexará al prefijo de etiqueta"
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
  description = "Si se deben eliminar todas las reglas de seguridad predeterminadas de la Lista de Seguridad Predeterminada de la VCN"
  default     = true
  type        = bool
}

###############################################
# PARÁMETROS DE GATEWAYS
###############################################
# Internet Gateway
variable "oci_create_internet_gateway" {
  description = "Si se debe crear el Internet Gateway en la VCN. Si se establece en true, crea un Internet Gateway."
  default     = false
  type        = bool
}

variable "oci_internet_gateway_display_name" {
  description = "(Actualizable) Nombre del Internet Gateway. No tiene que ser único."
  type        = string
  default     = "internet-gateway"

  validation {
    condition     = length(var.oci_internet_gateway_display_name) > 0
    error_message = "El valor internet_gateway_display_name no puede ser una cadena vacía."
  }
}

variable "oci_internet_gateway_route_rules" {
  description = "(Actualizable) Lista de reglas de enrutamiento para añadir a la Route Table del Internet Gateway"
  type        = list(map(string))
  default     = null
}

# NAT Gateway
variable "oci_create_nat_gateway" {
  description = "Si se debe crear un NAT Gateway en la VCN. Si se establece en verdadero, crea un NAT Gateway."
  default     = false
  type        = bool
}

variable "oci_nat_gateway_display_name" {
  description = "(Actualizable) Nombre del NAT Gateway. No tiene que ser único."
  type        = string
  default     = "nat-gateway"

  validation {
    condition     = length(var.oci_nat_gateway_display_name) > 0
    error_message = "El valor nat_gateway_display_name no puede ser una cadena vacía."
  }
}

variable "oci_nat_gateway_public_ip_id" {
  description = "OCID de la dirección IP reservada para el NAT Gateway. La dirección IP pública reservada debe crearse manualmente."
  default     = "none"
  type        = string
}

variable "oci_nat_gateway_route_rules" {
  description = "(Actualizable) lista de reglas de enrutamiento para añadir a la Route Table del NAT Gateway"
  type        = list(map(string))
  default     = null
}

# Service Gateway
variable "oci_create_service_gateway" {
  description = "Si se debe crear un Service Gateway. Si se establece en verdadero, crea un Service Gateway."
  default     = false
  type        = bool
}

variable "oci_service_gateway_display_name" {
  description = "(Actualizable) Nombre del Service Gateway. No tiene que ser único."
  type        = string
  default     = "service-gateway"

  validation {
    condition     = length(var.oci_service_gateway_display_name) > 0
    error_message = "El valor service_gateway_display_name no puede ser una cadena vacía."
  }
}

# Gateway de Peering Local
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