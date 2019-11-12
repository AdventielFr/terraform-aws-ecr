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
| tag\_prefix\_list | Only used if you specified 'tagStatus': 'tagged'. You must specify a comma-separated list of image tag prefixes on which to take action with your lifecycle policy. For example, if your images are tagged as prod, prod1, prod2, and so on, you would use the tag prefix prod to specify all of them. If you specify multiple tags, only the images with all specified tags are selected. | list(string) | \["v", "V"\] |
| tagged\_count | The number of versioned image version saved | number | 0 |
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

  aws_region          = "eu-west-1"
  service             = "you-service"
  project             = "your-project"
  untagged_duration   = "60"
}
