# resource "oci_dataflow_pool" "test_pool" {
#   compartment_id = var.compartment_id

#   configurations {
#     max = var.data_flow_pool_max_instances
#     min = var.data_flow_pool_min_instances
#     shape = var.data_flow_pool_shape

#     shape_config {
#       memory_in_gbs = var.data_flow_pool_memory_in_gbs
#       ocpus         = var.data_flow_pool_ocpus
#     }
#   }

#   display_name             = var.data_flow_pool_display_name
#   description              = var.data_flow_pool_description
#   idle_timeout_in_minutes = var.data_flow_pool_idle_timeout
# }


resource "oci_dataflow_pool" "test_pool" {
  compartment_id = var.compartment_id

  configurations {
    max = 2  # Replace with the maximum number of instances in the pool
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