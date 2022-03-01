

module "tags" {
  count = length(local.ALL_TAGS)
  source = "git::https://github.com/smachisty92/terraform-tags"
  TAG_NAME = lookup(element(local.ALL_TAGS,count.index), "name")
  TAG_VALUE= lookup(element(local.ALL_TAGS,count.index), "value")
  RESOURCE_ID = local.ALL_TAGS_IDS
}
locals {
  ALL_TAGS= [
    {
      name = "Name"
      value = "${var.COMPONENT}-${var.ENV}"
    },
    {
      name = "env"
      value = var.ENV
    },
    {
      name = "component"
      value = var.COMPONENT
    }
  ]
}
#resource "aws_ec2_tag" "aws_monitor_tag" {
#  resource_id = aws_spot_instance_request.cheap_worker.spot_instance_id
#  key         = "MONITOR"
#  value       = var.COMPONENT["monitor"]
#}
