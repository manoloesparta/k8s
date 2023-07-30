resource "aws_lb" "load_balancer" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "network"
  subnets            = [var.subnet_id]
}

resource "aws_lb_target_group" "target_group" {
  name     = "k8s-nodes-target-group"
  port     = 6443
  protocol = "TCP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = 443
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}
