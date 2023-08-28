terraform {
  required_providers {
    # docker = {
    #   source  = "kreuzwerker/docker"
    #   version = "~> 3.0.1"
    # }
    aws = {
      source = "hashicorp/aws"
      version = "-> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-west-2"
}
resource "aws_instance" "app_server" {
  ami = "ami-83c94e3"
  instance_type = "t2.micro"
  tags = {
    Name = "ZameerApp"
  }
  
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  ports {
    internal = 80
    external = 8000
  }
}
