
resource "oci_core_instance" "test_instance" {
  # Instance details
  #availability_domain = data.oci_identity_availability_domains.ad.names[0]
  compartment_id = oci_identity_compartment.leonardo.id
  shape          = "VM.Standard.E2.1"
  # Instance metadata for SSH access
  metadata = {
    ssh_authorized_keys = file("ssh-key-2025-02-07.pub")
  }

  create_vnic_details {
    subnet_id = oci_core_subnet.public_subnet_1.id
  }

  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux.images[0].id
  }
}



