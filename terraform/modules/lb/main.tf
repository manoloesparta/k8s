resource "aws_elb" "k8s_load_balancer" {
  name    = var.lb_name
  subnets = [var.subnet_id]

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  instances = var.instance_ids

  tags = {
    Name = var.lb_name
  }
}
