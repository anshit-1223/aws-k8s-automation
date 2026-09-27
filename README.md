# 🚀 AWS Kubernetes Automation

> ⚙️ Automating AWS infrastructure provisioning and Kubernetes cluster setup using **Terraform**, **Ansible**, and **kubeadm**.

---

## 📌 Project Overview

This project focuses on automating the process of:

🔹 ☁️ Provisioning AWS infrastructure using **Terraform**  
🔹 🖥️ Creating EC2 instances for Kubernetes nodes  
🔹 ⚙️ Configuring Kubernetes nodes using **Ansible**  
🔹 ☸️ Initializing the Kubernetes cluster using **kubeadm**  
🔹 🔗 Joining worker nodes to the Kubernetes cluster  

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| ☁️ AWS | Cloud Infrastructure |
| 🏗️ Terraform | Infrastructure Provisioning |
| ⚙️ Ansible | Configuration Management |
| ☸️ Kubernetes | Container Orchestration |
| 🔧 kubeadm | Kubernetes Cluster Initialization |
| 🖥️ EC2 | Compute Instances |

---

## 🏗️ Architecture

                  ☁️ AWS Cloud
                       │
                🏗️ Terraform
                       │
          ┌────────────┴────────────┐
          │                         │
     🖥️ Control Plane          🖥️ Worker Nodes
          │                         │
          │                     ⚙️ Ansible
          │                         │
          └────────── ☸️ ───────────┘
                   kubeadm
                       │
                Kubernetes Cluster


🔄 Workflow

Terraform
    ↓
☁️ AWS Infrastructure
    ↓
🖥️ EC2 Instances
    ↓
Ansible Configuration
    ↓
☸️ Kubernetes Setup
    ↓
🔧 kubeadm init
    ↓
🔗 Worker Node Join
    ↓
🚀 Kubernetes Cluster


##NEED TO CHANGE BEFORE RUNNING TERRAFORM AND ANSIBLE

1.Create public key on your system.
In key-pair.tf file change the publickey file path.

2.Create the ansible host inventory.
Copy the ssh id to the instances before running playbook.

🚧 Project Status 

🟡 In Progress

This project is currently under development. Deployment and further automation will be added progressively.


👨‍💻 Author

Anshit Verma
