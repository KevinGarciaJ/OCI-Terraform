# # Lista de seguridad personalizada para las instancias
# resource "oci_core_security_list" "oci_instance_security_list" {
#   compartment_id = var.oci_compartment_id
#   vcn_id         = module.oci_vcn.vcn_id
#   display_name   = "agarcia-instance-security-list"



# # Listado de puertos TCP
#   dynamic "ingress_security_rules" {
#     for_each = var.oci_ingress_ports_list_tcp
#     content {
#       protocol    = "6" # TCP
#       source      = "0.0.0.0/0"
#       stateless   = false
#       tcp_options {
#       min = ingress_security_rules.value
#       max = ingress_security_rules.value
#     }
#     }
#   }



# # Reglas ICMP
#   dynamic "ingress_security_rules" {
#     for_each = var.oci_icmp_protocols
#     content {
#     protocol    = "1" # ICMP
#     source      = "0.0.0.0/0"
#     stateless   = false
#     icmp_options {
#       type = ingress_security_rules.value
#     }
#     }
    
#   }


#   # Regla para permitir tráfico dentro de la VCN
#   ingress_security_rules {
#     protocol    = "all"
#     source      = var.oci_vcn_cidrs[0]
#     stateless   = false
#     description = "Permitir todo el tráfico dentro de la VCN"
#   }

#   # Regla para permitir todo el tráfico saliente
#   egress_security_rules {
#     protocol    = "all"
#     destination = "0.0.0.0/0"
#     stateless   = false
#     description = "Permitir todo el tráfico saliente"
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# # Este módulo ya no creará subnets, solo la VCN básica
# module "oci_vcn" {
#   source = "github.com/oracle-terraform-modules/terraform-oci-vcn"
  
#   # general oci parameters
#   compartment_id = var.oci_compartment_id
#   tenancy_id     = var.oci_tenancy_id
#   label_prefix   = var.oci_label_prefix

#   # vcn parameters
#   create_internet_gateway  = var.oci_create_internet_gateway
#   lockdown_default_seclist = var.oci_lockdown_default_seclist
#   create_nat_gateway       = var.oci_create_nat_gateway
#   create_service_gateway   = var.oci_create_service_gateway
#   enable_ipv6              = var.oci_enable_ipv6
#   vcn_cidrs                = var.oci_vcn_cidrs
#   vcn_dns_label            = var.oci_vcn_dns_label
#   vcn_name                 = var.oci_vcn_name
#   # No definimos subnets aquí para crearlas manualmente
#   subnets                  = {}
  
#   # gateways parameters
#   internet_gateway_display_name = var.oci_internet_gateway_display_name
#   nat_gateway_display_name      = var.oci_nat_gateway_display_name
#   service_gateway_display_name  = var.oci_service_gateway_display_name

#   # routing rules
#   internet_gateway_route_rules = var.oci_internet_gateway_route_rules
#   nat_gateway_route_rules      = var.oci_nat_gateway_route_rules
# }

# # Creamos manualmente las subnets con nuestras listas de seguridad
# # Subnet pública 1
# resource "oci_core_subnet" "oci_subnet_public_1" {
#   compartment_id = var.oci_compartment_id
#   vcn_id         = module.oci_vcn.vcn_id
#   cidr_block     = var.oci_subnets["sub1"].cidr_block
#   display_name   = var.oci_subnets["sub1"].name
  
#   # IMPORTANTE: Usar nuestra lista de seguridad personalizada
#   security_list_ids = [oci_core_security_list.oci_instance_security_list.id]
  
#   # Otras configuraciones
#   route_table_id      = module.oci_vcn.ig_route_id  # Tabla de rutas del Internet Gateway
#   dns_label           = var.oci_subnets["sub1"].dns_label
#   prohibit_public_ip_on_vnic = false  # Es una subnet pública
  
#   # Dependencias
#   depends_on = [module.oci_vcn]
# }



# # Recuperar los dominios de disponibilidad
# data "oci_identity_availability_domains" "ads" {
#   compartment_id = var.oci_compartment_id
# }







# # Crear una tabla de rutas personalizada para la subnet privada
# resource "oci_core_route_table" "private_route_table_vpn" {
#   #count = var.oci_create_nat_gateway ? 1 : 0
#   compartment_id = var.oci_compartment_id
#   vcn_id         = module.oci_vcn.vcn_id
#   display_name   = "agarcia-private-vpn-route-table"

#   # Mantener la ruta original hacia el NAT Gateway para tráfico general a Internet
#   route_rules {
#     destination       = "0.0.0.0/0"
#     destination_type  = "CIDR_BLOCK"
#     network_entity_id = module.oci_vcn.nat_gateway_id
#     description       = "Tráfico a Internet vía NAT Gateway"
#   }
  
 
#   depends_on = [ module.oci_vcn]
# }

# # Asociar la tabla de rutas personalizada a la subnet privada
# # Subnet privada con la nueva route table
# resource "oci_core_subnet" "oci_subnet_private_1" {
#   # Mantener todos los parámetros originales
#   compartment_id = var.oci_compartment_id
#   vcn_id         = module.oci_vcn.vcn_id
#   cidr_block     = var.oci_subnets["sub2"].cidr_block
#   display_name   = var.oci_subnets["sub2"].name
#   security_list_ids = [oci_core_security_list.oci_instance_security_list.id]
#   dns_label      = var.oci_subnets["sub2"].dns_label
#   prohibit_public_ip_on_vnic = true
  
#   # Cambiar la tabla de rutas a nuestra nueva tabla personalizada
#   route_table_id = oci_core_route_table.private_route_table_vpn.id
  
#   # Dependencias
#   depends_on = [module.oci_vcn, oci_core_route_table.private_route_table_vpn]
# }





# output "nat_gateway_id" {
#   description = "ID del NAT Gateway"
#   value       = module.oci_vcn.nat_gateway_id
# }


