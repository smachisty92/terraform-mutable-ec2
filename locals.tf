locals {
  ALL_INSTANCE_IDS = concat(aws_instance.od-instance.*.id, aws_spot_instance_request.sopt_instance.*.spot_instance_id)
  ALL_INSTANCE_IPS = concat(aws_instance.od-instance.*.private_ip, aws_spot_instance_request.sopt_instance.*.private_ip)
  ALL_OD_INSTANCE_IDS = aws_instance.od-instance.*.id
  ALL_SPOT_INSTANCE_IDS     = aws_spot_instance_request.sopt_instance.*.spot_instance_id
  ALL_EBS_IDS      = aws_spot_instance_request.sopt_instance.*.ebs_block_device
  ALL_TAGS_IDS     = concat(local.ALL_OD_INSTANCE_IDS, local.ALL_SPOT_INSTANCE_IDS, local.ALL_VOLUMN_ID)
  TAG_NAME         = "${var.COMPONENT}-${var.ENV}"
  SPOT_VOLUME_ID   = [for m in flatten(aws_spot_instance_request.sopt_instance.*.root_block_device) : m.volume_id]
  OD_VOLUME_ID     = [for m in flatten(aws_instance.od-instance.*.root_block_device) : m.volume_id]
  ALL_VOLUMN_ID    = concat(local.SPOT_VOLUME_ID, local.OD_VOLUME_ID)
}


output "ALL_TAG_IDS" {
  value = local.ALL_TAGS_IDS
}
