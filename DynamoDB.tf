# dynamodb.tf
resource "aws_dynamodb_table" "visitor_count" {
  name         = "visitor-count"      # Your live table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Project = "Cloud-Resume"
  }
}