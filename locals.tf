locals {
  ALL_INSTANCE_IDS = concat(aws_instance.od-instance.*.id, aws_spot_instance_request.sopt_instance.*.spot_instance_id)
  ALL_SPOT_IDS = aws_spot_instance_request.sopt_instance.*.id
  ALL_EBS_IDS = aws_spot_instance_request.sopt_instance.*.ebs_block_device
  ALL_TAGS_IDS =   concat(local.ALL_INSTANCE_IDS, local.ALL_SPOT_IDS)
  TAG_NAME = "${var.COMPONENT}-${var.ENV}"
  SPOT_VOLUME_ID = [for m in flatten(aws_spot_instance_request.sopt_instance.*.root_block_device) : m.volume_id]
}

output "EBS" {
  value = aws_instance.od-instance
}