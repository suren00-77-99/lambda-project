resource "aws_apigatewayv2_api" "this" {
  name          = var.api_name
  protocol_type = var.protocol_type
  description   = var.description

  tags = {
    Name        = var.api_name
    Environment = var.environment
  }
}
