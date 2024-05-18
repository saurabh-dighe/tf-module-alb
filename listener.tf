resource "aws_lb_listener" "private-listener" {
  count             = var.INTERNAL? 1 : 0
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
  tags = {
    Name = "Roboshop-${var.ENV}-listner"
  }
}

resource "aws_lb_listener" "public-listener" {
  count             = var.INTERNAL? 0 : 1
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
  tags = {
    Name = "Roboshop-${var.ENV}-listner"
  }
}

