variable "name" {
  default     = "Default"
  type        = string
  description = "Name of the VPC"
}

variable "environment" {
  type        = string
  description = "Name of environment this VPC is targeting"
}

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

variable "alb_arn" {
  type        = string
  description = "Name of environment this VPC is targeting"
}

variable "tenantid" {
  type        = string
  description = "Name of environment this VPC is targeting"
}

variable "customer" {
  type        = string
  description = "Name of environment this VPC is targeting"
}
variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the VPC resources"
}

variable "private_subnet_id" {
  type        = string
  description = "Name of environment this VPC is targeting"
}

variable "vpc_id" {
  type        = string
  description = "Name of environment this VPC is targeting"
}

variable "prod_name" {
  type        = string
  description = "Name of environment this VPC is targeting"
}

variable "alb_dns" {
  type        = string
  description = "DNS name of the ALB"
}

variable "listener_arn" {
  type        = string
  description = "ARN of the listener"
}

variable "zone_id" {
  type        = string
  description = "ARN of the listener"
}

variable "zone" {
  type        = string
  description = "ARN of the listener"
}