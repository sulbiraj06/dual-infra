#in this template we are creating aws application laadbalancer and target group and alb http listener

resource "aws_alb" "alb" {
  name           = "ConceptOne-${var.env}-LoadBalancer"
  subnets        =  var.subnets
  #subnets        = aws_subnet.tf_public_subnet.*.id
  security_groups = [var.security_groups]
  #security_groups = [aws_security_group.alb-sg.id]
}

resource "aws_alb_target_group" "app-tg" {
  name        = "${var.env}-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id
  #vpc_id      = aws_vpc.tf_vpc.id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    protocol            = "HTTP"
    matcher             = "200"
    path                = var.health_check_path
    interval            = 30
  }
}

#redirecting all incomming traffic from ALB to the target group
resource "aws_alb_listener" "testapp" {
  load_balancer_arn = aws_alb.alb.id
  port              = var.app_port
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  #enable above 2 if you are using HTTPS listner and change protocal from HTTP to HTTPS
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.app-tg.arn
  }
}

#Register Targets to Target Group
resource "aws_alb_target_group_attachment" "tg-register" {
  count             = length(var.target_id)
  target_group_arn  = aws_alb_target_group.app-tg.arn
  #target_id         = var.target_id
  target_id         = element(var.target_id,count.index)
  #target_id         = aws_instance.tf_ec2-private-instances.id
}


