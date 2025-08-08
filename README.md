# Oracle Cloud Infraestructure (OCI) con Terraform

## Descripción General

Este proyecto utiliza Terraform para desplegar y gestionar infraestructura en Oracle Cloud Infrastructure (OCI). La infraestructura incluye:

- Una Virtual Cloud Network (VCN) con subredes públicas y privadas
- Gateways (Internet Gateway y NAT Gateway)
- Configuraciones de seguridad (security lists)
- Una base de datos Autonomous Database
- Un sistema de base de datos Oracle DB System

## Estructura del Proyecto

```
.
├── main.tf                 # Archivo principal que orquesta los módulos
├── providers.tf            # Configuración del proveedor OCI
├── variables.tf            # Definición de variables
├── terraform.auto.tfvars   # Valores de las variables
├── terraform.tfstate       # Estado actual de la infraestructura
└── modules/                # Módulos personalizados
    ├── vcn/                # Módulo para gestión de red
    ├── adb/                # Módulo para Autonomous Database
    └── dbsystem/           # Módulo para DB System
```

## Requisitos Previos

- Terraform v1.12.x
- Acceso a Oracle Cloud Infrastructure
- Credenciales OCI configuradas (usuario, fingerprint, clave privada, etc.)

## Componentes Principales

### VCN (Virtual Cloud Network)

La VCN se configura con:

- CIDR Block: `10.12.0.0/16`
- DNS Label: `vcn`
- Región: `us-phoenix-1`

#### Subredes

| Nombre | Tipo | CIDR | DNS Label |
|--------|------|------|-----------|
| dtu_public_1 | Pública | 10.12.4.0/24 | dtu_public_1 |
| dtu_private_1 | Privada | 10.12.5.0/24 | dtu_private_1 |

#### Gateways

- **Internet Gateway**: Habilitado (dtu-tf-igw)
- **NAT Gateway**: Habilitado (dtu-tf-ngw)
- **Service Gateway**: No habilitado (dtu-tf-sgw)

#### Seguridad

La configuración incluye reglas de seguridad para los siguientes puertos TCP:
- 22 (SSH)
- 80 (HTTP)
- 443 (HTTPS)
- 1521 (Oracle Database)

Y protocolos ICMP:
- Tipo 3 (Destination Unreachable)
- Tipo 8 (Echo/Ping)

### Autonomous Database

- **Nombre**: dtudb
- **Workload**: OLTP
- **Almacenamiento**: 20 GB
- **Compute**: 4 ECPUs
- **Tier**: Developer
- **License Model**: LICENSE_INCLUDED

### DB System

Configurado pero no desplegado en el estado actual. Se utilizaría la primera zona de disponibilidad (YINh:PHX-AD-1) y la subred pública dtu_public_1.

## Uso

### Inicialización

```bash
terraform init
```

### Verificar Cambios Planificados

```bash
terraform plan
```

### Aplicar Cambios

```bash
terraform apply
```

### Destruir Infraestructura

```bash
terraform destroy
```

## Variables Principales

### Generales

| Variable | Descripción | Valor Actual |
|----------|-------------|--------------|
| oci_compartment_id | ID del compartment donde se crean los recursos | ocid1.compartment.oc1..aaaaaaaago6deoyb4hatbg62hvcr7o4xfv7wb7qxk4rfyxo72a5vrltw37tq |
| oci_region | Región OCI | us-phoenix-1 |
| oci_tenancy_id | ID del Tenancy | ocid1.tenancy.oc1..aaaaaaaakemfhg7ci3jnbje2fw4k75g7yjwkjeezwkqqk5fntti3ugtcz3hq |

### VCN

| Variable | Descripción | Valor Actual |
|----------|-------------|--------------|
| oci_vcn_name | Nombre de la VCN | dtu-tf-vcn |
| oci_vcn_cidrs | CIDR de la VCN | ["10.12.0.0/16"] |
| oci_vcn_dns_label | DNS Label de la VCN | vcn |

### Autonomous Database

| Variable | Descripción | Valor Actual |
|----------|-------------|--------------|
| oci_adb_db_name_dev_1 | Nombre de la base de datos | dtudb |
| oci_adb_db_workload_dev_1 | Tipo de workload | OLTP |
| oci_adb_data_storage_size_in_gb_dev_1 | Tamaño de almacenamiento | 20 |
| oci_adb_is_dev_tier_dev_1 | Usar tier de desarrollo | true |


### Database System

| Variable | Descripción | Valor Actual |
|----------|-------------|--------------|
| oci_dbs_dbname_dev_1 | Nombre de la base de datos | datumdb1 |
| oci_dbs_admin_password_dev_1 | Password asignada para usuario SYS | N/A |
| oci_ssh_public_key_path | Ruta de llave pública que permitirá la conexión con los db nodes | /home/.../oci_instances.pub |



