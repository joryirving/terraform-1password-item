terraform {
  required_providers {
    onepassword = {
      source  = "1password/onepassword"
      version = "~>3.0"
    }
  }
}

data "onepassword_vault" "vault" {
  name = var.vault
}

data "onepassword_item" "item" {
  vault = data.onepassword_vault.vault.uuid
  title = var.item
}

# Add locals to handle edge cases
locals {
  has_sections = length(data.onepassword_item.item.section) > 0
}