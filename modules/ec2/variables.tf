variable "ami" {
  description = "AMI ID"
  type= string
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
}

variable "name" {
  description = "Name tag for the instance"
  type        = string
}
