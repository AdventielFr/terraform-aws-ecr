
resource "aws_ecr_repository" "this" {
  name = "${var.project}-${var.service}"

  tags = {
    Project = var.project
    Service = var.service
  }
}

data "template_file" "this" {
  template = file("${path.module}/ecr_policy.tpl")

  vars = {
    tagged_count      = var.tagged_count
    untagged_duration = var.untagged_duration
  }
}

resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name
  policy     = data.template_file.this.rendered
}
