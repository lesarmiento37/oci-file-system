resource "oci_core_subnet" "public_subnet_1" {
  cidr_block        = "192.168.1.0/24"
  vcn_id            = oci_core_vcn.main_vcn.id
  display_name      = "LeoPublicSubnet1"
  compartment_id    = oci_identity_compartment.leonardo.id
  availability_domain = "1" 
  route_table_id    = oci_core_route_table.internet_route.id
  dhcp_options_id   = oci_core_vcn.main_vcn.default_dhcp_options_id
  security_list_ids = [oci_core_security_list.public_security_list.id]
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_subnet" "public_subnet_2" {
  cidr_block        = "192.168.2.0/24"
  vcn_id            = oci_core_vcn.main_vcn.id
  display_name      = "LeoPublicSubnet2"
  compartment_id    = oci_identity_compartment.leonardo.id
  availability_domain = "2"
  route_table_id    = oci_core_route_table.internet_route.id
  dhcp_options_id   = oci_core_vcn.main_vcn.default_dhcp_options_id
  security_list_ids = [oci_core_security_list.public_security_list.id]
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_subnet" "public_subnet_3" {
  cidr_block        = "192.168.3.0/24"
  vcn_id            = oci_core_vcn.main_vcn.id
  display_name      = "LeoPublicSubnet3"
  compartment_id    = oci_identity_compartment.leonardo.id
  availability_domain = "3"
  route_table_id    = oci_core_route_table.internet_route.id
  dhcp_options_id   = oci_core_vcn.main_vcn.default_dhcp_options_id
  security_list_ids = [oci_core_security_list.public_security_list.id]
  prohibit_public_ip_on_vnic = false
}
