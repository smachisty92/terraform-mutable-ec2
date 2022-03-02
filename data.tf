data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "base-with-ansible" #AMI which was saved and which has ansible installed
  owners           = ["self"]
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform62"
    key = "mutable/vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}