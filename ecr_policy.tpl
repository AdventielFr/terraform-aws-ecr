{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than ${untagged_duration} days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": ${untagged_duration}
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 2,
            "description": "Keep last ${tagged_count} images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["v"],
                "countType": "imageCountMoreThan",
                "countNumber": ${tagged_count}
            },
            "action": {
                "type": "expire"
            }
        }

    ]
}