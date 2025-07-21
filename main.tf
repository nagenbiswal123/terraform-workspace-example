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


module "aws_instance" {
    source = "./modules/ec2_instance"
    ami = var.ami
    instance_type = var.instance_type
}

