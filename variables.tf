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
  default     = 0
  type        = number
}

variable "tag_prefix_list" {
  description = "Only used if you specified 'tagStatus': 'tagged'. You must specify a comma-separated list of image tag prefixes on which to take action with your lifecycle policy. For example, if your images are tagged as prod, prod1, prod2, and so on, you would use the tag prefix prod to specify all of them. If you specify multiple tags, only the images with all specified tags are selected."
  default     = ["v", "V"]
  type        = list(string)
}
