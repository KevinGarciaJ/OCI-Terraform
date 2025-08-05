#################################################
# MÓDULO DE RED - VCN DESARROLLO
#################################################
module "vcn_dev" {
  source = "./modules/vcn"
  
  # General OCI parameters
  oci_compartment_id = var.oci_compartment_id
  oci_tenancy_id     = var.oci_tenancy_id
  oci_label_prefix   = var.oci_label_prefix
  oci_freeform_tags  = var.oci_freeform_tags
  oci_defined_tags   = var.oci_defined_tags
  
  # VCN parameters
  oci_vcn_name                 = var.oci_vcn_name
  oci_vcn_cidrs                = var.oci_vcn_cidrs
  oci_vcn_dns_label            = var.oci_vcn_dns_label
  oci_enable_ipv6              = var.oci_enable_ipv6
  oci_lockdown_default_seclist = var.oci_lockdown_default_seclist
  
  # Gateway parameters
  oci_create_internet_gateway       = var.oci_create_internet_gateway
  oci_internet_gateway_display_name = var.oci_internet_gateway_display_name
  oci_internet_gateway_route_rules  = var.oci_internet_gateway_route_rules
  
  oci_create_nat_gateway            = var.oci_create_nat_gateway
  oci_nat_gateway_display_name      = var.oci_nat_gateway_display_name
  oci_nat_gateway_public_ip_id      = var.oci_nat_gateway_public_ip_id
  oci_nat_gateway_route_rules       = var.oci_nat_gateway_route_rules
  
  oci_create_service_gateway        = var.oci_create_service_gateway
  oci_service_gateway_display_name  = var.oci_service_gateway_display_name
  
  oci_local_peering_gateways        = var.oci_local_peering_gateways
  
  # Subnet parameters
  oci_subnets                = var.oci_subnets
  
  # Security parameters
  oci_ingress_ports_list_tcp = var.oci_ingress_ports_list_tcp
  oci_icmp_protocols         = var.oci_icmp_protocols
}

#################################################
# MÓDULO DE AUTONOMOUS DATABASE - DESARROLLO
#################################################
module "adb_dev" {
  source = "./modules/adb"
  
  # Database configuration
  oci_adb_compartment_id          = var.oci_compartment_id
  oci_adb_db_name                 = var.oci_adb_db_name_prod
  oci_adb_admin_password          = var.oci_adb_admin_password_prod
  oci_adb_db_workload             = var.oci_adb_db_workload_prod
  
  # Resource allocation
  oci_adb_compute_count           = var.oci_adb_compute_count_prod
  oci_adb_data_storage_size_in_gb = var.oci_adb_data_storage_size_in_gb_prod
  oci_adb_is_auto_scaling_enabled = var.oci_adb_is_auto_scaling_enabled_prod
  
  # Licensing and tier
  oci_adb_license_model           = var.oci_adb_license_model_prod
  oci_adb_is_dev_tier             = var.oci_adb_is_dev_tier_prod
  
  depends_on = [module.vcn_dev]
}

#################################################
# MÓDULO DE DB SYSTEM - DESARROLLO
#################################################
module "dbsystem_dev" {
  source = "./modules/dbsystem"

  # Configuration parameters
  oci_dbs_db_name = var.oci_dbs_dbname_prod
  oci_dbs_availability_domain_name = module.vcn_dev.first_availability_domain_name
  oci_dbs_compartment_id           = var.oci_compartment_id
  oci_dbs_subnet_id                = module.vcn_dev.oci_subnet_public_1_id
  oci_dbs_database_admin_password  = var.oci_dbs_admin_password_prod
  oci_dbs_ssh_public_key_path      = var.oci_ssh_public_key_path
  
  depends_on = [module.vcn_dev]
}