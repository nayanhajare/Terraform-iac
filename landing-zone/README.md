# Terraform Landing Zone

This repository contains the Terraform infrastructure code for provisioning an Azure Landing Zone.

## Resource Structuring

The codebase is organized following best practices for modular, scalable, and environment-specific Terraform deployments:

1.  **`child_modules/`**: Contains reusable, generic Terraform modules for individual Azure resources (e.g., Virtual Machine, Key Vault, Storage Account, Network). These modules abstract away the complexity of resource creation and expose necessary variables for configuration.
2.  **`environment/`**: Contains environment-specific configurations, such as `pre-prod` and `prod`. Each environment folder acts as a root Terraform module.
    *   **`main.tf`**: Calls the child modules using `for_each` loops, referencing variables to provision the required infrastructure.
    *   **`variables.tf`**: Defines the input variables for the environment.
    *   **`terraform.tfvars`**: Contains the actual configuration data (values) for the environment using maps of objects (e.g., `virtual_networks`, `key_vaults`). This allows for dynamic and data-driven infrastructure creation.
    *   **`outputs.tf`**: Defines the outputs to display after terraform apply.
    *   **`provider.tf`**: Configures the Azure Provider settings.

### How to use this structure:
To add a new resource, you typically:
1.  Define the resource properties in the respective map block within `environment/<env>/terraform.tfvars`. For example, to add a new VM, you would add an entry to the `virtual_machines` map.
2.  If the required resource type doesn't exist as a child module, create a new folder under `child_modules/` with its own `main.tf`, `variables.tf`, and `outputs.tf`. Then instantiate it in the environment's `main.tf`.

## Key Vault Data and Secret Management

The setup utilizes **Azure Key Vault** to securely store secrets generated during the deployment process.

### How Key Vault is configured:
1.  **Secret Generation**: In `environment/<env>/main.tf`, random passwords are generated using the `random_password` provider (e.g., for SQL Server admin or VM admin).
    ```hcl
    resource "random_password" "sql_password" {
      length           = 16
      special          = true
    }
    ```
2.  **Key Vault Module Integration**: The Key Vault is provisioned via the `child_modules/azurerm_key_vault` module.
3.  **Storing Secrets**: The generated passwords are automatically stored as secrets in the Key Vault by passing them into the `secrets` attribute of the Key Vault module block within `main.tf`:
    ```hcl
    module "key_vaults" {
      source = "../../child_modules/azurerm_key_vault"
      ...
      secrets = {
        "sqladmin-password" = random_password.sql_password.result
        "vmadmin-password"  = random_password.vm_password.result
      }
    }
    ```
4.  **Consuming Secrets**: Those same generated passwords are simultaneously passed to the resources that require them (like the `mssql_servers` or `virtual_machines` modules).

By structuring it this way, you never hardcode sensitive passwords in your `.tfvars` files, and they are automatically managed and securely stored in Azure Key Vault for future retrieval or auditing.
