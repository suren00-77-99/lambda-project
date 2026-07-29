module "dynamodb" {
  source = "./modules/dynamodb"
  project_name = "employee-db"
  billing_mode = "PAY_PER_REQUEST"
  hash_key      = "EmployeeID"
  hash_key_type = "S"
  environment = "dev"
}

module "iam" {
  source             = "./modules/iam"
  project_name       = var.project_name
  environment        = var.environment
  dynamodb_table_arn = module.dynamodb.table_arn
}
module "lambda" {
  source = "./modules/lambda"
  project_name = var.project_name
  environment = var.environment
  lambda_function_name = var.lambda_function_name
  runtime = var.lambda_runtime
  handler = var.lambda_handler
  lambda_role_arn = module.iam.lambda_role_arn
  table_name = module.dynamodb.table_name
  source_path = "./lambda"

}

module "apigateway" {
  source = "./modules/apigateway"
  project_name = var.project_name
  environment = var.environment
  lambda_function_name = module.lambda.function_name
  lambda_invoke_arn = module.lambda.invoke_arn
}
module "cloudwatch" {

  source = "./modules/cloudwatch"
  project_name = var.project_name
  environment = var.environment
  lambda_name = module.lambda.function_name
  sns_topic_arn = module.sns.topic_arn
}