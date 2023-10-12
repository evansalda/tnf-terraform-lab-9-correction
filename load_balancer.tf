resource "aws_lb" "serveur_web" {
  name               = local.elb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  subnets            = [data.aws_subnet.public_1.id, data.aws_subnet.public_2.id]
}

resource "aws_lb_target_group" "serveur_web" {
  name     = local.elb_tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.vpc.id
}

resource "aws_lb_target_group_attachment" "serveur_web" {
  target_group_arn = aws_lb_target_group.serveur_web.arn
  target_id        = aws_instance.serveur_web.id
  port             = 80
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.serveur_web.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.serveur_web.arn
  }
}