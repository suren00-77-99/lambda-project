resource "aws_iam_role" "this" {
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
resource "aws_iam_role_policy_attachment" "this" {

  role = aws_iam_role.this.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"

}
resource "aws_iam_role_policy_attachment" "this" {

  role = aws_iam_role.this.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"

}
resource "aws_iam_role_policy_attachment" "this" {

  role = aws_iam_role.this.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"

}
