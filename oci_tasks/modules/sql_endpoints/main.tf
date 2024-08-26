resource "oci_dataflow_sql_endpoint" "test_sql_endpoint" {
  compartment_id        = var.compartment_id
  display_name          = var.sql_endpoint_display_name
  driver_shape          = var.driver_shape
  driver_shape_config {
    memory_in_gbs = var.driver_shape_memory
    ocpus         = var.driver_shape_ocpus
  }
  executor_shape        = var.executor_shape
  executor_shape_config {
    memory_in_gbs = var.executor_shape_memory
    ocpus         = var.executor_shape_ocpus
  }
  max_executor_count    = var.max_executor_count
  metastore_id          = oci_datacatalog_metastore.test_metastore.id
  min_executor_count    = var.min_executor_count
  network_configuration {
    network_type = var.network_type
  }
  sql_endpoint_version  = var.sql_endpoint_version
  freeform_tags         = var.freeform_tags
}