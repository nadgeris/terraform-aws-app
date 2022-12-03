# Security Group
resource "aws_security_group" "polarity_sg" {
  vpc_id       = var.vpc_id
  name = "${format("%s-%s-sg", var.namespace, var.app-name)}"
  description  = "Polarity Instance Security Group"
  
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  
    ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 443
    to_port = 443
    protocol = "tcp"
  }
    ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 5000
    to_port = 5000
    protocol = "tcp"
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(
    {
      Name        = "app-sg"
      Terraform   = "true"
    }
  )
}

data "template_file" "user_data" {
  template = file("${path.module}/files/userdata.sh")
  vars = {
    hostname        = "${format("%s-%s", var.namespace, var.app-name)}"
    rds_endpoint    = var.rds_endpoint
    rds_password    = var.rds_password
      }
}
resource "aws_instance" "polarity" {
  ami           = var.ami
  user_data = data.template_file.user_data.rendered
  instance_type = var.instance
  iam_instance_profile = "cloudwatchmetricsrole"
  key_name = var.key
  vpc_security_group_ids = [ aws_security_group.polarity_sg.id ]
  subnet_id = var.private_subnet_id
  root_block_device {
    volume_size = 200
    volume_type = "gp3"
      tags = {
        Name        = "${format("%s-%s", var.namespace, var.app-name)}"    
        Terraform   = "true"        
      }
  }
  tags = {
    Name        = "${format("%s-%s", var.namespace, var.app-name)}"
    Terraform   = "true"
  }
}