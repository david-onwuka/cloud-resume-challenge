# api_gateway.tf
resource "aws_api_gateway_rest_api" "resume_api" {
  name        = "ResumeVisitorAPI"
  description = "API for Cloud Resume visitor counter"
}

# Note: We will import the existing API, Terraform will track it