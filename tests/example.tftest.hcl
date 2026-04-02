# Test for the simple example module
# Requires OP_TOKEN environment variable to be set with a valid 1Password token.
# Run with: tofu test -var-file=tests/secrets.tfvars

variables {
  vault = "Personal"
  item  = "Test Item"
}

# Test that the module can be initialized and validated.
# This test verifies the module structure and variable handling.
run "example_module_initialization" {
  command = plan

  assert {
    condition     = length(module.my_password.fields) > 0
    error_message = "Fields should be populated from the 1Password item"
  }
}

# Test that vault_uuid and uuid outputs are populated
run "example_module_outputs" {
  command = plan

  assert {
    condition     = module.my_password.uuid != ""
    error_message = "UUID should be populated"
  }

  assert {
    condition     = module.my_password.vault_uuid != ""
    error_message = "Vault UUID should be populated"
  }
}

# Test that the fields output contains expected keys
run "example_module_fields_structure" {
  command = plan

  assert {
    condition     = contains(keys(module.my_password.fields), "username")
    error_message = "Fields should contain username"
  }

  assert {
    condition     = contains(keys(module.my_password.fields), "password")
    error_message = "Fields should contain password"
  }
}
