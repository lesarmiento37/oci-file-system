
data "oci_identity_compartments" "main" {
  compartment_id            = "ocid1.tenancy.oc1..aaaaaaaakmmcwzir7oie5l4nuqrq64eedjep2svhw2netgtlhm63xns2u7fq"
  compartment_id_in_subtree = false
  filter {
    name   = "name"
    values = ["ocicert"]
 
  }
 
}

locals {
  ocicert_compartment = try(data.oci_identity_compartments.main.compartments[0].id, null)
}

resource "oci_identity_compartment" "leonardo" {
#   compartment_id = var.compartment_id
  compartment_id = local.ocicert_compartment
  name           = "leonardo-sarmiento"
  description    = "To deploy network modules"
}