provider "aws" {
    region = "ap-south-1"
}


variable "ami" {
    description = "Value of the instance AMI ID, ex:- AMI-34343523 "
    type = string
}


variable "instance_type" {
    description = "Valeu of the instance type, ex;- t2.micro"
}

resource "aws_instance" "example1" {
    ami = var.ami
    instance_type = var.instance_type

    tags = {
      Name = "demo-server1"
    }
}