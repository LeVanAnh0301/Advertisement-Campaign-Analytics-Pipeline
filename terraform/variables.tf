variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "ads-analytics"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}