terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

resource "aws_vpc" "Database" {
  cidr_block = var.ips.cidr_range
  tags = var.tag_name
}

resource "aws_subnet" "Database" {
  vpc_id = aws_vpc.Database.id
  cidr_block = var.ips.subnets[0]
  tags = var.tag_name
}

resource "aws_subnet" "Database2" {
  vpc_id = aws_vpc.Database.id
  cidr_block = var.ips.subnets[1]
  tags = var.tag_name
}


resource "aws_internet_gateway" "Database" {
  vpc_id = aws_vpc.Database.id
  tags = var.tag_name
}

resource "aws_route" "internetGatewayAssociation" {
  route_table_id = aws_vpc.Database.default_route_table_id
  destination_cidr_block = var.ips.allow_all
  gateway_id = aws_internet_gateway.Database.id
}

resource "aws_instance" "Database" {
  subnet_id = aws_subnet.Database.id
  ami = var.instance.ami
  instance_type = var.instance.type
}
