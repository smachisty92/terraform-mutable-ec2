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


resource "aws_ec2_tag" "aws_ec2_tag" {
  count = length(local.ALL_TAGS_IDS)
  resource_id = local.ALL_TAGS_IDS[count.index]
  key         = "Name"
  value       = local.TAG_NAME
}

#resource "aws_ec2_tag" "aws_monitor_tag" {
#  resource_id = aws_spot_instance_request.cheap_worker.spot_instance_id
#  key         = "MONITOR"
#  value       = var.COMPONENT["monitor"]
#}
