variable "rg_name" {
  
}
variable "location" {
  
}

variable "bastion_subnet_id" {
  description = "ID of the Bastion subnet"
  type        = string
}

variable "bastion_pip_id" {
  description = "ID of the Bastion public IP"
  type        = string
}
