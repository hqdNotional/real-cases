# Gitops on Docker Swarm with Portainer
On `Kubernetes`. We have `Flux` and `ArgoCD` for `gitops`, so how about `Docker Swarm`.

This is a demonstration `gitops` on `docker swarm` using `Portainer`
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

### 4. Install portainer
```
sh ./portainer.sh
```
Copy the real ip of node which is running `portainer-portainer` and access it in port `9000` like this: **IP:9000**

### 5. Destroy infrastructure
```
terraform destroy --auto-approve
```

