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
  subscription_id = "5b810eac-4419-4b63-bec3-e76a59097aef"
}

