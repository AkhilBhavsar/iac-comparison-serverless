output "function_name" {
  value       = aws_lambda_function.this.function_name
  description = "Lambda function name"
}

output "function_arn" {
  value       = aws_lambda_function.this.arn
  description = "Lambda function ARN"
}

output "role_arn" {
  value       = aws_iam_role.lambda_role.arn
  description = "IAM role ARN for Lambda"
}