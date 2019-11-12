
resource "aws_ecr_repository" "this" {
  name = "${var.project}-${var.service}"

  tags = {
    Project = var.project
    Service = var.service
  }
}

data "template_file" "this_tagged_count" {
  template = file("${path.module}/ecr_this_tagged_count_policy.tpl")

  vars = {
    tagged_count = var.tagged_count
  }
}

data "template_file" "this_untagged_duration" {
  template = file("${path.module}/ecr_untagged_duration_policy.tpl")

  vars = {
    untagged_duration = var.untagged_duration
  }
}

resource "aws_ecr_lifecycle_tagged_count" "this" {
  count      = var.tagged_count > 0 ? 1 : 0
  repository = aws_ecr_repository.this.name
  policy     = data.template_file.this_tagged_count.rendered
}

resource "aws_ecr_lifecycle_untagged_duration" "this" {
  count      = var.untagged_duration > 0 ? 1 : 0
  repository = aws_ecr_repository.this.name
  policy     = data.template_file.this_untagged_duration.rendered
}
