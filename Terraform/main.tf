module "dynamodb" {
  source = "./modules/aws-dynamodb"

  project_name  = var.project_name
  environment   = var.environment
  billing_mode  = "PAY_PER_REQUEST"
  hash_key      = "EmployeeID"
  hash_key_type = "S"
}

module "iam" {
  source = "./modules/aws-iam"

  project_name       = var.project_name
  environment        = var.environment
  dynamodb_table_arn = module.dynamodb.table_arn
}

module "lambda" {
  source = "./modules/aws-lambda"
  project_name         = var.project_name
  environment          = var.environment
  lambda_function_name = var.lambda_function_name
  runtime              = var.lambda_runtime
  handler              = var.lambda_handler
  lambda_role_arn      = module.iam.lambda_role_arn
  # Required by the lambda module
  dynamodb_table_name  = module.dynamodb.table_name
  source_path          = "../lambda"
}

module "api_gateway" {
  source = "./modules/aws-api-gateway"

  project_name         = var.project_name
  environment          = var.environment
  lambda_function_name = module.lambda.function_name
  lambda_invoke_arn    = module.lambda.invoke_arn
}

module "sns" {
  source = "./modules/aws-sns"

  project_name  = var.project_name
  environment   = var.environment
  email_address = var.email_address
}

module "cloudwatch" {
  source = "./modules/aws-cloudwatch"

  project_name  = var.project_name
  environment   = var.environment
  lambda_name   = module.lambda.function_name
  sns_topic_arn = module.sns.topic_arn
}