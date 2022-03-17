terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.5"
        }
    }
    required_version = "~> 1.0"
}

provider "aws" {
    region = "eu-west-2"
    default_tags {
        tags = {
            "Owner" = "sergei_eremin@epam.com"
            "Project" = "TF Lesson2"
        }
    }
}

data "aws_ami" "amazon_linux" {
    most_recent = true
    filter {
        name = "name"
        values = [ "amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2" ]
    }
    owners = [ "amazon" ]
}

resource "aws_instance" "my_webserver" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my_webserver_sg.id]
    user_data = file("user_data.sh")
    tags = {
      "Name" = "WebServer homework lesson2"
    }
}

resource "aws_security_group" "my_webserver_sg" {
    name = "WebServer homework lesson2 Security Group"
    description = "WebServer homework lesson2 Security Group"
    tags = {
        "Name" = "WebServer homework lesson2 Security Group"
    }

    dynamic "ingress" {
        for_each = [ "22", "80" ]
        content {
            from_port = ingress.value
            to_port = ingress.value
            cidr_blocks = [ "0.0.0.0/0" ]
            protocol = "tcp"
    }
  }
 
    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = [ "0.0.0.0/0" ]
        protocol = "-1"
        }
}
