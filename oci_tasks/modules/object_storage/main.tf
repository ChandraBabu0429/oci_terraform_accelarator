resource "oci_objectstorage_bucket" "os_bucket" {
  name          = var.name
  compartment_id = var.compartment_id
  namespace     = var.namespace
}
resource "oci_objectstorage_object" "test_object" {
  bucket    = oci_objectstorage_bucket.os_bucket.name
  content   = "image upload dummy"
  namespace = var.namespace
  object    = var.object
}
