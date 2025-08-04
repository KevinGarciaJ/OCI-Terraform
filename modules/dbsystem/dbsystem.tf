resource "oci_database_db_system" "test_db_system" {
    # Parámetros requeridos
    availability_domain         = var.oci_dbs_availability_domain_name
    compartment_id              = var.oci_dbs_compartment_id
    subnet_id                   = var.oci_dbs_subnet_id
    database_edition            = var.oci_dbs_database_edition
    db_home {
        database {
            admin_password      = var.oci_dbs_database_admin_password
            db_name             = var.oci_dbs_db_name
            character_set       = var.oci_dbs_character_set
            ncharacter_set      = var.oci_dbs_ncharacter_set
            db_workload         = var.oci_dbs_db_workload
        }
        db_version              = var.oci_dbs_db_version
        display_name            = var.oci_dbs_display_name
    }
    hostname                    = var.oci_dbs_hostname
    shape                       = var.oci_dbs_shape

    db_system_options{
        storage_management = var.oci_dbs_storage_management
    }

    ssh_public_keys             = [file(var.oci_dbs_ssh_public_key_path)]

    
    # Parámetros opcionales
    display_name                = var.oci_dbs_display_name
    #domain                      = "example.com"
    data_storage_size_in_gb     = var.oci_dbs_data_storage_size_in_gb
    license_model               = var.oci_dbs_license_model
    node_count                  = var.oci_dbs_cpu_core_count

    timeouts {
        create = "3h" 
    }
}