variable "region" {
  type        = string
  default     = "ap-northeast-1"
  description = "My aws region"
}
variable "project_name" {
  type        = string
  default     = "zomato"
  description = "My project name"
}

variable "project_environment" {
  type        = string
  default     = "production"
  description = "My project environment"
}

variable "ami_id" {
  type        = string
  default     = "ami-07faa35bbd2230d90"
  description = "My ami id"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

locals {
  timestamp = formatdate("YYYY-MM-DD-HH-mm", timestamp() )
  image_name = "${var.project_name}-${var.project_environment}-${local.timestamp}"
}
