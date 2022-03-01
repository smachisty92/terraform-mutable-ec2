resource "aws_lb_target_group" "test" {
  name = "${var.COMPONENT}=${var.ENV}"
  port = 80
  protocol = "HTTP"
}