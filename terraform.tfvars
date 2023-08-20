aws_version = "~> 5.0"

region = "us-east-1"

tag_name = {
  Name = "dev"
}

ips = {
  allow_all = "0.0.0.0/0"
  cidr_range = "10.3.0.0/16"
  subnets = ["10.3.0.0/24","10.3.1.0/24","10.3.2.0/24"]
}

instance = {
  type = "t2.large"
  ami = "ami-053b0d53c279acc90"
}