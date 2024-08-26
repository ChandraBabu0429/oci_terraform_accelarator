module "vnet" {
  source = "../vnet"
  compartment_id       = var.compartment_id
  vcn_cidr             = var.vcn_cidr
  region               = var.region
  subnet_cidr          = var.subnet_cidr
  availability_domain  = var.availability_domain
}
# Autonomous Data Warehouse (ADW)
resource "oci_database_autonomous_database" "adwdemodb" {
  admin_password          = var.adw_admin_password 
  display_name            = var.display_name
  compartment_id          = var.compartment_id
  cpu_core_count          = 1
  data_storage_size_in_tbs= 1
  db_workload             = "DW"
  db_name                 = "demodw"
  license_model           = "BRING_YOUR_OWN_LICENSE"
  subnet_id               = module.vnet.subnet_id
  nsg_ids                 = [module.vnet.nsg_id]
}
# #Autonomous OLTP Database
# resource "oci_database_autonomous_database" "oltpdemodb" {
#   admin_password          = var.oltp_admin_password
#   display_name            = var.display_name
#   compartment_id          = var.compartment_id
#   cpu_core_count          = 1
#   data_storage_size_in_tbs= 1
#   db_workload             = "OLTP"
#   db_name                 = "oltpdemo"
#   license_model           = "BRING_YOUR_OWN_LICENSE"
#   subnet_id               = module.vnet.subnet_id
#   nsg_ids                 = [module.vnet.nsg_id]
# }
