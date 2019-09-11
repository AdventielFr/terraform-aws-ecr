variable "aws_region" {
  description = "The aws region to deploy the repository"
  type        = string
}

variable "service" {
  description = "The service name"
  type        = string
}

variable "project" {
  description = " The project name"
  type        = string
}

variable "untagged_duration" {
  description = "The duration in days of conservation of non-versioned images"
  default     = 60
  type        = number
}

variable "tagged_count" {
  description = "The number of versioned image version saved"
  default     = 3
  type        = number
}
