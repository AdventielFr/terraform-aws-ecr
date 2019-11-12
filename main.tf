
resource "aws_ecr_repository" "this" {
  name = "${var.project}-${var.service}"

  tags = {
    Project = var.project
    Service = var.service
  }
}

locals {
  active_tagged_policy = var.tagged_count > 0 && length(var.tag_prefix_list) > 0
}


data "template_file" "template_tagged_policy" {
  template = file("${path.module}/ecr_tagged_policy.tpl")

  vars = {
    tagged_count    = var.tagged_count
    tag_prefix_list = jsonencode(var.tag_prefix_list)
  }
}

data "template_file" "template_untagged_policy" {
  template = file("${path.module}/ecr_untagged_policy.tpl")

  vars = {
    untagged_duration = var.untagged_duration
  }
}

resource "aws_ecr_lifecycle_policy" "tagged_lifecycle_policy" {
  count      = local.active_tagged_policy ? 1 : 0
  repository = aws_ecr_repository.this.name
  policy     = data.template_file.template_tagged_policy.rendered
}

resource "aws_ecr_lifecycle_policy" "untagged_lifecycle_policy" {
  count      = var.untagged_duration > 0 ? 1 : 0
  repository = aws_ecr_repository.this.name
  policy     = data.template_file.template_untagged_policy.rendered
}
