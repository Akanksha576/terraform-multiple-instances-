variable "instances" {
  type = map(string)
  default = {
    "web1" = "t2.micro"
    "web2" = "t3.micro"
    "web3" = "t2.small"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  for_each = var.instances

  ami           = "ami-08b5b3a93ed654d19"  # Replace with your valid AMI ID
  instance_type = each.value

  tags = {
    Name = each.key
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  count = 3  # Creates 3 instances

  ami           = "ami-08b5b3a93ed654d19"   # Valid AMI ID
  instance_type = "t2.micro"                # Free-tier eligible

  tags = {
    Name = "Terraform-Instance-${count.index}"
  }
}

