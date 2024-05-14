#Provisions ALB
resource "aws_lb" "alb" {
  name               = "roboshop-${var.ENV}-${var.ALB_NAME}"
  internal           = var.INTERNAL
  load_balancer_type = "application"
  security_groups    = var.INTERNAL? aws_security_group.allow_private.*.id : aws_security_group.allow_public.*.id
  subnets            = var.INTERNAL? data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_ID : data.terraform_remote_state.vpc.outputs.PUBLIC_SUBNET_ID

  enable_deletion_protection = false

  tags = {
    Environment = "${var.ALB_NAME}"
  }
}