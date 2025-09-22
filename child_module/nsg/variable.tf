variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "nic_ids" {
  type        = map(string)
  description = "Map of NIC IDs to attach to NSG"
}
