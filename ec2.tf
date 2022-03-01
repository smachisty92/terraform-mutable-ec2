resource "aws_instance" "od-instance" {
  count         = var.OD_INSTANCE_COUNT
  instance_type = var.OD_INSTANCE_TYPE
  ami           = data.aws_ami.ami.id
}

resource "aws_spot_instance_request" "sopt_instance" {
  count = var.SPOT_INSTANCE_COUNT
  ami                    = data.aws_ami.ami.id
  instance_type          = var.SPOT_INSTANCE_TYPE
  wait_for_fulfillment   = true

}


