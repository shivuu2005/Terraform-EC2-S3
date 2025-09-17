
---

```markdown
# Terraform EC2 and S3 Deployment

This repository contains Terraform code to create an AWS EC2 instance and an S3 bucket using a modular structure. The infrastructure deployment is automated using GitHub Actions, and proper authentication using AWS credentials and GitHub Personal Access Token (PAT) or SSH is explained.

---

## ✅ Project Structure

```

terraform-ec2-s3/
├── .github/
│   └── workflows/
│       └── deploy.yml            # GitHub Actions workflow file
├── modules/
│   ├── ec2/
│   │   ├── main.tf               # EC2 instance configuration
│   │   ├── variables.tf          # EC2 input variables
│   │   └── outputs.tf            # EC2 output values
│   └── s3/
│       ├── main.tf               # S3 bucket configuration
│       ├── variables.tf          # S3 input variables
│       └── outputs.tf            # S3 output values
├── main.tf                       # Root module configuration
├── outputs.tf                    # Output definitions
├── providers.tf                  # AWS provider configuration
├── variables.tf                  # Input variables for root module
└── README.md                     # Project documentation

````

---

## ✅ Prerequisites

1. Terraform installed – [Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
2. AWS account with programmatic access – [AWS IAM User Guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)
3. Git installed – [Git Setup](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
4. GitHub account – [Sign Up](https://github.com/join)

---

## ✅ Setup Instructions

### Step 1 – Clone the Repository

```bash
git clone https://github.com/shivuu2005/Terraform-EC2-S3.git
cd Terraform-EC2-S3
````

---

### Step 2 – Configure Git

Set your name and email:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Set upstream branch to track remote:

```bash
git branch --set-upstream-to=origin/master master
```

Set pull behavior to merge:

```bash
git config pull.rebase false
```

---

### Step 3 – Handle Remote Changes

If you see this error while pushing:

```
Updates were rejected because the remote contains work that you do not have locally.
```

Run:

```bash
git pull
```

Resolve merge conflicts if prompted, then:

```bash
git add .
git commit -m "resolve conflicts"
git push origin master
```

---

### Step 4 – Set Up AWS Credentials

You can authenticate Terraform in two ways:

---

#### ✅ Option A – Use GitHub Secrets (Recommended)

1. Go to **GitHub → Settings → Secrets and variables → Actions**.
2. Add the following secrets:

   * `AWS_ACCESS_KEY_ID`: Your AWS Access Key ID
   * `AWS_SECRET_ACCESS_KEY`: Your AWS Secret Access Key

The workflow will automatically use these credentials.

---

#### ✅ Option B – Use AWS CLI Locally

1. Install AWS CLI – [AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
2. Configure the credentials:

```bash
aws configure
```

Enter:

* Access Key ID
* Secret Access Key
* Region
* Output format (e.g. json)

This will store credentials in `~/.aws/credentials` file.

---

### Step 5 – Use SSH for GitHub Authentication (Optional but Secure)

1. Generate SSH key:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

2. Add public key (`~/.ssh/id_ed25519.pub`) to GitHub → Settings → SSH and GPG keys → New SSH key.

3. Change remote URL:

```bash
git remote set-url origin git@github.com:shivuu2005/Terraform-EC2-S3.git
```

---

### Step 6 – Run Terraform Locally

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

---

## ✅ GitHub Actions Workflow Explained

The file `.github/workflows/deploy.yml`:

```yaml
name: Terraform Deployment

on:
  push:
    branches:
      - main

jobs:
  terraform:
    name: 'Terraform Apply'
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v2

      - name: Terraform Init
        run: terraform init

      - name: Terraform Plan
        run: terraform plan

      - name: Terraform Apply
        run: terraform apply -auto-approve
```

This workflow triggers whenever code is pushed to `main`. It sets up Terraform, initializes, plans, and applies the infrastructure automatically.

---

## ⚙ Authentication Errors You May Encounter

### ❌ `Password authentication is not supported for Git operations.`

GitHub has disabled password authentication. Use one of the following:

* **Personal Access Token (PAT)**: [Create Token](https://github.com/settings/tokens)
* **SSH authentication**

---

### ❌ `no valid credential sources for Terraform AWS Provider found.`

Ensure your AWS credentials are:

* Configured via environment variables (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`) in GitHub secrets or your local shell.
* Or configured using the AWS CLI.

Check credentials by running:

```bash
aws sts get-caller-identity
```

---

### ❌ `divergent branches` error on `git pull`

Run this first to set pull behavior:

```bash
git config pull.rebase false
```

Then pull:

```bash
git pull
```

---

## ✅ Best Practices

✔ Use GitHub Secrets for AWS credentials
✔ Use SSH keys for Git authentication instead of passwords
✔ Pull remote changes before making local commits
✔ Resolve merge conflicts carefully
✔ Avoid force pushing unless absolutely necessary

---

## 📚 Useful Links

* [Terraform Docs](https://registry.terraform.io/)
* [AWS IAM Users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)
* [GitHub Actions](https://docs.github.com/en/actions)
* [GitHub Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)

---

## 📩 Support

If you encounter any issues, create an issue in this repository or contact the maintainer.

Happy Infrastructure as Code! 🚀

```

---


```
