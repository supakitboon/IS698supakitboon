
provider "aws" {
  region = "us-east-2"
}

variable "instances" {
  type = map
  default = {
    "web1" = "t2.micro"
    "web2" = "t3.micro"
    "web3" = "t2.small"
  }
}

resource "aws_instance" "web" {
  for_each = var.instances

  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 for us-east-2
  instance_type = each.value

  tags = {
    Name = each.key
  }
}

