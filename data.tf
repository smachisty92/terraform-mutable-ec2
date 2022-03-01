data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "base-with-ansible" #AMI which was saved and which has ansible installed
  owners           = ["self"]
}