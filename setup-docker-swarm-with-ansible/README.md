# Setup docker swarm using ansible
This is a demonstration of using terraform to setup docker swarm using ansible

## 1. Prerequisites
* A `GCP` account.
* [ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
* [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## 2. Let's go
### 1. Configure environment variable
Please replace with your `projectId` and `ssh_key` from output to `inventory`
```
export TF_VAR_projectId=$projectId
export TF_VAR_ssh_key=$ssh_key
```

### 2. Initialize infrastructure

```
terraform init
```

```
terraform apply --auto-approve
```

### 3. Execute ansible
Please replace with your `real ip` from output to `inventory`
```
sh ./ansible.sh
```

### 4. Destroy infrastructure
```
terraform destroy --auto-approve
```

