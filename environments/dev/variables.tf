variable "ami_id" {
  description = "AMI ID for the DEV EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for DEV"
  type        = string
  default     = "t3.micro"
}
