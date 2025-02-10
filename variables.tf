variable "ssh_key" {
  type        = string
  default     = ""
  description = "description"
}

variable "compartment_ocid" {
  type        = string
  default     = "ocid1.tenancy.oc1..aaaaaaaakmmcwzir7oie5l4nuqrq64eedjep2svhw2netgtlhm63xns2u7fq"
  description = "description"
}

variable "display_name" {
  type        = string
  description = "A user-friendly name. Does not have to be unique, and it's changeable."
}


variable "cidr_blocks" {
  type        = list(string)
  description = "The list of one or more IPv4 CIDR blocks for the VCN. Module"

}
variable "subnets" {
  type = map(object({
    cidr_block = string
    dns_label  = optional(string, null)
  }))
  description = "The list of subnets to create in the VCN."
}