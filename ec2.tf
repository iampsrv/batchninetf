
# resource "aws_instance" "web" {
#   ami           = "ami-053b0d53c279acc90" #var.ami_id
#   instance_type = "t2.micro" #var.instance_type

#   tags = {
#     Name = "HelloWorld"
#   }
# }

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

resource "aws_instance" "myec2" {
  ami                         = var.ami_id_ec2
  instance_type               = var.instance_type_ec2
  subnet_id                   = aws_subnet.mypublicsubnet1.id
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.mysg.id]
  user_data              = file("start.sh")

  tags = {
    Name = "myec2-teraformcloud1"
  }
}

resource "aws_instance" "web" {
  ami                         = var.ami_id_ec2
  instance_type               = var.instance_type_ec2
  subnet_id                   = aws_subnet.mypublicsubnet2.id
  vpc_security_group_ids = [aws_security_group.mysg.id]
  associate_public_ip_address = true
  user_data                   = file("start.sh")
  tags = {
    Name = "myec2-teraformcloud2"
  }
}

variable "ami_id_ec2" {
  type    = string
  default = "ami-053b0d53c279acc90"

}

variable "instance_type_ec2" {
  type    = string
  default = "t2.micro"

}