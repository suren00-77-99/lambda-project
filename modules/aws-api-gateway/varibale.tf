variable "api_name" {
  type = string
}

variable "protocol_type" {
  type    = string
}

variable "description" {
  type    = string
  default = "HTTP API created using Terraform"
}

variable "environment" {
  type    = string
}