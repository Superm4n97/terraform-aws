# terraform-aws
Tutorials of AWS resource creation using Terraform

## Install Terraform
You can install Terraform form [here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli). For ubuntu operating system you can use the following commands:
```shell
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install terraform
```

## Run
```shell
export AWS_SECRET_ACCESS_KEY="yoursecretaccesskey"
export AWS_ACCESS_KEY_ID="youraccesskeyid"
terraform init
terraform apply
```
