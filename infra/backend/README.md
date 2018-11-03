# backend

### Files for Terraform's remote state management

This module stores the resources needed by Terraform to safely store and
synchronize the state of our infrastructure.

### How to use

Because this module configures the resources required by the remote backend, it
needs to be called before you execute any other code in your infrastructure.

Since Terraform doesn't accept interpolations in the backend configuration,
this module shouldn't be imported into your main project. Instead, create the
resources directly from this directory such as shown below:

```bash
cd infra/backend
vi variables.tf # set up your project-specific resource names
terraform apply
```
