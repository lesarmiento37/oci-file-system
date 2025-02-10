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
