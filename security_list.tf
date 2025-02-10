resource "oci_core_security_list" "public_security_list" {
  compartment_id = oci_identity_compartment.leonardo.id
  vcn_id         = oci_core_vcn.main_vcn.id
  display_name   = "LeoPublicSecurityList"

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol = "1" # ICMP
    source   = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "all" # My IP
    source   = "186.116.221.81/32"
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}
