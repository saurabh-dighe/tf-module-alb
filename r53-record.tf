# resource "aws_route53_record" "abl" {
#   zone_id = data.terraform_remote_state.vpc.outputs.PRIVATE_HOSTEDZONE_ID
#   name    = "alb-${var.ENV}"
#   type    = "A"
#   ttl     = 10
#   records = [aws_spot_instance_request.rabbitmq.private_ip]
# }