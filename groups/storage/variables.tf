variable "aws_account" {
  type        = string
  description = "The name of the AWS account"
}

variable "region" {
  type        = string
  description = "The AWS region in which resources will be created"
}

variable "service" {
  type        = string
  description = "The service name to be used when creating AWS resources"
  default     = "chs-log-scraper"
}

variable "repository" {
  type        = string
  description = "The GitHub repository name to be used for AWS resource tags"
  default     = "chs-log-scraper"
}
