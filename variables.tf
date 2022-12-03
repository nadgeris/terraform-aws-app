variable "ami" {
  type        = string
  description = "Name of environment this VPC is targeting"
}

variable "instance" {
  type        = string
  description = "Name of environment this VPC is targeting"
}
variable "namespace" {
  type        = string
  description = "Name of environment this VPC is targeting"
}

variable "key" {
  type        = string
  description = "Name of environment this VPC is targeting"
}



variable "private_subnet_id" {
  type        = string
  description = "Name of environment this VPC is targeting"
}

variable "vpc_id" {
  type        = string
  description = "Name of environment this VPC is targeting"
}


variable "rds_endpoint" {
  type = string
  default = ""
  
}
variable "rds_password" {
  type = string
  default = ""
}

variable "app-name" {
  type = string
  default = ""
  
}