# terraform {
#     backend "s3" {
#         encrypt = true
#         bucket = "conceptone-uat-terraform-state-bucket"
#         dynamodb_table = "conceptone-uat-terraform-state-lock"
#         region = "us-east-1"
#         key = "terraform.tfstate"
#         skip_credentials_validation = true
#     }
# }
