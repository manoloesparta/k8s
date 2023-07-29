resource "aws_elb" "k8s_load_balancer" {
  name    = var.lb_name
  subnets = [var.subnet_id]

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  instances = var.instance_ids

  tags = {
    Name = var.lb_name
  }
}
