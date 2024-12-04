resource "aws_s3_bucket" "app" {
  bucket = "thefashionfind-assets"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_policy" "app_policy" {
  bucket = aws_s3_bucket.app.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "s3:GetObject"
        Effect    = "Allow"
        Resource  = "${aws_s3_bucket.app.arn}/*"
        Principal = "*"
      }
    ]
  })
}

resource "aws_s3_bucket_public_access_block" "app_block" {
  bucket                  = aws_s3_bucket.app.id
  block_public_acls       = false
  block_public_policy     = false
  restrict_public_buckets = false
  ignore_public_acls      = false
}


resource "aws_iam_policy" "s3_access" {
  name        = "S3AccessPolicy"
  description = "Policy for accessing thefashionfind-assets bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = ["s3:GetObject"],
        Effect   = "Allow",
        Resource = "${aws_s3_bucket.app.arn}/*"
      }
    ]
  })
}

resource "aws_dynamodb_table" "sessions" {
  name           = "user-sessions"
  hash_key       = "session_id"
  billing_mode   = "PAY_PER_REQUEST"
  attribute {
    name = "session_id"
    type = "S"
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "main-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "main-subnet-group"
  }
}


resource "aws_db_instance" "main" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = var.db_instance_type
  db_name              = "thefashionfind"
  username             = "admin"
  password             = "password123"
  skip_final_snapshot  = true
  publicly_accessible  = false
  db_subnet_group_name = aws_db_subnet_group.main.name
}
