# lambda.tf
resource "aws_lambda_function" "visitor_counter" {
  function_name = "Resume-visitor-counter"
  filename      = "dummy.zip"                    # Placeholder; your live function will be imported
  handler       = "Lambda_function.lambda_handler"
  runtime       = "python3.14"
  role          = aws_iam_role.lambda_exec.arn

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.visitor_count.name
    }
  }

  tags = {
    Project = "Cloud-Resume"
  }
}