output "s3_bucket_arn" {
  value       = aws_s3_bucket.cluster_state.arn
  description = "The ARN of the S3 bucket for keeping the terraform state"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.cluster_state_locks.name
  description = "The name of the DynamoDB table for keeping the state locks"
}