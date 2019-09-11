<p align="center">
  <table>
    <tr>
      <td style="text-align: center; vertical-align: middle;"><img src="_docs/logo_aws.jpg"/></td>
      <td style="text-align: center; vertical-align: middle;"><img src="_docs/logo_adv.jpg"/></td>
    </tr> 
  <table>
</p>

# AWS ECR Terraform module

The purpose of this module is to create a repository for Elastic Amazon Registry.

## Inputs / Outputs

### Inputs

| Name | Description | Type | Default |
|------|-------------|:----:|:-----:|
| aws\_region | The aws region to deploy the repository | string | n/a |
| project | The project name | string | n/a |
| service | The service name | string | n/a |
| tagged\_count | The number of versioned image version saved | number | 3 |
| untagged\_duration | The duration in days of conservation of non-versioned images | number | 60 |

### Outputs

| Name | Description |
|------|-------------|
| registry\_id | The registry ID where the repository was created |
| repository\_arn | The full ARN of the repository |
| repository\_name | The name of the repository |
| repository\_url | The URL of the repository (in the form aws\_account\_id.dkr.ecr.region.amazonaws.com/repositoryName |

## Usage

````
module "module" {
  source  = "git::https://github.com/AdventielFr/terraform-aws-ecr.git?ref=1.0.0"

  aws_region   = "eu-west-1"
  service      = "you-service"
  project      = "your-project"
  tagged_count = "3"
  untagged_duration = "60"
}
