provider "aws" {
 region = "us-east-1"
}
module "ec2_instance" {
 source = "./modules/ec2_instance"
 ami_value = "ami-00beae93a2d981137"
 instance_type_value = "t2.micro"
 subnet_id_value = "subnet-04403b0f2f5c02622"
}
module "s3_bucket" {
 source = "./modules/s3_bucket"
}