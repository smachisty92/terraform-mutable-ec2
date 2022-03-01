locals {
  ALL_INSTANCE_IDS = concat(aws_instance.od-instance.*.id, aws_spot_instance_request.sopt_instance.*.id)
  TAG_NAME = "${var.COMPONENT}-${var.ENV}"
}