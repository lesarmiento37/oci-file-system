
resource "oci_core_instance" "test_instance" {
  compartment_id = oci_identity_compartment.leonardo.id
  shape          = "VM.Standard.E2.1"

  create_vnic_details {
    subnet_id = oci_core_subnet.public_subnet_1.id
  }

  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux.images[0].id
  }

  metadata = {
    ssh_authorized_keys = file("ssh-key-2025-02-07.pub")
    user_data = base64encode(<<-EOF
      #!/bin/bash
      sudo yum install -y nfs-utils
      sudo mkdir -p /mnt/leonardo
      sudo mount -t nfs ${oci_file_storage_mount_target.leonardo_mount_target_1.private_ip_ids[0]}:/leonardo /mnt/leonardo
    EOF
    )
  }

  depends_on = [
    oci_file_storage_mount_target.leonardo_mount_target_1,
    oci_file_storage_export.leonardo_export_1
  ]
}



resource "oci_core_instance" "test_instance_2" {
  compartment_id = oci_identity_compartment.leonardo.id
  shape          = "VM.Standard.E2.1"

  create_vnic_details {
    subnet_id = oci_core_subnet.public_subnet_2.id
  }

  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[1].name

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux.images[0].id
  }

  metadata = {
    ssh_authorized_keys = file("ssh-key-2025-02-07.pub")
    user_data = base64encode(<<-EOF
      #!/bin/bash
      sudo yum install -y nfs-utils
      sudo mkdir -p /mnt/leonardo
      sudo mount -t nfs ${oci_file_storage_mount_target.leonardo_mount_target_1.private_ip_ids[0]}:/leonardo /mnt/leonardo
    EOF
    )
  }

  depends_on = [
    oci_file_storage_mount_target.leonardo_mount_target_1,
    oci_file_storage_export.leonardo_export_1
  ]
}

#sudo mount -t nfs 192.168.1.200:/leonardo /mnt/leonardo