#creating a S3 bucket
resource "aws_s3_bucket" "terraform-jm879" {
  bucket = "my-tf-test-bucket879"

  tags = {
    Name        = "My bucket"
    Environment = "Testing"
  }

}
