resource "aws_iam_role" "lambda_role" {
  name = "${var.project_name}-${var.environment}-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}
###############################
#CloudWatch Logging Policy
################################
resource "aws_iam_policy" "cloudwatch" {
  name = "${var.project_name}-${var.environment}-cloudwatch"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      }
    ]
  })
}
###############################
# DynamoDB Policy
################################
resource "aws_iam_policy" "dynamodb" {
  name = "${var.project_name}-${var.environment}-dynamodb"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
          "dynamodb:Scan",
          "dynamodb:Query"
        ]
        Resource = var.dynamodb_table_arn
      }
    ]
  })
}

###############################
# SNS policy
################################
resource "aws_iam_policy" "sns" {
  name = "${var.project_name}-${var.environment}-sns"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sns:Publish"
        ]
        Resource = "*"
      }
    ]
  })
}

# attached policys
resource "aws_iam_role_policy_attachment" "cloudwatch" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.cloudwatch.arn

}
resource "aws_iam_role_policy_attachment" "dynamodb" {
  role = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.dynamodb.arn
}
resource "aws_iam_role_policy_attachment" "sns" {
  role = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.sns.arn

}
