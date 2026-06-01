resource "aws_s3_bucket" "raw" {

  bucket = "${var.project_name}-${var.environment}-raw"

  tags = local.common_tags
}

resource "aws_s3_bucket" "processed" {

  bucket = "${var.project_name}-${var.environment}-processed"

  tags = local.common_tags
}

resource "aws_s3_bucket" "analytics" {

  bucket = "${var.project_name}-${var.environment}-analytics"

  tags = local.common_tags
}