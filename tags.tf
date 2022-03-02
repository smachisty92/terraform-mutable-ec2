

module "tags" {
  depends_on = [aws_instance.od-instance, aws_spot_instance_request.sopt_instance]
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
    },
    {
      name = "project_name"
      value = "roboshop"
    }
  ]
}
