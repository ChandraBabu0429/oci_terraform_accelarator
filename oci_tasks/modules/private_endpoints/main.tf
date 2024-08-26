module "vnet" {
  source = "../vnet"
  compartment_id       = var.compartment_id
  vcn_cidr             = var.vcn_cidr
  region               = var.region
  subnet_cidr          = var.subnet_cidr
  availability_domain  = var.availability_domain
}
resource "oci_dataflow_private_endpoint" "test_private_endpoint" {
  compartment_id = var.compartment_id
  description    = "test privateendpoint"
  display_name   = "Test Endpoint"
  dns_zones      = ["example.com"]
  freeform_tags = {
    "Department" = "Finance"
  }
  max_host_count = "256" 
  nsg_ids        = [module.vnet.allow_all_tcp_security_rule_id]
  subnet_id      = module.vnet.subnet_id
}
