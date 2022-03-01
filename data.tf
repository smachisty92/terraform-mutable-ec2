data "aws_ami" "ami" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "base-with-ansible" #AMI which was saved and which has ansible installed
  owners           = ["self"]
}