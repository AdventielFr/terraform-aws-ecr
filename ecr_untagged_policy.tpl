{
    "rulePriority": 1,
    "description": "Expire images older than ${untagged_duration} days",
    "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": ${untagged_duration
        }
    },
    "action": {
        "type": "expire"
    }
}