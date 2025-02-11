
################# File systwem
resource "oci_file_storage_file_system" "my_fss" {
  compartment_id      = oci_identity_compartment.leonardo.id
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
  display_name        = "LeonardoFileSystem"
}

############### Mount Targets
resource "oci_file_storage_mount_target" "leonardo_mount_target_1" {
  compartment_id      = oci_identity_compartment.leonardo.id
  subnet_id           = oci_core_subnet.public_subnet_1.id
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
  display_name        = "LeoMountTarget1"
}

############ Export Path

resource "oci_file_storage_export" "leonardo_export_1" {
  export_set_id = oci_file_storage_mount_target.leonardo_mount_target_1.export_set_id
  file_system_id = oci_file_storage_file_system.my_fss.id
  path = "/leonardo"
  export_options {
    source =  oci_core_subnet.public_subnet_1.cidr_block
    access = "READ_WRITE"
    is_anonymous_access_allowed = true
    identity_squash = "NONE"
    anonymous_uid = 65534
    anonymous_gid = 65534
  }
}




