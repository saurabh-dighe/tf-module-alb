output "ALB_ARN" {
  value = aws_lb.alb.arn
}

output "ALB_ADDRESS" {
  value = aws_lb.alb.dns_name
}

output "PRIVATE_LISTENER_ARN" {
  value = aws_lb_listener.private-listener.*.arn
}

output "PUBLIC_LISTENER_ARN" {
  value = aws_lb_listener.public-listener.*.arn
}