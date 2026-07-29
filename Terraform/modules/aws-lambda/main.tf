data "archive_file" "lambda_zip" {
  type = "zip"
  source_dir = var.source_path
  output_path = "${path.module}/lambda.zip"
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 30

}

resource "aws_lambda_function" "employee_api" {
  function_name = var.lambda_function_name
  role = var.lambda_role_arn
  runtime = var.runtime
  handler = var.handler
  filename = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  timeout = 30
  memory_size = 512
  environment {
    variables = {
      TABLE_NAME = var.dynamodb_table_name
    }
  }
  depends_on = [
    aws_cloudwatch_log_group.lambda_logs
  ]
}