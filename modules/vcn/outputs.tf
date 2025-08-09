###############################################
# OUTPUTS DE VCN
###############################################
output "oci_vcn_id" {
  description = "OCID de la VCN"
  value       = module.oci_vcn.vcn_id
}

output "oci_vcn_cidr" {
  description = "CIDR de la VCN"
  value       = module.oci_vcn.vcn_all_attributes.cidr_blocks
}

###############################################
# OUTPUTS DE GATEWAYS
###############################################
# Internet Gateway
output "oci_internet_gateway_id" {
  description = "OCID del Internet Gateway"
  value       = module.oci_vcn.internet_gateway_id
}

# NAT Gateway
output "oci_nat_gateway_id" {
  description = "OCID del NAT Gateway"
  value       = module.oci_vcn.nat_gateway_id
}

# Service Gateway
output "oci_service_gateway_id" {
  description = "OCID del Service Gateway"
  value       = module.oci_vcn.service_gateway_id
}

###############################################
# OUTPUTS DE TABLAS DE RUTAS
###############################################
output "oci_ig_route_id" {
  description = "OCID de la tabla de rutas del Internet Gateway"
  value       = module.oci_vcn.ig_route_id
}

output "oci_nat_route_id" {
  description = "OCID de la tabla de rutas del NAT Gateway"
  value       = module.oci_vcn.nat_route_id
}

###############################################
# OUTPUTS DE LISTAS DE SEGURIDAD
###############################################
output "oci_security_list_id" {
  description = "OCID de la lista de seguridad de la instancia"
  value       = oci_core_security_list.oci_instance_security_list.id
}

###############################################
# OUTPUTS DE SUBNETS
###############################################
output "oci_subnet_public_1_id" {
  description = "ID de la subnet pública 1"
  value       = oci_core_subnet.oci_subnet_public_1.id
}

output "oci_subnet_private_1_id" {
  description = "ID de la subnet privada 1"
  value       = oci_core_subnet.oci_subnet_private_1.id
}

###############################################
# OUTPUTS DE DOMINIOS DE DISPONIBILIDAD
###############################################
output "availables_domains" {
  description = "Todos los dominios disponibles"
  value       = data.oci_identity_availability_domains.ads.availability_domains
}

output "availability_domain_names" {
  description = "Nombres de los Availability Domains disponibles"
  value       = [for ad in data.oci_identity_availability_domains.ads.availability_domains : ad.name]
}

output "first_availability_domain" {
  description = "Primer Availability Domain en la región"
  value       = data.oci_identity_availability_domains.ads.availability_domains[0]
}

output "first_availability_domain_name" {
  description = "Nombre del primer Availability Domain en la región"
  value       = data.oci_identity_availability_domains.ads.availability_domains[0].name
}
