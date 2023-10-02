terraform {
  required_providers {
    # docker = {
    #   source  = "kreuzwerker/docker"
    #   version = "~> 3.0.1"
    # }
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-east-2"
}
resource "aws_instance" "app_server" {
  ami = "ami-05803413c51f242b7"
  instance_type = "t2.micro"
  tags = {
    Name = "ZameerApp"
  }
  
}

