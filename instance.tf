
resource "oci_core_instance" "test_instance" {
  # Instance details
  #availability_domain = data.oci_identity_availability_domains.ad.names[0]
  compartment_id      = oci_identity_compartment.leonardo.id
  shape               = "VM.Standard.E2.1" 
  # Instance metadata for SSH access
  metadata = {
    ssh_authorized_keys = file("ssh-key-2025-02-07.pub")  
  } 

  create_vnic_details {
                subnet_id = module.vcn.subnets_properties.subnet1.id
            }

  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux.images[0].id
  }
}

# Data sources to retrieve existing resources
data "oci_identity_availability_domains" "ad" {
  compartment_id = var.compartment_ocid
}

data "oci_core_images" "oracle_linux" {
  compartment_id           = var.compartment_ocid
  operating_system         = "Oracle Linux"
  operating_system_version = "8"
  shape                    = "VM.Standard.E2.1"
}


#vcn_id         = "ocid1.vcn.oc1.phx.amaaaaaa4kbj7vyalq5q3abzj2cagqd3iz3y5nskb7blrgmqvhj62c2ienka"

#oci iam compartment get --compartment-id ocid1.compartment.oc1..aaaaaaaa73mn3ziis66vfodgi7ja7fp4wrowosujlleyylovxxuq2y6yo7ra
#oci compute image list --compartment-id ocid1.compartment.oc1..aaaaaaaa73mn3ziis66vfodgi7ja7fp4wrowosujlleyylovxxuq2y6yo7ra --operating-system "Oracle Linux"
#oci network subnet list --compartment-id ocid1.compartment.oc1..aaaaaaaa73mn3ziis66vfodgi7ja7fp4wrowosujlleyylovxxuq2y6yo7ra
#oci iam availability-domain list --compartment-id ocid1.compartment.oc1..aaaaaaaa73mn3ziis66vfodgi7ja7fp4wrowosujlleyylovxxuq2y6yo7ra


