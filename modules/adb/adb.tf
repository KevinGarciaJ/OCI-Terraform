resource "oci_database_autonomous_database" "datum_adb" {
    #################################################
    # CONFIGURACIÓN BÁSICA
    #################################################
    compartment_id           = var.oci_adb_compartment_id
    db_name                  = var.oci_adb_db_name
    admin_password           = var.oci_adb_admin_password
    db_workload              = var.oci_adb_db_workload
    freeform_tags = var.oci_adb_freeform_tags
    
    #################################################
    # MODELO DE CÓMPUTO Y RECURSOS
    #################################################
    # Configuración del modelo de CPU
    compute_model            = var.oci_adb_cpu_model
    
    # Usa cpu_core_count o compute_count dependiendo del modelo
    # Si la condición es verdadera, entonces se usa el valor que está inmediatamente después del ? , El símbolo : separa el valor para el caso verdadero del valor para el caso falso
    cpu_core_count           = var.oci_adb_cpu_model == "OCPU" ? var.oci_adb_cpu_core_count : null
    compute_count            = var.oci_adb_cpu_model == "ECPU" ? var.oci_adb_compute_count : null
    
    # Usa tamaño en TB o GB dependiendo del modelo
    data_storage_size_in_tbs = var.oci_adb_cpu_model == "OCPU" ? var.oci_adb_data_storage_size_in_tbs : null
    data_storage_size_in_gb  = var.oci_adb_cpu_model == "ECPU" ? var.oci_adb_data_storage_size_in_gb : null
    
    # Configuración de escalado automático
    is_auto_scaling_enabled  = var.oci_adb_is_auto_scaling_enabled
    
    #################################################
    # LICENCIAMIENTO Y NIVEL DE SERVICIO
    #################################################
    license_model            = var.oci_adb_license_model
    is_dev_tier              = var.oci_adb_is_dev_tier
    #is_free_tier            = true
    
    #################################################
    # CONFIGURACIÓN DE RED (comentado)
    #################################################
    # Configuración del endpoint privado
    #subnet_id               = oci_core_subnet.oci_subnet_private_1.id
    #private_endpoint_label  = "myprivateendpoint"
    
    # Opcional: Configuración de Grupos de Seguridad de Red (NSG)
    #nsg_ids                 = [oci_core_network_security_group.database_nsg.id]
}