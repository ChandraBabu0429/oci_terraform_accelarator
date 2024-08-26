terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 5.20.0"
    }
  }
}
provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  private_key_path = var.private_key_path
  fingerprint      = var.fingerprint
  region           = var.region
}
module "object_storage" {
  source = "./modules/object_storage"
  name           = var.name
  compartment_id = var.compartment_id
   region         = var.region
  namespace      = var.namespace
  object         = var.object
}
module "data_integration" {
  source = "./modules/data_integration"  
  compartment_id = var.compartment_id 
}
module "database_adw" {
  source               = "./modules/database_adw"  
  compartment_id       = var.compartment_id
  adw_admin_password   = var.adw_admin_password
  oltp_admin_password  = var.oltp_admin_password
  display_name         = var.display_name
  region               = var.region
  subnet_cidr          = var.subnet_cidr
  availability_domain  = var.availability_domain
  vcn_cidr             = var.vcn_cidr
}
module "vnet" {
  source               = "./modules/vnet"
  compartment_id       = var.compartment_id
  vcn_cidr             = var.vcn_cidr
  region               = var.region
  subnet_cidr          = var.subnet_cidr
  availability_domain  = var.availability_domain
}
module "oci_instances" {
  source                        = "./modules/oci_instances"
  compartment_id                = var.compartment_id
  availability_domain           = var.availability_domain
  image_id                      = var.image_id
  subnet_id                     = module.vnet.subnet_id
  shape                         = var.instance_shape
  ssh_public_key                = var.ssh_public_key
  ssh_private_key               = var.ssh_private_key
  instance_vcpus                = var.instance_vcpus
  instance_shape_config_memory_in_gbs = var.instance_shape_config_memory_in_gbs
  db_size                       = var.db_size
  tag_namespace_description     = var.tag_namespace_description
  region                        = var.region
  flex_instance_image_ocid      = var.flex_instance_image_ocid
  num_iscsi_volumes_per_instance = var.num_iscsi_volumes_per_instance
  num_instances                 = var.num_instances
  num_paravirtualized_volumes_per_instance = var.num_paravirtualized_volumes_per_instance
  instance_shape                = var.instance_shape
  instance_ocpus                = var.instance_ocpus
  subnet_cidr                   = var.subnet_cidr
  vcn_cidr                      = var.vcn_cidr
  tag_namespace_name            = var.tag_namespace_name
}
module "datacatalog_metastore" {
  source                           = "./modules/datacatalog_metastore"
  compartment_id                   = var.compartment_id
  metastore_default_external_table_location = var.metastore_default_external_table_location
  metastore_default_managed_table_location  = var.metastore_default_managed_table_location 
}
module "data_flow" {
  source                      = "./modules/data_flow"
  compartment_id               = var.compartment_id
  description                  = var.description
  display_name                 = "test_session_app"
  driver_shape                 = var.driver_shape
  executor_shape               = var.executor_shape
  type                         = var.type
  language                     = var.language
  num_executors                = var.num_executors
  spark_version                = var.spark_version
  max_duration_in_minutes      = var.max_duration_in_minutes
  idle_timeout_in_minutes      = var.idle_timeout_in_minutes
  driver_memory_in_gbs         = var.driver_shape_memory_in_gbs
  driver_ocpus                 = var.driver_shape_ocpus
  executor_memory_in_gbs       = var.executor_shape_memory_in_gbs
  executor_ocpus               = var.executor_shape_ocpus
  file_uri                     = var.file_uri
  logs_bucket_uri              = var.logs_bucket_uri
  subnet_cidr                  = var.subnet_cidr
  vcn_cidr                     = var.vcn_cidr
  region                       = var.region
  availability_domain          = var.availability_domain
  metastore_default_external_table_location = var.metastore_default_external_table_location
  metastore_default_managed_table_location  = var.metastore_default_managed_table_location
}

