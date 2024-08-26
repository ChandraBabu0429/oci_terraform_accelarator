variable "compartment_id" {}
variable "description" {}
variable "display_name" {}
variable "driver_shape" {}
variable "executor_shape" {}
variable "type" {}
variable "language" {}
variable "num_executors" {}
variable "spark_version" {}
variable "max_duration_in_minutes" {}
variable "idle_timeout_in_minutes" {}
variable "driver_memory_in_gbs" {}
variable "driver_ocpus" {}
variable "executor_memory_in_gbs" {}
variable "executor_ocpus" {}
variable "file_uri" {}
variable "logs_bucket_uri" {}
variable "region" {}
variable "subnet_cidr" {}
variable "vcn_cidr" {}
variable "availability_domain" {}
# output "subnet_id" {
#   value = oci_core_subnet.my_subnet.id
# }
variable "metastore_default_external_table_location" {}
variable "metastore_default_managed_table_location" {}
