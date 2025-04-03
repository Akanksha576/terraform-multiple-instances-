provider "aws" {
  region = "us-east-1"
}

variable "instances" {
  type = map(string)
  default = {
    "web1" = "t2.micro"
    "web2" = "t3.micro"
    "web3" = "t2.small"
  }
}

resource "aws_instance" "web" {
  for_each = var.instances

  ami           = "ami-08b5b3a93ed654d19"  # Replace with your valid AMI ID
  instance_type = each.value

  tags = {
    Name = each.key
  }
}

