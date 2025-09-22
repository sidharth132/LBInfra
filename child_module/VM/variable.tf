variable "vm_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "nic_ids" {
  type = list(string)
}
