# Shopping Application Image Builder – Packer + GitHub Actions

This project builds a **custom Amazon Machine Image (AMI)** using **Packer** and deploys a static shopping website using Apache. The entire AMI build is **automated through GitHub Actions**, using secure IAM credentials stored in GitHub Secrets.

---

## 🚀 Features

- Automated AMI creation using **Packer**
- Website auto-deployed to `/var/www/html`
- Apache + PHP installation scripted during provisioning
- Dynamic AMI names with timestamps
- GitHub Actions CI/CD pipeline
- Follows least-privilege IAM access
- Clean and modular folder structure

---

## 📁 Project Structure

```
shopping-application-image-builder-project/
│
├── packer/
│   ├── main.pkr.hcl          # Packer configuration
│   ├── variable.pkr.hcl      # Variables (region, instance type, AMI ID)
│   └── provision.sh          # Website provisioning
│
└── website/                  # Static website files
    ├── index.html
    ├── tooplate-eco-lume.css
    ├── tooplate-eco-scripts.js
    └── images/
```

---

## ⚙️ Packer Configuration

### **main.pkr.hcl**
- Uses `amazon-ebs` builder
- Installs Apache + PHP using provision.sh
- Copies website from GitHub repo → EC2 → `/tmp/website`

### **variable.pkr.hcl**
Defines:
- AWS region  
- AMI ID  
- Instance type  
- Project name & environment  
- Dynamic image name

### **provision.sh**
Installs Apache, deploys website, sets permissions.

---

## 🛠 GitHub Actions Workflow

Located in:

```
.github/workflows/image-build.yaml
```

Workflow performs:

1. Checkout repository  
2. Install Packer  
3. Init Terraform (optional)  
4. Packer build  
5. AMI is created in EC2 → AMIs section  

Secrets required:
- `access_key`
- `secrete_key`

---

## 🔐 IAM Requirements

Create an IAM user with least privilege:

- `AmazonEC2FullAccess`
- `AmazonVPCFullAccess`
- `IAMReadOnlyAccess`

Generate:
- Access Key  
- Secret Key  

Add these to GitHub → Settings → Secrets → Actions.

---

## 🖥 Generated AMI Name Example

```
zomato-production-2025-11-13-22-05
```

---

## 🧪 How the Pipeline Works

1. Developer pushes code / triggers workflow  
2. GitHub Actions checks out repository  
3. Packer starts EC2 instance  
4. Website folder is copied to `/tmp/website`  
5. Provision script installs & deploys Apache website  
6. AMI is created with correct tags & deleted build instance  
7. AMI becomes available for EC2 launch  

---

## 🎯 Outcome

A fully automated AMI image building pipeline that deploys a website and prepares ready-to-launch EC2 instances.

---

## 📬 Author

**Muhammed Fasil**  
DevOps & Cloud Engineer  
GitHub: https://github.com/Fasil-devo-coder

