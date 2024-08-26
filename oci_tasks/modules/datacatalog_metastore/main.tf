resource "oci_datacatalog_metastore" "test_metastore" {
  compartment_id                  = var.compartment_id
  default_external_table_location = var.metastore_default_external_table_location
  default_managed_table_location  = var.metastore_default_managed_table_location
}
output "metastore_id" {
  value = oci_datacatalog_metastore.test_metastore.id
}


