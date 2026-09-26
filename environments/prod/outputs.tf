output "instance_id" {
  description = "PROD EC2 instance ID"
  value       = module.ec2.instance_id
}

output "public_ip" {
  description = "PROD EC2 public IP"
  value       = module.ec2.public_ip
}

output "private_ip" {
  description = "PROD EC2 private IP"
  value       = module.ec2.private_ip
}
