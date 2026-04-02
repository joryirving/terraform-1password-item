variable "vault" {
  description = "Name of the 1Password vault containing the item"
  type        = string
  validation {
    condition     = length(var.vault) > 0
    error_message = "Vault name must not be empty."
  }
}

variable "item" {
  description = "Name of the 1Password item to retrieve"
  type        = string
  validation {
    condition     = length(var.item) > 0
    error_message = "Item name must not be empty."
  }
}