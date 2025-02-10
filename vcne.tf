#module "vcn" {
  #source         = "git::git@github.com:Devjefffstev/terraform.git//Modules OCI//VCN"
  #compartment_id = oci_identity_compartment.leonardo.id
  #cidr_blocks    = var.cidr_blocks
  #subnets        = var.subnets
  #display_name   = var.display_name
#}