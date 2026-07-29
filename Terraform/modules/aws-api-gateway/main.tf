resource "aws_apigatewayv2_api" "employee_api" {
  name = "${var.project_name}-${var.environment}-api"
  protocol_type = "HTTP"

}

resource "aws_apigatewayv2_integration" "lambda" {
  api_id = aws_apigatewayv2_api.employee_api.id
  integration_type = "AWS_PROXY"
  integration_uri = var.lambda_invoke_arn
  integration_method = "POST"
  payload_format_version = "2.0"

}

resource "aws_apigatewayv2_route" "employee" {
  api_id = aws_apigatewayv2_api.employee_api.id
  route_key = "ANY /employee"
  target = "integrations/${aws_apigatewayv2_integration.lambda.id}"

}

resource "aws_apigatewayv2_stage" "default" {

  api_id = aws_apigatewayv2_api.employee_api.id
  name = "$default"
  auto_deploy = true

}

resource "aws_lambda_permission" "api_gateway" {
  statement_id = "AllowExecutionFromAPIGateway"
  action = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal = "apigateway.amazonaws.com"
  source_arn = "${aws_apigatewayv2_api.employee_api.execution_arn}/*/*"

}
