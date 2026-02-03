# 1Password Item Terraform Module

This module retrieves all fields from a specified 1Password item and returns them as a map of key-value pairs.

## Prerequisites

Ensure you have the 1Password CLI installed and are signed in:

```bash
op signin
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_onepassword"></a> [onepassword](#requirement\_onepassword) | ~>3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_onepassword"></a> [onepassword](#provider\_onepassword) | ~>3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vault"></a> [vault](#input\_vault) | Name of the 1Password vault containing the item | `string` | n/a | yes |
| <a name="input_item"></a> [item](#input\_item) | Name of the 1Password item to retrieve | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fields"></a> [fields](#output\_fields) | Map of all fields from the 1Password item. Includes username, password, and all custom fields. |
| <a name="output_uuid"></a> [uuid](#output\_uuid) | UUID of the 1Password item |
| <a name="output_vault_uuid"></a> [vault\_uuid](#output\_vault\_uuid) | UUID of the 1Password vault |