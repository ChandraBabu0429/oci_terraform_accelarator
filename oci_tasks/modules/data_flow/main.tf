module "vnet" {
  source = "../vnet"
  compartment_id       = var.compartment_id
  vcn_cidr             = var.vcn_cidr
  region               = var.region
  subnet_cidr          = var.subnet_cidr
  availability_domain  = var.availability_domain
}
module "datacatalog_metastore" {
  source                           = "../datacatalog_metastore"
  compartment_id                   = var.compartment_id
  metastore_default_external_table_location = var.metastore_default_external_table_location
  metastore_default_managed_table_location  = var.metastore_default_managed_table_location 
}
resource "oci_dataflow_application" "data_flow_app" {
  compartment_id           = var.compartment_id
  description              = var.description
  display_name             =  "test_session_app"
  driver_shape             = var.driver_shape
  executor_shape           = var.executor_shape
  type                     = var.type
  language                 = var.language
  num_executors            = var.num_executors
  spark_version            = var.spark_version
  max_duration_in_minutes  = var.max_duration_in_minutes
  idle_timeout_in_minutes  = var.idle_timeout_in_minutes
  driver_shape_config {
    memory_in_gbs = var.driver_memory_in_gbs
    ocpus         = var.driver_ocpus
  }
  executor_shape_config {
    memory_in_gbs = var.executor_memory_in_gbs
    ocpus         = var.executor_ocpus
  }
  file_uri        = var.file_uri
  logs_bucket_uri = var.logs_bucket_uri
  pool_id               = oci_dataflow_pool.test_pool.id
  private_endpoint_id   = oci_dataflow_private_endpoint.test_private_endpoint.id
  metastore_id = module.datacatalog_metastore.metastore_id
}
# resource "oci_dataflow_invoke_run" "data_flow_invoke_run" {
#   application_id = oci_dataflow_application.data_flow_app.id
#   compartment_id = var.compartment_id
#   display_name   = var.display_name
# }

resource "oci_dataflow_pool" "test_pool" {
  compartment_id = var.compartment_id

  configurations {
    max = 9  # Replace with the maximum number of instances in the pool
    min = 1  # Ensure that the minimum number of instances is set to 2 or greater
    shape = "VM.Standard.E4.Flex"  # Replace with the shape of instances in the pool

    shape_config {
      memory_in_gbs = 16
      ocpus         = 1
    }
  }

  display_name             = "Data Flow Pool"  # Replace with the display name for the Data Flow pool
  description              = "test Data Flow Pool"  # Replace with the description for the Data Flow pool
  idle_timeout_in_minutes = 30  # Replace with the idle timeout for the Data Flow pool in minutes

  schedules {
    day_of_week = "SUNDAY"  # Replace with the day of the week for scheduling ("SUNDAY", "MONDAY", and so on)
    start_time  = 3   # Replace with the start time for scheduling (in hours past midnight)
    stop_time   = 4   # Replace with the stop time for scheduling (in hours past midnight)
  }
  
 }
resource "oci_dataflow_private_endpoint" "test_private_endpoint" {
  compartment_id = var.compartment_id
  description    = "test privateendpoint"
  display_name   = "Test Endpoint"
  dns_zones      = ["example.com"]
  freeform_tags  = {
    "Department" = "Finance"
  }

  max_host_count = "256"
  nsg_ids        = [module.vnet.nsg_id]
  subnet_id      = module.vnet.subnet_id
}


# resource "oci_dataflow_sql_endpoint" "test_sql_endpoint" {
#   compartment_id = "ocid1.compartment.oc1..aaaaaaaawxzeuwamurhd4gan6ik6pqaymzmwtutllbthjuv654rfi4b4te6a"
#   display_name   = "test_sql_endpoint"

#   driver_shape = "VM.Standard.E4.Flex"
#   driver_shape_config {
#     memory_in_gbs = 16
#     ocpus         = 1
#   }
#   executor_shape = "VM.Standard.E4.Flex"
#   executor_shape_config {
#     memory_in_gbs = 16
#     ocpus         = 1
#   }
#   max_executor_count = 4
#   min_executor_count = 1

#   metastore_id = "ocid1.datacatalogmetastore.oc1.us-chicago-1.amaaaaaaiayaaryaxplfeflpjg2gwiqfryqsvgwhuk42hjc2zsrmxs6cricq"

#   network_configuration {
#     network_type = "VCN"

#     vcn_id    = "ocid1.vcn.oc1.us-chicago-1.amaaaaaaiayaaryai5lqx6lntpdthznxuvtshzc3dgmcg4xc2uyje7m45trq"
#     subnet_id = "ocid1.subnet.oc1.us-chicago-1.aaaaaaaal346zk3thdwjuudhmlelqlnlu57notmngmu2his6ubti4u5f2tcq"
#   }

#   sql_endpoint_version = "3.2.1"

#   freeform_tags = {
#     "Department" = "Finance"
#   }
# }


resource "oci_dataflow_sql_endpoint" "test_sql_endpoint" {
  compartment_id        = var.compartment_id
  display_name          = "test_sql_endpoint"
  driver_shape          = "VM.Standard.E4.Flex"
  driver_shape_config {
    memory_in_gbs = 16
    ocpus = 1
  }
  executor_shape        =  "VM.Standard.E4.Flex"
  executor_shape_config {
    memory_in_gbs = 16
    ocpus = 1
  } 
  max_executor_count    = 4
  metastore_id          =  module.datacatalog_metastore.metastore_id
  min_executor_count    =  1
   network_configuration {
    network_type = "VCN"
    vcn_id    =  module.vnet.vcn_id
    subnet_id =  module.vnet.subnet_id
  }
  sql_endpoint_version  = "3.2.1"
  freeform_tags = {
      "Department" = "Finance"
  }
}