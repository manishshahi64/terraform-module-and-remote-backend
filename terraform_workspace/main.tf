provider "aws" {
  region = "us-east-1"
}
variable "ami_value" {
  description = "The value of ec2 ami"
}
variable "subnet_id_value" {
  description = "The value of the subnet id"
}
variable "instance_type_value" {
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.large"
  }
}
module "ec2_instance" {
  source = "../modules/ec2_instance"
  ami_value = var.ami_value
  subnet_id_value = var.subnet_id_value
  instance_type_value = lookup(var.instance_type_value,terraform.workspace, "t2.micro")
}