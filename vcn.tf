
resource "oci_core_vcn" "main_vcn" {
  cidr_block     = "192.168.0.0/16"
  display_name   = "leonardo-vcn"
  compartment_id = oci_identity_compartment.leonardo.id
}
