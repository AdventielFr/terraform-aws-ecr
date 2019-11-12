{
    "rules": [
        {
            "rulePriority": 2,
            "description": "Keep last ${tagged_count} images",
            "selection": {
                "tagStatus": "tagged",
                "countType": "imageCountMoreThan",
                "countNumber": ${tagged_count},
                "tagPrefixList" : ${tag_prefix_list}
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}