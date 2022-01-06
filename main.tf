# Let Terraform know who is our cloud provider

# AWS plugins/dependencies will be downloded 
provider "aws" {
    region = "eu-west-1"
    # This will allow terraform to create services on eu-west-1
  
}
# Let's start with launching an ec2 insance using terrafrom script
resource "aws_instance" "app_instance" {
 # add the ami id for 18.04LTS
  ami =    var.app_ami_id
  
  # choose t2 micro
  instance_type = "t2.micro"
  
  # Enable IP as it's our app instance
  associate_public_ip_address = true
  
  # add tags for Name
  tags = {
      Name = var.name
  }
  key_name = var.aws_key_name
  # ensure that we have this key in .ssh folder
}
# to initialise we use terraform init
# terrafrom plan
# terrafrom apply 
# terraform destroy
# Let's create our VPC
resource "aws_vpc" "eng99_terraform_vpc" {
  cidr_block       = var.cidr_block 
  #"10.0.0.0/16"
  instance_tenancy = "default"
  
  tags = {
    Name = var.vpc_name
  }
} 
# apply DRY  do not repeat yourself





