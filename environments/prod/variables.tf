variable "ami_id" {
  description = "AMI ID for the PROD EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for PROD"
  type        = string
  default     = "t3.micro"
}
