provider "aws" {
  region = "us-east-1"

}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}


terraform {
  cloud {
    organization = "gfgbatchnine"

    workspaces {
      name = "gfgwsbatchnone"
    }
  }
}

variable "AWS_SECRET_ACCESS_KEY" {
}
variable "AWS_ACCESS_KEY_ID" {
}

# resource "aws_instance" "web1" {
#   #   ami           = var.ami_id
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type

#   tags = {
#     Name = "HelloWorld"
#   }
# }

# output "instance_ip_addrweb" {
#   value = aws_instance.web.private_ip
# }

# output "instance_ip_addrweb1" {
#   value = aws_instance.web1.private_ip
# }

# # data "aws_ami" "ubuntu" {
# #     most_recent = true
# #   filter {
# #     name   = "name"
# #     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-22.04-amd64-server-*"]
# #   }
# # }

# data "aws_ami" "ubuntu" {

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
#   }
# }

# variable "ami_id" {
#   type    = string
#   default = "ami-053b0d53c279acc90"
# }

# variable "instance_type" {
#   type    = string
#   default = "t2.micro"
# }


variable "bucket" {
  type = string
  default="my-tf-test-bucketzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket
  tags = {
    Name        = "My terraform bucket"
    Environment = "Dev"
  }
}
