resource "oci_dataintegration_workspace" "DI_workspace" {
  compartment_id = var.compartment_id
  display_name  = "MyDIWorkspace"
}