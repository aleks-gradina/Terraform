resource "aws_security_group" "this" {
  name        = var.security_group_name
  description = "Allow traffic to ${var.environment} environment"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow traffic to HTTP port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidrs
  }

  ingress {
    description = "Allow traffic to HTTPS port"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name        = "${var.environment} environment"
    CreatedBy   = var.createdby
    Environment = var.environment
  }
}