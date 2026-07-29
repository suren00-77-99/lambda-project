resource "aws_sns_topic" "alerts" {
  name = "${var.project_name}-${var.environment}-alerts"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol = "email"
  endpoint = var.email_address

}
module "sns" {

  source = "./modules/sns"
  project_name = var.project_name
  environment = var.environment
  email_address = var.email_address

}