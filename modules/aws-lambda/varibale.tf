variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "lambda_role_arn" {
  type = string
}

variable "dynamodb_table_name" {
  type = string
}

variable "lambda_function_name" {}

variable "runtime" {}

variable "handler" {}

variable "table_name" {}

variable "source_path" {}