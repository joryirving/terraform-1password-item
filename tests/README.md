# Tests

This directory contains integration tests for the 1Password Terraform module.

## Prerequisites

To run these tests, you need:

1. A valid 1Password account with the 1Password CLI (`op`) installed
2. A signed-in 1Password session: `op signin`
3. An environment variable `OP_SERVICE_ACCOUNT_TOKEN` set with your 1Password service account token

## Running Tests

From the repository root:

```bash
tofu test
```

Or with a specific test file:

```bash
tofu test tests/example.tftest.hcl
```

## CI

Tests run automatically in GitHub Actions on every push and pull request.
However, the 1Password provider requires authentication, so the full integration
tests are skipped in CI unless `OP_SERVICE_ACCOUNT_TOKEN` is configured as a
GitHub secret.

To enable full test runs in CI:

1. Go to your repository's **Settings → Secrets and variables → Actions**
2. Add a new repository secret: `OP_SERVICE_ACCOUNT_TOKEN`
3. The CI workflow will automatically pick it up and run integration tests

## Test Coverage

- `example.tftest.hcl` — Tests the `examples/simple` module:
  - Module initializes and returns fields from 1Password
  - `uuid` and `vault_uuid` outputs are populated
  - `fields` output contains expected keys (`username`, `password`)
