output "lambda_task_role_arn"{
  value = aws_iam_role.lambda_role.arn
}
output "lambda_task_role_name"{
  value = aws_iam_role.lambda_role.name
}

output "lambda_task_role_id"{
  value = aws_iam_role.lambda_role.id
}