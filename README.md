# terraform-workspace-example

# Terraform Workspaces Guide

This project demonstrates how to use **Terraform Workspaces** to manage multiple environments such as `dev`, `stage`, and `prod`.

---

## 📁 What are Workspaces?

Terraform workspaces allow you to maintain **separate state files** for different environments using the same Terraform configuration.

Each workspace has its **own state**, which means you can deploy the same infrastructure code to different environments without interference.

---

## 🚀 Common Workspace Commands

### 🔹 1. List all Workspaces

```bash
terraform workspace list
```

Displays all available workspaces. The current workspace is marked with a `*`.

---

### 🔹 2. Create a New Workspace

```bash
terraform workspace new <workspace_name>
```

Example:

```bash
terraform workspace new dev
```

Creates and switches to a new workspace named `dev`.

---

### 🔹 3. Select an Existing Workspace

```bash
terraform workspace select <workspace_name>
```

Example:

```bash
terraform workspace select prod
```

Switches to the `prod` workspace.

---

### 🔹 4. Show Current Workspace

```bash
terraform workspace show
```

Displays the name of the currently selected workspace.

---

### 🔹 5. Delete a Workspace

```bash
terraform workspace delete <workspace_name>
```

Example:

```bash
terraform workspace delete test
```

> ⚠️ You cannot delete the workspace you are currently using. Switch to another workspace before deleting.

---

## 🔧 Using Workspace in Terraform Code

You can refer to the current workspace in your `.tf` files using:

```hcl
terraform.workspace
```

### Example:

```hcl
resource "aws_s3_bucket" "example" {
  bucket = "my-bucket-${terraform.workspace}"
}
```

This will create separate S3 buckets like:

- `my-bucket-dev`
- `my-bucket-prod`

---

## 💡 Best Practices

- Use workspaces for environment separation only if **backend configuration** supports it.
- Consider using **separate directories or Terraform Cloud** for complex projects.
- Always **check your current workspace** before applying changes.

---

## 📂 Directory Structure Example

```bash
.
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```

---

## ✅ Steps to Use

```bash
# Initialize the Terraform project
terraform init

# Create a new workspace
terraform workspace new dev

# Apply infrastructure for this workspace
terraform apply

# Switch to another workspace
terraform workspace select prod

# Destroy infrastructure in a workspace
terraform destroy
```

---

## 📚 References

- [Terraform Workspaces Documentation](https://developer.hashicorp.com/terraform/language/state/workspaces)