module "vnet" {
  source = "../vnet"
  compartment_id       = var.compartment_id
  vcn_cidr             = var.vcn_cidr
  region               = var.region
  subnet_cidr          = var.subnet_cidr
  availability_domain  = var.availability_domain
}
resource "oci_core_instance" "test_instance" {
  count               = var.num_instances
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = "TestInstance${count.index}"
  shape               = var.instance_shape
  shape_config {
    ocpus           = var.instance_ocpus
    memory_in_gbs   = var.instance_shape_config_memory_in_gbs
  }
  create_vnic_details {
    subnet_id                 = module.vnet.subnet_id
    display_name              = "Primaryvnic"
    assign_public_ip          = true
    assign_private_dns_record = true
    hostname_label            = "exampleinstance${count.index}"
  }
  source_details {
    source_type = "image"
    source_id   = var.flex_instance_image_ocid[var.region]
  }
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
  preemptible_instance_config {
    preemption_action {
      type = "TERMINATE"
      preserve_boot_volume = false
    }
  }
  timeouts {
    create = "60m"
  }
}
