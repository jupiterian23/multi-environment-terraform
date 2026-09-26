data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "default" {
  vpc_id = data.aws_vpc.default.id

  filter {
    name   = "availability-zone"
    values = ["ap-south-1a"]
  }

  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id

  filter {
    name   = "group-name"
    values = ["default"]
  }
}

module "ec2" {
  source = "../../modules/ec2"

  environment       = "prod"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = data.aws_subnet.default.id
  security_group_id = data.aws_security_group.default.id
  instance_name     = "prod-terraform-server"
}
