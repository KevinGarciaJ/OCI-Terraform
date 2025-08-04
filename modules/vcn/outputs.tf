# VCN Outputs
output "oci_vcn_id" {
  description = "OCID de la VCN"
  value       = module.oci_vcn.vcn_id
}

output "oci_vcn_cidr" {
  description = "CIDR de la VCN"
  value       = module.oci_vcn.vcn_all_attributes.cidr_blocks
}

# Internet Gateway Output
output "oci_internet_gateway_id" {
  description = "OCID del Internet Gateway"
  value       = module.oci_vcn.internet_gateway_id
}

# NAT Gateway Output
output "oci_nat_gateway_id" {
  description = "OCID del NAT Gateway"
  value       = module.oci_vcn.nat_gateway_id
}

# Service Gateway Output
output "oci_service_gateway_id" {
  description = "OCID del Service Gateway"
  value       = module.oci_vcn.service_gateway_id
}

# Route Table Outputs
output "oci_ig_route_id" {
  description = "OCID de la tabla de rutas del Internet Gateway"
  value       = module.oci_vcn.ig_route_id
}

output "oci_nat_route_id" {
  description = "OCID de la tabla de rutas del NAT Gateway"
  value       = module.oci_vcn.nat_route_id
}

# Security List Output
output "oci_security_list_id" {
  description = "OCID de la lista de seguridad de la instancia"
  value       = oci_core_security_list.oci_instance_security_list.id
}




# Outputs para las subnets creadas manualmente
output "oci_subnet_public_1_id" {
  description = "ID de la subnet pública 1"
  value       = oci_core_subnet.oci_subnet_public_1.id
}

output "oci_subnet_private_1_id" {
  description = "ID de la subnet privada 1"
  value       = oci_core_subnet.oci_subnet_private_1.id
}



# Output para el diagnóstico
output "vcn_module_outputs" {
  description = "Todos los outputs disponibles del módulo VCN"
  value       = module.oci_vcn
}

output "availables_domains" {
  description = "Todos los dominios disponibles"
  value       = data.oci_identity_availability_domains.ads.availability_domains
}

output "availability_domain_names" {
  description = "Nombres de los Availability Domains disponibles"
  value       = [for ad in data.oci_identity_availability_domains.ads.availability_domains : ad.name]
}

# Si desea acceder a un AD específico (por ejemplo, el primero)
output "first_availability_domain" {
  description = "Primer Availability Domain en la región"
  value       = data.oci_identity_availability_domains.ads.availability_domains[0]
}

output "first_availability_domain_name" {
  description = "Nombre del primer Availability Domain en la región"
  value       = data.oci_identity_availability_domains.ads.availability_domains[0].name
}


