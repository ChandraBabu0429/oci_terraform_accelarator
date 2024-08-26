resource "oci_core_virtual_network" "my_vcn" {
  cidr_block     = var.vcn_cidr
  compartment_id = var.compartment_id
  display_name   = "MyVCN"
 dns_label      = "myvcndnslabel" # Ensure DNS is enabled for the VCN
}
resource "oci_core_subnet" "my_subnet" {
  compartment_id          = var.compartment_id
  cidr_block              = var.subnet_cidr
  display_name            = "MySubnet"
  availability_domain     = var.availability_domain
  vcn_id                  = oci_core_virtual_network.my_vcn.id
  dns_label               = "testsubnet"
  prohibit_public_ip_on_vnic = false 
}
resource "oci_core_internet_gateway" "vcn_igw" {
  compartment_id = var.compartment_id
  display_name = "VCNIGW"
  vcn_id = oci_core_virtual_network.my_vcn.id
}
resource "oci_core_route_table" "my_route_table" {
  compartment_id = var.compartment_id
  vcn_id = oci_core_virtual_network.my_vcn.id
  display_name = "MyRouteTable"
  route_rules {
    destination     = "0.0.0.0/0"  # This is the destination for the default route (internet)
    network_entity_id = oci_core_internet_gateway.vcn_igw.id  # Use the ID of your Internet Gateway
  }
}
resource "oci_core_network_security_group" "test_network_security_group" {
    #Required
    compartment_id = var.compartment_id
    vcn_id =  oci_core_virtual_network.my_vcn.id
}
resource "oci_core_network_security_group_security_rule" "allow_all_tcp" {
  network_security_group_id = oci_core_network_security_group.test_network_security_group.id
  description              = "Allow all TCP traffic"
  direction                = "INGRESS"
  protocol                 = "6"  # TCP (You can also use "all" to represent all protocols)
  source_type              = "CIDR_BLOCK"
  source                   = "0.0.0.0/0"  # Allow traffic from any source
  destination_type         = "CIDR_BLOCK"
  destination              = oci_core_subnet.my_subnet.cidr_block
  tcp_options {
    destination_port_range {
      max = 65535  # Maximum port number
      min = 1      # Minimum port number (allow all ports)
    }
    source_port_range {
      max = 65535  # Maximum port number
      min = 1      # Minimum port number (allow all ports)
    }
  }
}
output "nsg_id" {
  value = oci_core_network_security_group.test_network_security_group.id
}
output "subnet_id" {
  value = oci_core_subnet.my_subnet.id
}
output "vcn_id" {
  value = oci_core_virtual_network.my_vcn.id
}
