{
    "rulePriority": 2,
    "description": "Keep last ${tagged_count} images",
    "selection": {
        "tagStatus": "tagged",
        "countType": "imageCountMoreThan",
        "countNumber": ${tagged_count}
    },
    "action": {
        "type": "expire"
    }
}