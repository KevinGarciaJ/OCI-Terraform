###############################################
# PARÁMETROS GENERALES DE OCI
###############################################
oci_compartment_id = "ocid1.compartment.oc1..aaaaaaaago6deoyb4hatbg62hvcr7o4xfv7wb7qxk4rfyxo72a5vrltw37tq"
oci_region = "us-phoenix-1"
oci_tenancy_id = "ocid1.tenancy.oc1..aaaaaaaakemfhg7ci3jnbje2fw4k75g7yjwkjeezwkqqk5fntti3ugtcz3hq"
oci_label_prefix = "none"
oci_freeform_tags = {
  environment = "dev"
}

###############################################
# PARÁMETROS DE VCN
###############################################
oci_vcn_name = "dtu-tf-vcn"
oci_vcn_cidrs = ["10.12.0.0/16"]
oci_vcn_dns_label = "vcn"
oci_enable_ipv6 = false

###############################################
# PARÁMETROS DE GATEWAYS
###############################################
oci_create_internet_gateway = true
oci_internet_gateway_display_name = "dtu-tf-igw"

oci_create_nat_gateway = true
oci_nat_gateway_display_name = "dtu-tf-ngw"
oci_nat_gateway_public_ip_id = "none"

oci_create_service_gateway = false
oci_service_gateway_display_name = "dtu-tf-sgw"

###############################################
# PARÁMETROS DE RED Y SEGURIDAD
###############################################
oci_subnets = {
  sub1 = {
    name = "dtu_public_1", 
    cidr_block = "10.12.4.0/24", 
    type = "public",
    dns_label = "dtu_public_1"  # Esto habilita DNS para la subnet
  }
  sub2 = {
    name = "dtu_private_1", 
    cidr_block = "10.12.5.0/24", 
    type = "private",
    dns_label = "dtu_private_1"  # Esto habilita DNS para la subnet
  }
}

oci_ingress_ports_list_tcp = [22, 80, 443, 51820, 1521]
oci_icmp_protocols = [3, 8]

###############################################
# PARÁMETROS DE AUTONOMOUS DATABASE PRODUCCIÓN
###############################################
oci_adb_db_name_prod = "dtudb"
oci_adb_db_workload_prod = "OLTP"
oci_adb_data_storage_size_in_gb_prod = 20


###############################################
# PARÁMETROS DE DBSYSTEM PRODUCCIÓN
###############################################
oci_ssh_public_key_path = "/home/agarcia/oci_instances.pub"
