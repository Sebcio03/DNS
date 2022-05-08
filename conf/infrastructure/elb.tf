resource "aws_lb" "backend" {
  name               = "dns-backend"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  subnets            = [aws_subnet.public.id, aws_subnet.public2.id]
}

resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_lb.backend.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend-green.arn
  }
}

resource "aws_lb_target_group" "backend-blue" {
  name     = "dns-backend-blue"
  port     = 80
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = aws_vpc.default.id
  

  health_check {
    port     = 80
    path     = "/"
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group" "backend-green" {
  name     = "dns-backend-green"
  port     = 80
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = aws_vpc.default.id
  

  health_check {
    port     = 80
    path     = "/"
    protocol = "HTTP"
  }
}