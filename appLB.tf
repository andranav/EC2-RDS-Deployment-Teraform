resource "aws_elb" "app-lb" {
  name = "dev-app-elb"
  internal = false
  instances = [aws_instance.app1.id, aws_instance.app2.id]
  subnets = [aws_subnet.dev-public-subnet-1.id, aws_subnet.dev-public-subnet-2.id]
  security_groups = [aws_security_group.dev-app-sec-group.id]
  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400

  listener {
    instance_port = var.app_port
    instance_protocol = "tcp"
    lb_port = var.app_port
    lb_protocol = "tcp"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "TCP:${var.app_port}"
    interval = 30
  }
}

output "elb_endpoint" {
  value = aws_elb.app-lb.dns_name
}