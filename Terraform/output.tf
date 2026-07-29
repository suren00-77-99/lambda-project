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

output "table_name" {

  value = module.dynamodb.table_name

}

output "table_arn" {

  value = module.dynamodb.table_arn

}

output "lambda_name" {

  value = module.lambda.function_name

}

output "lambda_arn" {

  value = module.lambda.function_arn

}

output "api_url" {

  value = module.apigateway.api_url

}
output "sns_topic" {

  value = module.sns.topic_name

}