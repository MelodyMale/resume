data "archive_file" "zip_the_python_code" {
  type = "zip"

  source_file = "${path.module}/src/app.py"
  output_path = "${path.module}/function.zip"
}

resource "aws_lambda_function" "visitor_counting" {
  architectures = ["arm64"]
  filename      = "${path.module}/function.zip"
  function_name = "VisitorCounting"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "app.lambda_handler"
  runtime       = "python3.9"
}
