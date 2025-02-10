
################# File systwem
resource "oci_file_storage_file_system" "my_fss" {
  compartment_id      = oci_identity_compartment.leonardo.id
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[*].name
  display_name        = "LeonardoFileSystem"
}

############### Mount Targets
resource "oci_file_storage_mount_target" "leonardo_mount_target_1" {
  compartment_id      = oci_identity_compartment.leonardo.id
  subnet_id           = oci_core_subnet.public_subnet_1.id
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
  display_name        = "LeoMountTarget1"
}

resource "oci_file_storage_mount_target" "leonardo_mount_target_2" {
  compartment_id      = oci_identity_compartment.leonardo.id
  subnet_id           = oci_core_subnet.public_subnet_2.id
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[1].name
  display_name        = "LeoMountTarget2"
}

resource "oci_file_storage_mount_target" "leonardo_mount_target_3" {
  compartment_id      = oci_identity_compartment.leonardo.id
  subnet_id           = oci_core_subnet.public_subnet_3.id
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[2].name
  display_name        = "LeoMountTarget3"
}

############ Export Path

resource "oci_file_storage_export" "leonardo_export_1" {
  export_set_id = oci_file_storage_mount_target.leonardo_mount_target_1.export_set_id
  file_system_id = oci_file_storage_file_system.my_fss.id
  path = "/leonardo"
  display_name = "LeonardoSharedExport1"
}

resource "oci_file_storage_export" "leonardo_export_2" {
  export_set_id = oci_file_storage_mount_target.leonardo_mount_target_2.export_set_id
  file_system_id = oci_file_storage_file_system.my_fss.id
  path = "/leonardo"
  display_name = "LeonardoSharedExport2"
}

resource "oci_file_storage_export" "leonardo_export_3" {
  export_set_id = oci_file_storage_mount_target.leonardo_mount_target_3.export_set_id
  file_system_id = oci_file_storage_file_system.my_fss.id
  path = "/leonardo"
  display_name = "LeonardoSharedExport3"
}



