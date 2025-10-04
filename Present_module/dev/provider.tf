terraform {
  required_version = ">= 1.5.0" 
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.44.0"
    }
  }
}

provider "azurerm" {
  features {

  }
  subscription_id = "8c512603-6b99-4d47-9d27-a573899ff4aa"
}

