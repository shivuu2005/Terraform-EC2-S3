
---

### ✅ `README.md`

```markdown
# Terraform EC2 and S3 Deployment

This repository contains Terraform code to create an AWS EC2 instance and an S3 bucket using modular structure. The deployment is automated using GitHub Actions. This README explains how to set up, configure, and run the project, including how to authenticate with GitHub using a Personal Access Token (PAT) or SSH.

---

## 📂 Project Structure

```

terraform-ec2-s3/
├── .github/
│   └── workflows/
│       └── deploy.yml            # GitHub Actions workflow file
├── modules/
│   ├── ec2/
│   │   ├── main.tf               # EC2 resource definition
│   │   ├── variables.tf          # EC2 variables
│   │   └── outputs.tf            # EC2 outputs
│   └── s3/
│       ├── main.tf               # S3 resource definition
│       ├── variables.tf          # S3 variables
│       └── outputs.tf            # S3 outputs
├── providers.tf                  # AWS provider configuration
├── main.tf                       # Module calls
├── outputs.tf                    # Outputs of modules
├── variables.tf                  # Input variables
└── README.md                     # This file

````

---

## ⚙ Prerequisites

1. **Terraform installed** on your local system. Follow [Terraform Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli).
2. **AWS account** with programmatic access (Access Key ID & Secret Access Key).
3. **Git installed** on your local machine.
4. **GitHub account** to push code and configure workflows.

---

## 📥 Setup Instructions

### ✅ Step 1 - Clone the repository

```bash
git clone https://github.com/shivuu2005/Terraform-EC2-S3.git
cd Terraform-EC2-S3
````

### ✅ Step 2 - Setup AWS Credentials

You have two options:

---

### 🔑 Option A – Use Environment Variables in GitHub Secrets

1. Go to your GitHub repository → Settings → Secrets and variables → Actions.
2. Create the following secrets:

   * `AWS_ACCESS_KEY_ID` – Your AWS Access Key ID
   * `AWS_SECRET_ACCESS_KEY` – Your AWS Secret Access Key

These will be automatically used by Terraform during the GitHub Actions workflow.

---

### 🔑 Option B – Use SSH for Git Authentication

1. Generate an SSH key:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

2. Add the public key (`~/.ssh/id_ed25519.pub`) to GitHub → Settings → SSH and GPG Keys → New SSH key.
3. Update the remote URL to use SSH:

```bash
git remote set-url origin git@github.com:shivuu2005/Terraform-EC2-S3.git
```

---

### ✅ Step 3 – Configure Git on Local Machine

Set your username and email:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

If upstream branch is not set, run:

```bash
git branch --set-upstream-to=origin/master master
```

Configure pull behavior:

```bash
git config pull.rebase false
```

---

### ✅ Step 4 – Pull Latest Changes

```bash
git pull
```

Resolve any merge conflicts if prompted.

---

### ✅ Step 5 – Make Changes and Push

```bash
git add .
git commit -m "Your message"
git push origin master
```

If using PAT, when prompted for password, paste your token instead of your GitHub password.

---

## 🚀 How to Run Terraform Locally

1. Initialize the Terraform working directory:

```bash
terraform init
```

2. See the planned infrastructure changes:

```bash
terraform plan
```

3. Apply the changes:

```bash
terraform apply
```

Terraform will create the EC2 instance and S3 bucket as defined in the modules.

---

## 🟢 How GitHub Actions Work

The workflow `deploy.yml` will:

* Checkout the code
* Setup Terraform
* Initialize, plan, and apply the infrastructure automatically on every push to `main`.

Make sure that AWS credentials are set up as GitHub secrets.

---

## ⚙ Common Issues

### ❌ `Password authentication is not supported for Git operations.`

GitHub has disabled password authentication. You must use a **Personal Access Token (PAT)** instead of a password.

Create one here: [https://github.com/settings/tokens](https://github.com/settings/tokens)

### ❌ `divergent branches` when running `git pull`

Run this before pulling:

```bash
git config pull.rebase false
```

Then execute:

```bash
git pull
```

---

## 📌 Best Practices

* Always pull latest changes before making commits.
* Use environment variables for sensitive information.
* Avoid force pushing unless you are certain about overwriting remote changes.
* Use SSH for more secure Git operations.

---

## 📚 Resources

* [Terraform Documentation](https://registry.terraform.io/)
* [GitHub Actions Documentation](https://docs.github.com/en/actions)
* [AWS CLI Configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
* [GitHub Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)

---

## 📩 Contact

For any issues or questions, feel free to create a GitHub issue or contact the repository maintainer.

Happy Terraforming! 🚀

```

---


