variable "aws_version" {
  type = string
  description = "terraform aws provider version, if you change this version use terraform init."
}

variable "region" {
  type = string
  description = "the aws region where all resource are going to be created."
}

variable "tag_name" {
  type = object({
    Name = string
  })
} 

variable "ips" {
  type = object({
    allow_all = string
    cidr_range = string
    subnets = list(string)
  })
}

variable "instance" {
  type = object({
    type = string
    ami = string
  })
}