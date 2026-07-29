resource "aws_cloudwatch_metric_alarm" "lambda_errors" {

  alarm_name = "${var.project_name}-${var.environment}-lambda-errors"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = 1
  metric_name = "Errors"
  namespace = "AWS/Lambda"
  period = 300
  statistic = "Sum"
  threshold = 1
  alarm_description = "Lambda Function Error"
  alarm_actions = [
    var.sns_topic_arn
  ]
  dimensions = {
    FunctionName = var.lambda_name
  }
}

resource "aws_cloudwatch_metric_alarm" "duration" {

  alarm_name = "${var.project_name}-${var.environment}-duration"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 1

  metric_name = "Duration"

  namespace = "AWS/Lambda"

  period = 300

  statistic = "Average"

  threshold = 25000

  alarm_actions = [

    var.sns_topic_arn

  ]

  dimensions = {

    FunctionName = var.lambda_name

  }

}

resource "aws_cloudwatch_metric_alarm" "throttle" {

  alarm_name = "${var.project_name}-${var.environment}-throttle"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 1

  metric_name = "Throttles"

  namespace = "AWS/Lambda"

  period = 300

  statistic = "Sum"

  threshold = 1

  alarm_actions = [

    var.sns_topic_arn

  ]

  dimensions = {

    FunctionName = var.lambda_name

  }

}