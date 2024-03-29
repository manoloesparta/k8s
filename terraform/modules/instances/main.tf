locals {
  controller_node_names = ["cartman", "kenny", "butters"]
  worker_node_names     = ["melchor", "gaspar", "baltazar"]
}

resource "aws_security_group" "security_group" {
  vpc_id = var.vpc_id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }
}

resource "aws_key_pair" "instance_key" {
  key_name   = "instace-key"
  public_key = templatefile("${path.module}/key.pub", {})
}

resource "aws_instance" "worker_nodes" {
  ami           = var.instance_ami
  instance_type = var.instance_shape
  key_name      = aws_key_pair.instance_key.key_name

  count = 3

  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.security_group.id]
  associate_public_ip_address = true
  private_ip                  = "10.0.1.1${count.index}"

  user_data = templatefile("${path.module}/user-data.sh", {})

  tags = {
    Name = "${local.worker_node_names[count.index]}"
  }
}

resource "aws_instance" "controller_nodes" {
  ami           = var.instance_ami
  instance_type = var.instance_shape
  key_name      = aws_key_pair.instance_key.key_name

  count = 3

  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.security_group.id]
  associate_public_ip_address = true
  private_ip                  = "10.0.1.2${count.index}"

  user_data = templatefile("${path.module}/user-data.sh", {})

  tags = {
    Name = "${local.controller_node_names[count.index]}"
  }
}
