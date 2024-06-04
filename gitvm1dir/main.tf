/*

The following links provide the documentation for the new blocks used
in this terraform configuration file

1. azurerm_resource_group - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

*/

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "230936ac-fe9f-4480-b7d8-f0e7fd92262c"
  client_id       = "57e2ba63-b348-4f56-8050-d984d762a56b"
  client_secret   = "Y388Q~qXDRJcIY6fXcOJZ1jOtf85NdQ0DTbITckb"
  tenant_id       = "6b113046-ca43-40da-ae97-bb9c442229cc"
  features {}
}

resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "North Europe"
}

resource "azurerm_storage_account" "appgrp" {
  name                     = "storage12221ff"
  resource_group_name      = "app-grp"
  location                 = "North Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}


resource "azurerm_storage_container" "example" {
  name                  = "container"
  storage_account_name  = "storage12221ff"
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "example" {
  name                   = "BlobData"
  storage_account_name   = "storage12221ff"
  storage_container_name = "container"
  type                   = "Block"
  source                 = "main.tf"
}