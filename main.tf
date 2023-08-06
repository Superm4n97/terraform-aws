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
  region = "us-east-1"
}

resource "aws_vpc" "Database" {
  cidr_block = "10.2.0.0/16"
  tags = {
    Name = "Database"
  }
}

resource "aws_subnet" "Database" {
  vpc_id = aws_vpc.Database.id
  cidr_block = "10.2.0.0/24"
  tags = {
    Name = "Database"
  }
}

resource "aws_internet_gateway" "Database" {
  vpc_id = aws_vpc.Database.id
  tags = {
    Name = "Database"
  }
}

resource "aws_route" "internetGatewayAssociation" {
  route_table_id = aws_vpc.Database.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.Database.id
}

resource "aws_instance" "Database" {
  subnet_id = aws_subnet.Database.id
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.large"
}
