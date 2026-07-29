output "lambda_name" {

  value = module.lambda.function_name

}

output "api_url" {

  value = module.apigateway.api_url

}

output "table_name" {

  value = module.dynamodb.table_name

}

output "lambda_role_arn" {

  value = module.iam.lambda_role_arn

}