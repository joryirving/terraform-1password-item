# Example usage of the 1Password item module

module "my_password" {
  source = "../.."
  vault  = "Personal"
  item   = "My Account"
}

output "account_info" {
  value     = module.my_password.fields
  sensitive = true
}

output "item_uuid" {
  value = module.my_password.uuid
}