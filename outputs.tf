output "fields" {
  description = "Map of all fields from the Password item. Includes username, password, and all custom fields."
  sensitive   = true
  value = merge(
    {
      username = data.onepassword_item.item.username
      password = data.onepassword_item.item.password
    },
    merge([
      for section in data.onepassword_item.item.section : merge([
        for field in section.field : {
          "${field.label}" = field.type == "CONCEALED" ? sensitive(field.value) : field.value
        }
      ]...)
    ]...)
  )
}

output "uuid" {
  description = "UUID of the 1Password item"
  value       = data.onepassword_item.item.uuid
  sensitive   = false
}

output "vault_uuid" {
  description = "UUID of the 1Password vault"
  value       = data.onepassword_vault.vault.uuid
  sensitive   = false
}
