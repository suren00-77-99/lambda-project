data "archive_file" "this" {
  type = "zip"
  source_dir = "${path.root}/lambda-code"
  output_path = "${path.root}/lambda-code/blog.zip"

}

resource "aws_lambda_function" "this" {
  function_name = "${var.project_name}-${var.environment}-blog"
  filename = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  handler = "app.lambda_handler"
  runtime = "python3.12"
  role = var.lambda_role_arn
  timeout = 30
  memory_size = 256
  environment {
    variables = {
      TABLE_NAME = var.dynamodb_table_name
    }
  }
}